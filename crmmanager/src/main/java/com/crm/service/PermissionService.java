package com.crm.service;

import com.crm.bean.Node;
import com.crm.bean.PermissionQuery;
import com.crm.entity.Permission;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

public interface PermissionService {
    /**
     * 更新全部权限
     * @return  传值实体类
     */
    Result addPermissions();

    /**
     * 获取所有权限
     * @return  权限节点集合
     */
    List<Node>  queryPermissionAll(String roleId);

    /**
     * 查询角色名称中的所有权限信息
     * @param roleNames 角色名称中间用逗号分隔
     * @return  权限集合
     */
    List<Permission> queryPermissionByRoleName(String roleNames);

    /**
     * 获取当前登录的角色名集合 是否有权限操作
     * @param permissionValue   权限value
     * @return  传值实体类
     */
    Result PermissionValueIsThisRoles(String roleNames,String permissionValue);
    @Deprecated
    /**
     * 分页查询权限
     * @return 传值实体类
     */
    Map queryPermissionPagingMain(PermissionQuery permissionQuery);

    @Deprecated
    /**
     * 分页查询权限
     * @return 节点集合
     */
    List<Node> queryPermissionPaging(PermissionQuery permissionQuery);
    @Deprecated
    /**
     * 查询不带limit的总条数 按权限名称查询
     * @return  总条数
     */
    int queryPermissionPagingCount(String permssionName);

    /**
     * 按照权限名称查询所有权限
     * @return 节点集合
     */
    Map queryPermissionByPermissionName(String permissionName,int page,int rows);

    /**
     * 根据权限名称查询
     * @param permissionName 权限名称
     * @return  权限集合
     */
    List<Permission> queryPermissionByName(String permissionName);
}
