package com.crm.controller;


import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.entity.Rolemodules;
import com.crm.service.RoleModuleService;
import com.crm.util.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Api(value = "角色模块关系控制器",description = "角色模块关系控制器")
@RestController
@RequestMapping("/roleModule")
@PermissionType(value = "roleModule",moduleName = "角色模块关系管理")
public class RoleModuleController {
    @Autowired
    private RoleModuleService roleModuleService;

    @ApiOperation(value = "给角色设置模块",notes = "给角色是指模块",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "rolemodules",value = "模块集合",example = ""),
    })
    @PostMapping(value = "roleSetModule")
    @PermissionMethod(value = "roleSetModule",permissionName = "给角色设置模块")
    public Result roleSetModule(@RequestBody ArrayList<Rolemodules> rolemodules){
        return roleModuleService.roleSetModules(rolemodules);
    }
}
