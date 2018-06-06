package com.crm.controller;

import com.crm.annotation.PermissionType;
import com.crm.annotation.PermissionMethod;
import com.crm.entity.Roles;
import com.crm.entity.Users;
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

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Api(value = "角色控制器",description = "角色控制器")
@RestController
@RequestMapping("/role")
@PermissionType(value = "role",moduleName = "角色管理")
public class RoleCtroller {
    @Autowired
    private RolesService rolesService;
    @Autowired
    private UtilService utilService;

    @ApiOperation(value = "查询所有角色",notes="查询所有角色信息",httpMethod="GET")
    @PermissionMethod(value = "query",permissionName = "查询所有角色")
    @GetMapping("query")
    public List<Roles> queryRoles(){
        return rolesService.queryRoles();
    }
    @ApiOperation(value = "查询用户下的角色和不属于用户的角色",notes="查询用户下的角色和不属于用户的角色 用与用户管理中给用户设置角色",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "un",value = "用户名",dataType = "String",paramType = "String",example = "张三"),
    })
    @PermissionMethod(value = "queryUnAndNoqueryUn",permissionName = "查询用户下的角色和不属于用户的角色")
    @GetMapping("queryUnAndNoqueryUn")
    public Result queryRolesByUserNameAndNoUserName(String un){
        return rolesService.queryRolesByUserNameAndNoUserName(un);
    }
    @ApiOperation(value = "分页查询角色",notes="分页查询角色",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleName",value = "角色名称",paramType = "String",example = "a"),
            @ApiImplicitParam(name = "page",value = "当前页数",paramType = "String",example = "1"),
            @ApiImplicitParam(name = "rows",value = "查询条数",paramType = "String",example = "10"),
    })
    @PermissionMethod(value = "queryPaging",permissionName = "分页查询角色")
    @GetMapping("queryPaging")
    public Map  queryRolesPging(String roleName,int page,int rows){
        return rolesService.queryRolesPaging(roleName,page,rows);
    }

    @ApiOperation(value = "新增角色",notes="新增角色(单个)",httpMethod="POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "role",value = "角色对象",paramType = "Roles",example = ""),
    })
    @PostMapping("addRole")
    @PermissionMethod(value = "addRole",permissionName = "新增角色")
    public Result addRole(@RequestBody Roles role){
        return rolesService.addRole(role);
    }
    @ApiOperation(value = "修改角色信息",notes="修改角色信息(单个)",httpMethod="PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "role",value = "角色对象",paramType = "Roles",example = ""),
    })
    @PutMapping("updateRole")
    @PermissionMethod(value = "updateRole",permissionName = "修改角色信息")
    public Result updateRole(@RequestBody Roles roles){
        return rolesService.updateRole(roles);
    }
    @ApiOperation(value = "删除角色",notes="删除角色(单个)",httpMethod="DELETE")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleId",value = "角色Id",paramType = "String",example = ""),
    })
    @DeleteMapping("deleteRole/{roleId}")
    @PermissionMethod(value = "deleteRole",permissionName = "删除角色")
    public Result deleteRole(@PathVariable String roleId){
        return rolesService.deleteRole(roleId);
    }

    @ApiOperation(value = "导出角色为excel",notes="导出角色为excel",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleName",value = "角色名称",paramType = "String",example = "a"),
    })
    @PermissionMethod(value = "expertRoles",permissionName = "导出角色为excel")
    @GetMapping("expertRoles")
    public void   expertRoles(HttpServletResponse response, String roleName, int page, int rows){
        List<Roles> roles= (List<Roles>) rolesService.queryRolesPaging(roleName,page,rows).get("rows");
        try {
            ExcelUtil.exportExcel(response,"角色.xlsx",roles);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "批量导入角色",notes = "批量导入角色",httpMethod = "POST")
    @PermissionMethod(value = "importUser",permissionName = "批量导入角色")
    @PostMapping("importRole")
    public Result importUser(@RequestParam("file") MultipartFile file) throws IOException {
        return utilService.impoertExcel("roles",Roles.class,file,null);

    }

    @ApiOperation(value = "获取角色列checkbox",notes = "获取角色列checkbox",httpMethod = "GET")
    @PermissionMethod(value = "getTemplate",permissionName = "获取角色列checkbox")
    @GetMapping("getTemplate")
    public List<Map> getTemplate(){
        return utilService.CheckBoxClassMapper(Roles.class);
    }

    @ApiOperation(value = "下载模板",notes = "下载模板",httpMethod = "GET")
    @PermissionMethod(value = "expertTemplate",permissionName = "下载模板")
    @GetMapping("expertTemplate")
    public void expertTemplate(HttpServletResponse response,String names){
        try {
            ExcelUtil.TemplateExprot(response,"角色模板.xlsx", Arrays.asList(names.split(",")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
