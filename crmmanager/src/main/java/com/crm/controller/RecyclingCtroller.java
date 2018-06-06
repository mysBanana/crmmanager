package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.RecyclingQuery;
import com.crm.entity.Recycling;
import com.crm.entity.Roles;
import com.crm.entity.Userroles;
import com.crm.service.RecyclingService;
import com.crm.util.JacksonUtil;
import com.crm.util.Result;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Api(value = "回收站控制器",description = "回收站控制器")
@RestController
@RequestMapping("/recycling")
@PermissionType(value = "recycling",moduleName = "回收站管理")
public class RecyclingCtroller {
    @Autowired
    private RecyclingService recyclingService;

    @ApiOperation(value = "分页查询回收站对象",notes = "分页查询回收站对象",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "recyclingQuery",value = "回收站查询实体类",paramType = "RecyclingQuery" ,example = ""),
    })
    @PermissionMethod(value = "queryRecyclingPaging",permissionName = "分页查询回收站对象")
    @GetMapping( "queryRecyclingPaging")
    public Map queryRecyclingPaging(RecyclingQuery recyclingQuery){
        Map map=recyclingService.queryRecyclingPaging(recyclingQuery);
        return map;
    }

    @ApiOperation(value = "回收站还原",notes = "回收站还原",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "recyclings",value = "回收站实体",paramType = "RecyclingQuery" ,example = ""),
    })
    @PermissionMethod(value = "reductionList",permissionName = "回收站还原")
    @PostMapping( "reductionList")
    public Result reductionList(@RequestBody Recycling recycling){
        return recyclingService.reduction(recycling);
    }

    @ApiOperation(value = "回收名称修改",notes = "回收名称修改",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "reductionId",value = "回收id",paramType = "String" ,example = "116d787a-f2b1-446d-8489-dd0e55d3ba30"),
            @ApiImplicitParam(name = "string0",value = "回收名称",paramType = "String" ,example = "小名"),
    })
    @PermissionMethod(value = "updateString0Byid",permissionName = "回收名称修改")
    @PutMapping( "updateString0Byid/{reductionId}")
    public Result updateString0Byid(@PathVariable String reductionId,String string0){
        return recyclingService.updateString0Byid(reductionId, string0);
    }

    @ApiOperation(value = "回收站删除 彻底删除",notes = "回收站删除 彻底删除",httpMethod = "DELETE")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "recycling",value = "回收站实体",paramType = "RecyclingQuery" ,example = ""),
    })
    @PermissionMethod(value = "deleteDRecyling",permissionName = "回收站删除 彻底删除")
    @DeleteMapping( "deleteDRecyling")
    public Result deleteDRecyling(Recycling recycling){
        return recyclingService.deleteD(recycling);
    }

}
