package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.UserCheckQuery;
import com.crm.dao.UserCheckMapper;
import com.crm.entity.Netfollows;
import com.crm.entity.Userchecks;
import com.crm.entity.Users;
import com.crm.service.UserCheckService;
import com.crm.service.UtilService;
import com.crm.util.ExcelUtil;
import com.crm.util.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Api(value = "用户签到控制器",description = "用户签到控制器")
@RestController
@RequestMapping("/userCheck")
@PermissionType(value = "userCheck",moduleName = "用户签到管理")
public class UserCheckCtroller {
    @Autowired
    private UserCheckService userCheckService;
    @Autowired
    private UtilService utilService;

    @ApiOperation(value = "用户签到分页查询",notes = "用户签到分页查询",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userCheckQuery",value = "查询条件",paramType = "UserCheckQuery",example = ""),
    })
    @PermissionMethod(value = "userCheckQueryPaging",permissionName = "用户签到分页查询")
    @GetMapping(value = "userCheckQueryPaging")
    public Map userCheckQueryPaging(UserCheckQuery userCheckQuery){
        return  userCheckService.queryUserChecksPaging(userCheckQuery);
    }

    @ApiOperation(value = "用户签退",notes = "用户签退",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "用户id",paramType = "String",example = "26956c65-0af2-11e7-9a05-408d5cd46d51"),
    })
    @PutMapping("userCheckOut/{id}")
    public Result userCheckOut(@PathVariable String id){
        return userCheckService.updateuUserCheckOut(id);
    }

    @ApiOperation(value = "查看用户签到和签退状态",notes = "用户签退",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId",value = "用户id",paramType = "String",example = "26956c65-0af2-11e7-9a05-408d5cd46d51"),
    })
    @GetMapping("showUserCheckAndCheckOut/{userId}")
    public Map  showUserCheckAndCheckOut(@PathVariable String userId){
        return userCheckService.queryUserCheckAndCheckOut(userId);
    }

    @ApiOperation(value = "用户签到签退",notes = "用户签到签退",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId",value = "用户id",paramType = "String",example = "26956c65-0af2-11e7-9a05-408d5cd46d51"),
            @ApiImplicitParam(name = "flag",value = "标识是签到还是签退 true:签到 false:签退" + ".",paramType = "boolean",example = "true"),
    })
    @PostMapping("userCheckAndCheckOut/{userId}")
    public boolean userCheckAndCheckOut(@PathVariable String userId,boolean flag){
        return userCheckService.userCheckAndCheckOut(userId,flag);
    }

    @ApiOperation(value = "用户签到导出为表格",notes = "用户签到导出为表格",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userCheckQuery",value = "查询条件",paramType = "UserCheckQuery",example = ""),
    })
    @PermissionMethod(value = "expertUserCheck",permissionName = "用户签到导出为表格")
    @GetMapping(value = "expertUserCheck")
    public void expertUserCheck(HttpServletResponse response,UserCheckQuery userCheckQuery){
        List<Netfollows> netfollows= (List<Netfollows>) userCheckService.queryUserChecksPaging(userCheckQuery).get("rows");
        try {
            ExcelUtil.exportExcel(response,"用户签到.xlsx",netfollows);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }


    @ApiOperation(value = "批量导入用户签到",notes = "批量导入用户签到",httpMethod = "POST")
    @PermissionMethod(value = "importUserCheck",permissionName = "批量导入用户签到")
    @PostMapping("importUserCheck")
    public Result importUser(@RequestParam("file") MultipartFile file) throws IOException {
        return utilService.impoertExcel("userchecks",Userchecks.class,file,null);

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
