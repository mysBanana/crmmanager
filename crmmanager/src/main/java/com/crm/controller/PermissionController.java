package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.Node;
import com.crm.bean.PermissionQuery;
import com.crm.entity.Modules;
import com.crm.entity.Permission;
import com.crm.entity.Roles;
import com.crm.service.PermissionService;
import com.crm.service.RolesService;
import com.crm.service.UtilService;
import com.crm.util.ExcelUtil;
import com.crm.util.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("permission")
@Api(value = "权限控制器",description = "权限控制器")
@PermissionType(value = "permission",moduleName = "权限管理")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @ApiOperation(value = "更新所有权限信息",notes="更新所有权限信息 (管理员可用)",httpMethod="POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "request",value = "请求流",paramType = "HttpServletRequest",example = ""),
    })
    @PermissionMethod(value = "addAll",permissionName = "更新全部权限信息")
    @PostMapping("addAll")
    public Result updatePermission(HttpServletRequest request){
        HttpSession session=request.getSession();
        Map<String,Object> map= (Map) session.getAttribute("userInfo");
        if(map==null)
            return new Result(false,"请先登录");
        List<String> userRoleNames= (List<String>) map.get("roleNames");
        if(userRoleNames.contains("管理员")){
            return permissionService.addPermissions();
        }
        return new Result(false,"此用户不是管理员");
    }
    @ApiOperation(value = "获取所有权限信息",notes="获取所有权限信息",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleId",value = "角色id",paramType = "String",example = "65b648f3-f1e5-4835-9ae3-ca3ea690e4c1"),
    })
    @PermissionMethod(value = "queryAll",permissionName = "获取全部权限信息")
    @GetMapping("queryAll")
    public List<Node> queryPermissionAll(String roleId){
        return permissionService.queryPermissionAll(roleId);
    }
    @ApiOperation(value = "查询当前登录的角色拥有的权限 是否有指定权限value",notes="查询当前登录的角色拥有的权限 是否有指定权限value",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "permissionValue",value = "权限value",paramType = "String",example = "65b648f3-f1e5-4835-9ae3-ca3ea690e4c1"),
    })
    @GetMapping("isThisRolesPermission")
    public Result PermissionValueIsThisRoles(HttpServletRequest request,String permissionValue){
        HttpSession session=request.getSession();
        Object obj= session.getAttribute("userInfo");
        if(obj==null){
            return new Result(false);
        }
        Map map=(Map) obj;
        List<String> roles= (List<String>) map.get("roleNames");
        String roleNames= StringUtils.join(roles.toArray(),",");
        return permissionService.PermissionValueIsThisRoles(roleNames,permissionValue);
    }

    @Deprecated
    @ApiOperation(value = "分页获取权限信息",notes="分页获取权限信息",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "permissionQuery",value = "查询条件",paramType = "PermissionQuery",example = ""),
    })
    @PermissionMethod(value = "queryPaging",permissionName = "分页获取权限信息")
    @GetMapping("queryPaging")
    public Map queryPermissionPagingMain(PermissionQuery permissionQuery) {
        return permissionService.queryPermissionPagingMain(permissionQuery);
    }

    @ApiOperation(value = "根据权限名称查询所有权限",notes="根据权限名称查询所有权限",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "permissionName",value = "权限名称",paramType = "String",example = "新增用户"),
    })
    @PermissionMethod(value = "queryByPermissionName",permissionName = "根据权限名称查询所有权限")
    @GetMapping("queryByPermissionName")
    public Map queryPermissionByPermission(String permissionName,int page,int rows) {
        return permissionService.queryPermissionByPermissionName(permissionName,page,rows);
    }

    @ApiOperation(value = "导出权限为excel",notes = "导出权限为excel",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "permissionName",value = "权限名称",paramType = "String",example = "用户"),
    })
    @PermissionMethod(value = "expertPermission",permissionName = "导出权限为excel")
    @GetMapping("expertPermission")
    public void expertPermission(HttpServletResponse response, String permissionName){
        List<Permission> permissions=permissionService.queryPermissionByName(permissionName);
        try {
            ExcelUtil.exportExcel(response,"权限.xlsx",permissions);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

}
