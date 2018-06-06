package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.NetfollowsQuery;
import com.crm.entity.Netfollows;
import com.crm.entity.Students;
import com.crm.entity.Users;
import com.crm.service.NetfollowsService;
import com.crm.service.UtilService;
import com.crm.util.ExcelUtil;
import com.crm.util.Result;
import com.sun.javafx.collections.MappingChange;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Api(value = "跟踪控制器",description = "跟踪控制器")
@RestController
@RequestMapping("/netfollow")
@PermissionType(value = "netfollow",moduleName = "跟踪管理")
public class NetfollowsCtroller {
    @Autowired
    private NetfollowsService netfollowsService;
    @Autowired
    private UtilService utilService;

    @ApiOperation(value = "新增跟踪学生",notes = "对学生进行跟踪",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "netfollows",value = "跟踪实体类",paramType = "Netfollows",example = ""),
    })
    @PostMapping(value = "addNetFollow")
    @PermissionMethod(value = "addNetFollow",permissionName = "新增跟踪学生")
    public Result addNetfollow(Netfollows netfollows, HttpServletRequest request){
        HttpSession session=request.getSession();
        Object obj= session.getAttribute("userInfo");
        if(obj==null){
            return new Result(false,"请先登录");
        }
        Map map=(Map) obj;

        String userId= (String) map.get("uid");
        netfollows.setUserId(userId);
        return netfollowsService.addNetfollows(netfollows);
    }
    @ApiOperation(value = "根据学生id分页查询所有跟踪信息",notes = "根据学生id分页查询所有跟踪信息",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "studentId",value = "学生id",paramType = "int",example = "1"),
            @ApiImplicitParam(name = "page",value = "页数",paramType = "int",example = "1"),
            @ApiImplicitParam(name = "rows",value = "查询条数",paramType = "int",example = "10"),
    })
    @GetMapping(value = "queryNetFollowByStudentIdPaging/{id}")
    @PermissionMethod(value = "queryNetFollowByStudentIdPaging",permissionName = "根据学生id分页查询所有跟踪信息")
    public Result queryNetfollowByStudentIdPaging(@PathVariable("id") int studentId, int page, int rows){
        return netfollowsService.getNetfollows(studentId, page, rows);
    }

    @ApiOperation(value = "根据条件查询实体类分页查询所有跟踪信息",notes = "根据条件查询实体类分页查询所有跟踪信息",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "netfollowsQuery",value = "跟踪条件查询实体类",paramType = "NetfollowsQuery",example = ""),
    })
    @GetMapping(value = "queryNetFollowsAllByNetfollQuery")
    @PermissionMethod(value = "queryNetFollowsAllByNetfollQuery",permissionName = "根据条件查询实体类分页查询所有跟踪信息")
    public Result getNetfollowsByNetfollowsQueryPaging(NetfollowsQuery netfollowsQuery){
        return netfollowsService.getNetfollowsByNetfollowsQuery(netfollowsQuery);
    }

    @ApiOperation(value = "导出跟踪信息为表格",notes = "导出跟踪信息为表格",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "netfollowsQuery",value = "跟踪条件查询实体类",paramType = "NetfollowsQuery",example = ""),
    })
    @GetMapping(value = "expertNeyfollows")
    @PermissionMethod(value = "expertNeyfollows",permissionName = "导出跟踪信息为表格")
    public void expertNeyfollows(HttpServletResponse response, NetfollowsQuery netfollowsQuery){
        Map map= (Map) netfollowsService.getNetfollowsByNetfollowsQuery(netfollowsQuery).getMessage();
        List<Netfollows> netfollows= (List<Netfollows>) map.get("rows");
        try {
            ExcelUtil.exportExcel(response,"跟踪.xlsx",netfollows);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "批量导入跟踪",notes = "批量导入跟踪",httpMethod = "POST")
    @PermissionMethod(value = "importNetfollow",permissionName = "批量导入跟踪")
    @PostMapping("importNetfollow")
    public Result importNetfollow(@RequestParam("file") MultipartFile file) throws IOException {
        return utilService.impoertExcel("netfollows",Netfollows.class,file,null);

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
