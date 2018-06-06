package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.entity.Dynamicmessages;
import com.crm.service.DynamicmessageService;
import com.crm.util.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(value = "动态信息控制器",description = "动态信息控制器")
@RestController
@RequestMapping("/dynamicmessage")
@PermissionType(value = "dynamicmessage",moduleName = "动态信息管理")
public class DynamicmessageController {
    @Autowired
    private DynamicmessageService dynamicmessageService;

    @ApiOperation(value = "新增动态消息",notes = "新增动态消息",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "dynamicmessages",value = "动态消息实体类",paramType = "Dynamicmessages" ,example = ""),
    })
    @PermissionMethod(value = "addDynamicmessage",permissionName = "新增动态消息")
    @PostMapping( "addDynamicmessage")
    public Result addDynamicmessage(@RequestBody Dynamicmessages dynamicmessages){
        return dynamicmessageService.addDynamicmessage(dynamicmessages);
    }

    @ApiOperation(value = "根据咨询师的id查询未读消息",notes = "根据咨询师的id查询未读消息",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "askerId",value = "咨询师id",paramType = "String" ,example = "0a32c411-1420-11e7-b0ca-408d5cd46d51"),
    })
    @PermissionMethod(value = "queryDynamicmessagesByAskerId",permissionName = "根据咨询师的id查询未读消息")
    @GetMapping( "queryDynamicmessagesByAskerId")
    public List<Dynamicmessages> queryDynamicmessagesByAskerId(String askerId){
        return dynamicmessageService.queryDynamicmessages(askerId);
    }

    @ApiOperation(value = "修改指定消息为已读",notes = "修改指定消息为已读",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "消息id",paramType = "String" ,example = "1"),
    })
    @PutMapping( "updateDynamicmessage/{id}")
    public Result updateDynamicmessage(@PathVariable int id) {
        return dynamicmessageService.updateDynamicmessage(id);
    }
}
