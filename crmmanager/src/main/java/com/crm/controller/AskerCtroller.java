package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.entity.Askers;
import com.crm.entity.Roles;
import com.crm.entity.Userchecks;
import com.crm.service.AskerService;
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

@Api(value = "咨询师控制器",description = "咨询师控制器")
@RestController
@RequestMapping("/asker")
@PermissionType(value = "asker",moduleName = "咨询师管理")
public class AskerCtroller {
    @Autowired
    private AskerService askerService;
    @Autowired
    private UtilService utilService;

    @ApiOperation(value = "获取所有咨询师",notes = "获取所有咨询师",httpMethod = "GET")
    @PermissionMethod(value = "queryAskersAll",permissionName = "获取所有咨询师")
    @GetMapping("queryAskersAll")
    public List<Askers> queryAskersAll(){
        return askerService.queryAskersAll();
    }

    @ApiOperation(value = "查询指定咨询师",notes = "查询指定咨询师",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "askerId",value = "咨询师id",paramType = "String" ,example = "0a32c411-1420-11e7-b0ca-408d5cd46d51"),
    })
    @PermissionMethod(value = "queryAskersByAskerId",permissionName = "根据id查询指定咨询师")
    @GetMapping( "queryAskersByAskerId/{askerId}")
    public Result queryAskerByAskerId(@PathVariable String askerId){
        return askerService.queryAskerByAskerId(askerId);
    }

    @ApiOperation(value = "获取所有咨询师分页",notes = "获取所有咨询师分页",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "askerName",value = "咨询师名称",paramType = "String" ,example = "咨询师1"),
            @ApiImplicitParam(name = "page",value = "页数",paramType = "int" ,example = ""),
            @ApiImplicitParam(name = "rows",value = "条数",paramType = "int" ,example = ""),
    })
    @PermissionMethod(value = "queryAskersPaging",permissionName = "获取所有咨询师分页")
    @GetMapping("queryAskersPaging")
    public Map  queryAskersPaging(String askerName,int page,int rows){
        return askerService.queryAskerPagingMain(askerName, page, rows);
    }

    @ApiOperation(value = "修改咨询师的权重和备注",notes = "修改咨询师的权重和备注",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "askerId",value = "咨询师id",paramType = "String" ,example = "咨询师1"),
            @ApiImplicitParam(name = "weight",value = "权重",paramType = "int" ,example = ""),
            @ApiImplicitParam(name = "bakContent",value = "备注",paramType = "String" ,example = ""),
    })
    @PermissionMethod(value = "updateAskerWeightAndContext",permissionName = "修改咨询师的权重和备注")
    @PutMapping("updateAskerWeightAndContext/{askerId}")
    public Result updateAskerWeightAndContext(@PathVariable String askerId,int weight,String bakContent){
        return askerService.updateAskerWeightAndContext(askerId,weight,bakContent);
    }
    @ApiOperation(value = "导出所有咨询师表格",notes = "导出所有咨询师表格",httpMethod = "GET")
    @PermissionMethod(value = "expertAsker",permissionName = "导出所有咨询师表格")
    @GetMapping("expertAsker")
    public void  expertAsker(HttpServletResponse response,String askerName){
        List<Askers> askers= (List<Askers>) askerService.queryAskerPagingMain(askerName,0,0).get("rows");
        try {
            ExcelUtil.exportExcel(response,"咨询师.xlsx",askers);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "批量导入咨询师",notes = "批量导入咨询师",httpMethod = "POST")
    @PermissionMethod(value = "importAsker",permissionName = "批量导入咨询师")
    @PostMapping("importAsker")
    public Result importAsker(@RequestParam("file") MultipartFile file) throws IOException {
        return utilService.impoertExcel("askers",Askers.class,file,null);
    }

    @ApiOperation(value = "获取咨询师列checkbox",notes = "获取咨询师列checkbox",httpMethod = "GET")
    @PermissionMethod(value = "getTemplate",permissionName = "获取咨询师列checkbox")
    @GetMapping("getTemplate")
    public List<Map> getTemplate(){
        return utilService.CheckBoxClassMapper(Askers.class);
    }

    @ApiOperation(value = "下载模板",notes = "下载模板",httpMethod = "GET")
    @PermissionMethod(value = "expertTemplate",permissionName = "下载模板")
    @GetMapping("expertTemplate")
    public void expertTemplate(HttpServletResponse response,String names){
        try {
            ExcelUtil.TemplateExprot(response,"咨询师模板.xlsx", Arrays.asList(names.split(",")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
