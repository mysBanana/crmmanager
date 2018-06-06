package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.service.ChartService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@Api(value = "图表控制器",description = "图表控制器")
@RestController
@RequestMapping("/chart")
@PermissionType(value = "chart",moduleName = "图表管理")
public class ChartCtroller {
    @Autowired
    private ChartService chartService;

    @ApiOperation(value = "查询学生的学历分类分布",notes = "查询学生的学历分类分布",httpMethod = "GET")
    @PermissionMethod(value = "getStudentByStuStatusdDstribution",permissionName = "查询学生的学历分类分布")
    @GetMapping("getStudentByStuStatusdDstribution")
    public List<Map> getStudentByStuStatusdDstribution(){
        return  chartService.getStudentByStuStatusdDstribution();
    }

    @ApiOperation(value = "查询学生的来源渠道分类分布",notes = "查询学生的来源渠道分类分布",httpMethod = "GET")
    @PermissionMethod(value = "getStudentSourceChannel",permissionName = "查询学生的来源渠道分类分布")
    @GetMapping("getStudentSourceChannel")
    public List<Map> getStudentSourceChannel(){
        return chartService.getStudentSourceChannel();
    }

    @ApiOperation(value = "查询学生的个人状态分布",notes = "查询学生的个人状态分布",httpMethod = "GET")
    @PermissionMethod(value = "getStateDstribution",permissionName = "查询学生的个人状态分布")
    @GetMapping("getStateDstribution")
    public List<Map> getStateDstribution(){
        return chartService.getStateDstribution();
    }

    @ApiOperation(value = "查询学生的付费情况分布",notes = "查询学生的付费情况分布",httpMethod = "GET")
    @PermissionMethod(value = "getIsplayDstribution",permissionName = "查询学生的付费情况分布")
    @GetMapping("getIsplayDstribution")
    public List<Map> getIsplayDstribution(){
        return chartService.getIsplayDstribution();
    }

    @ApiOperation(value = "查询学生所在城市位置分布",notes = "查询学生所在城市位置分布",httpMethod = "GET")
    @PermissionMethod(value = "getAddressDstribution",permissionName = "查询学生所在城市位置分布")
    @GetMapping("getAddressDstribution")
    public List<Map> getAddressDstribution(){
        return chartService.getAddressDstribution();
    }
}
