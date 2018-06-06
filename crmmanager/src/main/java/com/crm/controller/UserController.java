package com.crm.controller;

import com.crm.annotation.FifterMethodRecycling;
import com.crm.annotation.PermissionType;
import com.crm.annotation.PermissionMethod;
import com.crm.bean.UsersQuery;
import com.crm.entity.Users;
import com.crm.service.UserService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Api(value = "用户控制器",description = "用户控制器")
@RestController
@RequestMapping("/user")
@PermissionType(value = "user",moduleName = "用户管理")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UtilService utilService;
    @ApiOperation(value = "查询用户",notes="根据条件来查询用户",httpMethod="GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userName",value = "用户名",dataType = "String",paramType = "String",example = "张三"),
            @ApiImplicitParam(name = "beginCreateTime",value = "用户创建时间开始位置",dataType = "Date",paramType = "Date",example = "2016-08-01 12:05:01"),
            @ApiImplicitParam(name = "endCreateTime",value = "用户创建时间结束位置",dataType = "Date",paramType = "Date",example = "2016-08-03 12:05:01"),
            @ApiImplicitParam(name = "isLockout",value = "是否锁定",dataType = "String",paramType = "String",example = "1"),
            @ApiImplicitParam(name = "order",value = "排序字段",dataType = "String",paramType = "String",example = "CreateTime"),
            @ApiImplicitParam(name = "protectEMail",value = "邮箱",dataType = "String",paramType = "String",example = "aaa@qq.com"),
            @ApiImplicitParam(name = "protectMTel",value = "手机号",dataType = "String",paramType = "String",example = "15238311712"),
            @ApiImplicitParam(name = "page",value = "第几页",dataType = "String",paramType = "String",example = "1"),
            @ApiImplicitParam(name = "rows",value = "条数",dataType = "String",paramType = "String",example = "10")
    })
    @GetMapping( "query")
    @PermissionMethod(value = "query",permissionName = "查询用户")
    public Map queryUser(UsersQuery usersQuery){
        return userService.queryUserPaging(usersQuery);
    }
    @ApiOperation(value = "新增用户",notes = "新增加一个用户",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "loginName",value = "用户名",dataType = "String",paramType = "String",example = "张三"),
            @ApiImplicitParam(name = "password",value = "密码",dataType = "String",paramType = "String",example = "张三"),
            @ApiImplicitParam(name = "protectEMail",value = "邮箱",dataType = "String",paramType = "String",example = "aaa@qq.com"),
            @ApiImplicitParam(name = "protectMTel",value = "手机号",dataType = "String",paramType = "String",example = "15238311712")
    })
    @PostMapping("add")
    @PermissionMethod(value = "add",permissionName = "新增用户")
    public Result addUser(@RequestBody() Users users){
        return userService.addUser(users);
    }

    @ApiOperation(value = "用户登陆",notes = "用于用户的登陆 会判断 用户名 密码 和是否锁定",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "un",value = "用户名",dataType = "String",paramType = "String",example = "张三"),
            @ApiImplicitParam(name = "pwd",value = "密码",dataType = "String",paramType = "String",example = "张三"),
    })
    @GetMapping(value="login")
    public Result login(String un, String pwd, HttpServletRequest request, HttpServletResponse response){
        Result result=userService.queryUser(un,pwd);
        if(result.isSuccess()){
            HttpSession session=request.getSession();
            session.setAttribute("userInfo",result.getMessage());
        }
        return result;
    }

    @ApiOperation(value = "用户退出",notes = "用户退出",httpMethod = "DELETE")
    @DeleteMapping(value="exit")
    public  boolean  exit(HttpSession session){
        session.invalidate();
        return true;
    }
    @DeleteMapping("delete/{id}")
    @ApiOperation(value = "删除用户",notes = "用于用户的删除",httpMethod = "DELETE")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "用户id",dataType = "String",paramType = "String",example = "65b648f3-f1e5-4835-9ae3-ca3ea690e4c1"),
    })
    @PermissionMethod(value = "delete",permissionName = "删除用户")
    public Result  deleteUser(@PathVariable String id){
        return userService.deleteUser(id);
    }
    @PutMapping("update/{id}")
    @ApiOperation(value = "修改用户",notes = "用户修改手机和邮箱",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "用户id",dataType = "String",paramType = "String",example = "65b648f3-f1e5-4835-9ae3-ca3ea690e4c1"),
            @ApiImplicitParam(name = "mTel",value = "用户手机号",dataType = "String",paramType = "String",example = "15238311713"),
            @ApiImplicitParam(name = "email",value = "用户邮箱",dataType = "String",paramType = "String",example = "21231@qq.com"),
    })
    @PermissionMethod(value = "updateTelEmail",permissionName = "修改用户")
    public Result updateUser(@PathVariable String id,String mTel,String email){
        return userService.updateUser(id, mTel, email);
    }
    @PutMapping("updateUserField/{id}")
    @ApiOperation(value = "修改用户某一列的值",notes = "用于用户的重置密码锁定等 只能修改一列的值",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "fieldName",value = "字段名称",dataType = "String",paramType = "String",example = "Password"),
            @ApiImplicitParam(name = "fieldValue",value = "字段值",dataType = "String",paramType = "String",example = "qq123"),
            @ApiImplicitParam(name = "id",value = "用户id",dataType = "String",paramType = "String",example = "65b648f3-f1e5-4835-9ae3-ca3ea690e4c1"),
    })
    @PermissionMethod(value = "updateField",permissionName = "修改用户某一列的值")
    public Result updateUserFileid(String fieldName,String fieldValue,@PathVariable String id){
        return userService.updateUserFieldValue(fieldName,fieldValue,id);
    }
    @PostMapping(value = "userSetRole/{userId}")
    @ApiOperation(value = "修改用户的角色",notes = "修改用户的角色  参数flag 为true时 为新增 false为移除角色",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roles",value = "角色集合",dataType = "List",paramType = "List",example = "角色集合"),
            @ApiImplicitParam(name = "flag",value = "标识是新增还是移除",dataType = "boolean",paramType = "boolean",example = "true"),
    })
    @PermissionMethod(value = "updateRole",permissionName = "给用户增加或者移除角色")
    public Result userSetRoles(@PathVariable String userId, String roles,boolean flag) {
        return userService.userSetRoles(userId, roles, flag);
    }

    @ApiOperation(value = "修改用户的密码",notes = "修改用户的密码",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "password",value = "新密码",paramType = "String",example = "qq123456"),
    })
    @PutMapping(value = "updatePassword")
    public Result upadtePssword(String password,HttpSession session){
        Object obj= session.getAttribute("userInfo");
        if(obj==null){
            return new Result(false,"请先登录");
        }
        Map map=(Map) obj;

        String userId= (String) map.get("uid");
        return userService.updateUserPassword(userId,password);
    }

    @ApiOperation(value = "验证密码是否正确",notes = "验证密码是否正确",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "password",value = "旧密码",paramType = "String",example = "qq123456"),
    })
    @GetMapping(value = "validaPssword")
    public Result validaPssword(String password,HttpSession session){
        Object obj= session.getAttribute("userInfo");
        if(obj==null){
            return new Result(false,"请先登录");
        }
        Map map=(Map) obj;

        String userId= (String) map.get("uid");
        return userService.validaOldPassword(userId,password);
    }

    @ApiOperation(value = "导出所有用户表格",notes = "导出所有用户表格",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userName",value = "用户名",dataType = "String",paramType = "String",example = "张三"),
            @ApiImplicitParam(name = "beginCreateTime",value = "用户创建时间开始位置",dataType = "Date",paramType = "Date",example = "2016-08-01 12:05:01"),
            @ApiImplicitParam(name = "endCreateTime",value = "用户创建时间结束位置",dataType = "Date",paramType = "Date",example = "2016-08-03 12:05:01"),
            @ApiImplicitParam(name = "isLockout",value = "是否锁定",dataType = "String",paramType = "String",example = "1"),
            @ApiImplicitParam(name = "order",value = "排序字段",dataType = "String",paramType = "String",example = "CreateTime"),
            @ApiImplicitParam(name = "protectEMail",value = "邮箱",dataType = "String",paramType = "String",example = "aaa@qq.com"),
            @ApiImplicitParam(name = "protectMTel",value = "手机号",dataType = "String",paramType = "String",example = "15238311712"),
            @ApiImplicitParam(name = "page",value = "第几页",dataType = "String",paramType = "String",example = "1"),
            @ApiImplicitParam(name = "rows",value = "条数",dataType = "String",paramType = "String",example = "10")
    })
    @PermissionMethod(value = "expertUser",permissionName = "导出所有用户表格")
    @GetMapping("expertUser")
    public void expertUser(UsersQuery usersQuery,HttpServletResponse response){
        List<Users> users= (List<Users>) userService.queryUserPaging(usersQuery).get("rows");
        try {
            ExcelUtil.exportExcel(response,"用户.xlsx",users);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "批量导入用户",notes = "批量导入用户",httpMethod = "POST")
    @PermissionMethod(value = "importUser",permissionName = "批量导入用户")
    @PostMapping("importUser")
    public Result importUser(@RequestParam("file") MultipartFile file) throws IOException {
        return utilService.impoertExcel("users",Users.class,file,null);

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

    @ApiOperation(value = "判断用户名是否存在",notes = "判断用户名是否存在,存在返回1不存在返回0",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name",value = "用户名",dataType = "String",paramType = "String",example = "张三"),
    })
    @GetMapping("checkUserName")
    public int checkUserName(String name){
        return userService.checkUserName(name);
    }

    @ApiOperation(value = "获取用户列checkbox",notes = "获取用户列checkbox",httpMethod = "GET")
    @PermissionMethod(value = "getTemplate",permissionName = "获取用户列checkbox")
    @GetMapping("getTemplate")
    public List<Map> getTemplate(){
        return utilService.CheckBoxClassMapper(Users.class);
    }

    @ApiOperation(value = "下载模板",notes = "下载模板",httpMethod = "GET")
    @PermissionMethod(value = "expertTemplate",permissionName = "下载模板")
    @GetMapping("expertTemplate")
    public void expertTemplate(HttpServletResponse response,String names){
        try {
            ExcelUtil.TemplateExprot(response,"用户模板.xlsx", Arrays.asList(names.split(",")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
