package com.crm.controller;

import com.crm.annotation.PermissionType;
import com.crm.annotation.PermissionMethod;
import com.crm.bean.*;
import com.crm.entity.Modules;
import com.crm.entity.Users;
import com.crm.service.ModuleService;
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
import java.util.List;
import java.util.Map;

@Api(value = "模块控制器",description = "模块控制器")
@RestController
@RequestMapping("/module")
@PermissionType(value = "module",moduleName = "模块管理")
public class ModuleController {
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private UtilService utilService;

    @ApiOperation(value = "根据角色名称获取所属的所有模块",notes = "根据角色名称获取所属的所有模块 多个角色名称用,号分开",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleNames",value = "角色名称",paramType = "String",example = "张三"),
    })
    @GetMapping(value = "queryModuleByRoleName")
    public List<Modules> getModules(String roleNames){
        return moduleService.queryModuleByRoleNames(roleNames);
    }

    @ApiOperation(value = "获取所有模块,并选中角色拥有的",notes = "获取所有模块,并选中角色拥有的",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleName",value = "角色名称",paramType = "String",example = "张三"),
    })
    @GetMapping(value = "queryModuleAll")
    @PermissionMethod(value = "queryAll",permissionName = "获取所有模块,并选中角色拥有的")
    public List<ModulesChecked> getModulesAll(String roleName){
        return moduleService.queryModuleAll(roleName);
    }
    @ApiOperation(value = "获取所有模块,并选中角色拥有的",notes = "获取所有模块,并选中角色拥有的",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleName",value = "角色名称",paramType = "String",example = "张三"),
    })
    @GetMapping(value = "queryModuleAllChe")
    @PermissionMethod(value = "queryModuleAllChe",permissionName = "获取所有模块,并选中角色拥有的树,树形")
    public List<ModulesCheckedTreeChe> getModulesAllChe(String roleName){
        return moduleService.queryModuleAllChe(roleName);
    }
    @ApiOperation(value = "获取所有模块 树的数据",notes = "获取所有模块,树的数据",httpMethod = "GET")
    @PermissionMethod(value = "queryModuleTree",permissionName = "获取所有模块,树的数据")
    @GetMapping(value = "queryModuleTree")
    public List<ModulesTree> queryModuleTree(){
        return moduleService.queryModuleAllTree();
    }
    @ApiOperation(value = "新增模块",notes = "新增模块",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "module",value = "模块实体类",paramType = "Modules",example = ""),
    })
    @PermissionMethod(value = "addModule",permissionName = "新增模块")
    @PostMapping("addModule")
    public Result addModule(@RequestBody  Modules module){
        return moduleService.addModule(module);
    }
    @ApiOperation(value = "获取级联模块选择",notes = "获取级联模块选择",httpMethod = "GET")
    @PermissionMethod(value = "getModulesCassade",permissionName = "级联选择父级模块获取的模块")
    @GetMapping("getModulesCassade")
    public List<ModulesCasscadeTree> getModulesCassade(){
        return moduleService.getModulesTreeCascade();
    }
    @ApiOperation(value = "修改模块",notes = "修改模块",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "module",value = "模块实体类",paramType = "Modules",example = ""),
    })
    @PermissionMethod(value = "updateAddModule",permissionName = "修改模块")
    @PutMapping("updateModule")
    public Result updateModule(@RequestBody  Modules module){
        return moduleService.updateModule(module);
    }
    @ApiOperation(value = "删除模块",notes = "删除模块",httpMethod = "DELETE")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "模块id",paramType = "int",example = "5"),
    })
    @PermissionMethod(value = "deleteModule",permissionName = "删除模块")
    @DeleteMapping("deleteModule/{id}")
    public Result deleteModule(@PathVariable long id){
        return moduleService.deleteModules(id);
    }
    @ApiOperation(value = "分页条件查询获取所有模块",notes = "分页条件查询获取所有模块",httpMethod = "GET")
    @PermissionMethod(value = "queryModuleTreePaging",permissionName = "分页条件查询获取所有模块")
    @GetMapping(value = "queryModuleTreePaging")
    public Map queryModuleTreePaging(String moduleName, int page, int rows){
        return moduleService.queryModuleByModuleNamePaging(moduleName,page,rows);
    }

    @ApiOperation(value = "导出模块为excel",notes = "导出模块为excel",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "moduleName",value = "模块名称",paramType = "String",example = "用户模块"),
    })
    @PermissionMethod(value = "expertModule",permissionName = "导出模块为excel")
    @GetMapping("expertModule")
    public void expertModule(HttpServletResponse response,String moduleName){
        List<Modules> modules= moduleService.queryModulesByModuleAll(moduleName);
        try {
            ExcelUtil.exportExcel(response,"模块.xlsx",modules);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "批量导入模块",notes = "批量导入模块",httpMethod = "POST")
    @PermissionMethod(value = "importModule",permissionName = "批量导入模块")
    @PostMapping("importModule")
    public Result importModule(@RequestParam("file") MultipartFile file) throws IOException {
        return utilService.impoertExcel("modules",Modules.class,file,null);
    }

    @ApiOperation(value = "根据模块id返回他的表格树形图数据",notes = "根据模块id返回他的表格树形图数据",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "模块id",paramType = "id",example = "1"),
    })
    @PermissionMethod(value = "getChartTreeById",permissionName = "根据模块id返回他的表格树形图数据")
    @GetMapping("getChartTreeById/{id}")
    public ChartTree getChartTreeById(@PathVariable long id){
        return moduleService.getChartTreeRoute(id);
    }
}
