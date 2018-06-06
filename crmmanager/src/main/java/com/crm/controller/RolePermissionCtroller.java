package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.entity.Rolepermission;
import com.crm.service.RolePermissionService;
import com.crm.service.UserService;
import com.crm.util.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Api(value = "角色权限关系控制器",description = "角色权限关系控制器")
@RestController
@RequestMapping("/rolePermission")
@PermissionType(value = "rolePermission",moduleName = "角色权限关系管理")
public class RolePermissionCtroller {
    @Autowired
    private RolePermissionService rolePermissionService;

    @ApiOperation(value = "给角色设置关系",notes = "给角色设置关系",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "permissions",value = "角色权限集合",paramType = "list",example = ""),
    })
    @PermissionMethod(value = "addAll",permissionName = "新增角色权限关系")
    @PostMapping(value="addAll/{roleId}")
    public Result addRolePermissions(@PathVariable String roleId,@RequestBody ArrayList<Rolepermission> permissions){
        return rolePermissionService.addRolesPermissions(roleId,permissions);
    }

}
