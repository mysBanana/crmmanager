package com.crm.service.impl;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.Node;
import com.crm.bean.PermissionQuery;
import com.crm.bean.PermissionTree;
import com.crm.dao.PermissionMapper;
import com.crm.dao.RolesMapper;
import com.crm.entity.Permission;
import com.crm.service.PermissionService;
import com.crm.util.FileUtil;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

@Service
public class PermissionServiceImpl implements PermissionService{
    @Autowired(required = false)
    private PermissionMapper permissionMapper;

    @Override
    @Transactional
    public  Result addPermissions() {
        Set<Class<?>> clazzs = FileUtil.getClasses("com.crm.controller");
        if (clazzs == null) {
            return new Result(false,"空的包");
        }
        List<Permission> permissions=new ArrayList<>();
        for (Class<?> clazz: clazzs) {
            Method[] methods=clazz.getMethods();
            for (Method m:methods) {
                PermissionMethod permissionMethod=m.getAnnotation(PermissionMethod.class);
                if(permissionMethod!=null){
                    String permissionName=permissionMethod.permissionName();
                    PermissionType permissionType=clazz.getAnnotation(PermissionType.class);
                    if(permissionType==null){
                        return new Result(false,"所属的权限没有对应的模块,权限为:"+permissionName+" 所属模块的类为:"+clazz.getName());
                    }
                    String permissionId=UUID.randomUUID().toString();
                    String permissionModule=permissionType.moduleName();
                    String permissionValue=permissionType.value()+":"+permissionMethod.value();
                    Permission permission=new Permission(permissionId,permissionValue,permissionModule,permissionName);
                    permissions.add(permission);
                }
            }
        }
        int row= 0;
        try {
            row = permissionMapper.addPermission(permissions);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException
        return new Result(true,"已经更新"+row+"条记录");
    }

    @Override
    public List<Node> queryPermissionAll(String roleId) {
        List<Node> nodes=permissionMapper.queryPermissionAll();
        List<Permission> permissions=permissionMapper.queryPermissionByRoleId(roleId);
        UpadteNodeChck(nodes,permissions);
        return nodes;
    }

    @Override
    public List<Permission> queryPermissionByRoleName(String roleNames) {
        return permissionMapper.queryPermissionByRoleName(roleNames);
    }



    /**
     * 选中权限
     * @param nodes 节点值集合
     * @param permissions 拥有的权限
     */
    public static void UpadteNodeChck(List<Node> nodes,List<Permission> permissions){
        for (Node node:nodes) {
            NodeForEach(node,permissions);
        }
    }

    /**
     * 选中权限
     * @param node 节点值
     * @param permissions 拥有的权限
     */
    public static void NodeForEach(Node node,List<Permission> permissions){
        if(node.getId()!=null){
            for (Permission permission:permissions) {
                if(node.getId().equals(permission.getPermissionId())){
                    node.setChecked(true);
                }
            }
        }

        if(node.getChildren()!=null){
            List<Node> nodes =node.getChildren();
            for (Node nod:nodes) {
                NodeForEach(nod,permissions);
            }
        }
    }

    @Override
    public Result PermissionValueIsThisRoles(String roleNames,String permissionValue) {
        List<Permission> permissions = permissionMapper.queryPermissionByRoleName(roleNames);
        for (Permission permission:permissions) {
            if(permission.getPermissionValue().equals(permissionValue)){
                return new Result(true);
            }
        }
        return new Result(false);
    }

    @Override
    public Map queryPermissionPagingMain(PermissionQuery permissionQuery) {
        List<Node> nodes=queryPermissionPaging(permissionQuery);
        int total=queryPermissionPagingCount(permissionQuery.getPermissionName());
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",nodes);
        return map;
    }

    @Override
    public List<Node> queryPermissionPaging(PermissionQuery permissionQuery) {
        return permissionMapper.queryPermissionPaging(permissionQuery);
    }

    @Override
    public int queryPermissionPagingCount(String permssionName) {
        return permissionMapper.queryPermissionPagingCount(permssionName);
    }

    @Override
    public Map queryPermissionByPermissionName(String permissionName,int page,int rows) {

        List<PermissionTree> permissionTrees=permissionMapper.queryGroupByPrmissionAndModuleNameParentPaging(permissionName,(page-1)*rows,rows);
        int total=permissionMapper.queryPermissionByPermissionNameCount();
        for (PermissionTree permissionTree:permissionTrees) {
            String moduleName = permissionTree.getPermissionModule();
            List<Permission> permissionTreeChildrens = permissionMapper.queryGroupByPrmissionAndModuleNameChidrenPaging(permissionName, moduleName);
            permissionTree.setChildren(permissionTreeChildrens);
        }
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",permissionTrees);
        return map;
    }

    @Override
    public List<Permission> queryPermissionByName(String permissionName) {
        return permissionMapper.queryPermissionByName(permissionName);
    }


}
