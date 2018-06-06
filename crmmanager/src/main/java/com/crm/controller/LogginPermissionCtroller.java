package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.LogginQuery;
import com.crm.entity.LogginPermission;
import com.crm.entity.Roles;
import com.crm.entity.Users;
import com.crm.service.LogginPermissionService;
import com.crm.util.ExcelUtil;
import com.crm.util.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Api(value = "日志控制器",description = "日志控制器")
@RestController
@RequestMapping("/loggin")
@PermissionType(value = "loggin",moduleName = "日志管理")
public class LogginPermissionCtroller {
    @Autowired
    private LogginPermissionService logginPermissionService;
    @ApiOperation(value = "日志分页查询",notes = "日志分页查询",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "logginQuery",value = "日志查询实体类",dataType = "LogginQuery",paramType = "LogginQuery",example = ""),
    })
    @GetMapping("queryLogginPermissionPaging")
    @PermissionMethod(value = "queryLogginPermissionPaging",permissionName = "日志分页查询")
    public Map queryLogginPermissionPaging(LogginQuery logginQuery){
        return logginPermissionService.queryLogginPermissionPaging(logginQuery);
    }

    @ApiOperation(value = "导出日志为excel",notes="导出日志为excel",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "logginQuery",value = "日志查询实体类",paramType = "LogginQuery",example = ""),
    })
    @PermissionMethod(value = "expertLoggin",permissionName = "导出日志为excel")
    @GetMapping("expertLoggin")
    public void  expertLoggin(HttpServletResponse response, LogginQuery logginQuery){
        List<LogginPermission> logginPermissions= logginPermissionService.queryLogginPermission(logginQuery);
        try {
            ExcelUtil.exportExcel(response,"日志.xlsx",logginPermissions);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
    @InitBinder
    public void InitBinder(WebDataBinder dataBinder)
    {
        dataBinder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            public void setAsText(String value) {
                try {
                    setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
                } catch(ParseException e) {
                    setValue(null);
                }
            }

            public String getAsText() {
                return new SimpleDateFormat("yyyy-MM-dd").format((Date) getValue());
            }

        });
    }
}
