package com.crm.controller;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.bean.StudentQuery;
import com.crm.entity.Roles;
import com.crm.entity.Students;
import com.crm.entity.Userroles;
import com.crm.entity.Users;
import com.crm.service.StudentService;
import com.crm.service.UserService;
import com.crm.service.UtilService;
import com.crm.util.ExcelUtil;
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
import org.springframework.web.multipart.MultipartFile;
import sun.nio.cs.US_ASCII;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Api(value = "学生控制器",description = "学生控制器")
@RestController
@RequestMapping("/student")
@PermissionType(value = "student",moduleName = "学生管理")
public class StudentCtroller {
    public static boolean isDistribution=false;//是否自动分配学生 全局
    @Autowired
    private StudentService studentService;
    @Autowired
    private UtilService utilService;
    @Autowired
    private UserService userService;

    @ApiOperation(value = "查询学生",notes = "按条件分页查询学生",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "studentQuery",value = "学生查询实体类",paramType = "StudentQuery"),
    })
    @PermissionMethod(value = "queryStudent",permissionName = "查询学生")
    @GetMapping(value = "queryStudentPaging")
    public Map queryStudent(StudentQuery studentQuery){
        return studentService.queryStudentPaging(studentQuery);
    }
    @ApiOperation(value = "新增学生",notes = "新增学生",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "studentQuery",value = "学生实体类",paramType = "Students"),
    })
    @PermissionMethod(value = "addStudent",permissionName = "新增学生")
    @PostMapping(value = "addStudent")
    public Result addStudent(@RequestBody Students students, HttpSession session){
        Object obj= session.getAttribute("userInfo");
        if(obj==null){
            return new Result(false,"请先登录");
        }
        Map map=(Map) obj;

        String userId= (String) map.get("uid");
        students.setNetPusherId(userId);
        return studentService.addStudent(students);
    }
    @ApiOperation(value = "修改学生的咨询师",notes = "修改学生的咨询师",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "学生id",paramType = "String" ,example = "1"),
            @ApiImplicitParam(name = "askerId",value = "咨询师id",paramType = "String" ,example = "26956c65-0af2-11e7-9a05-408d5cd46d51"),
    })
    @PermissionMethod(value = "updateStudentAsker",permissionName = "修改学生的咨询师")
    @PutMapping("/updateStudentAsker")
    public Result updateStudentAkser(String studentIds,String askerId){
        return studentService.updateStudentAkser(studentIds,askerId);
    }
    @ApiOperation(value = "修改学生信息",notes = "修改学生信息",httpMethod = "PUT")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "students",value = "学生实体类",paramType = "Students" ,example = ""),
    })
    @PermissionMethod(value = "updateStudent",permissionName = "修改学生信息")
    @PutMapping("/updateStudent")
    public Result updateStudent(Students students) throws IOException {
        return studentService.updateStudent(students);
    }

    @ApiOperation(value = "删除学生",notes = "删除学生",httpMethod = "DELETE")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "学生id",paramType = "int" ,example = "1"),
    })
    @PermissionMethod(value = "deleteStudentById",permissionName = "删除学生")
    @DeleteMapping("/deleteStudentById/{id}")
    public Result deleteStudentById(@PathVariable int id){
        return studentService.deleteStudentById(id);
    }

    @ApiOperation(value = "查看是否自动分配",notes = "查看是否自动分配",httpMethod = "GET")
    @PermissionMethod(value = "queryIsDistribution",permissionName = "查看是否自动分配")
    @GetMapping("/queryIsDistribution")
    public boolean queryIsDistribution(){
        return StudentCtroller.isDistribution;
    }

    @ApiOperation(value = "修改自动分配",notes = "修改自动分配",httpMethod = "PUT")
    @PermissionMethod(value = "updateIsDistribution",permissionName = "修改自动分配")
    @PutMapping("/updateIsDistribution")
    public boolean updateIsDistribution(boolean flag){
        StudentCtroller.isDistribution=flag;
        return StudentCtroller.isDistribution;
    }
    @ApiOperation(value = "导出学生为表格",notes = "导出学生为表格",httpMethod = "GET")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "studentQuery",value = "学生查询实体类",paramType = "StudentQuery"),
    })
    @PermissionMethod(value = "expertStudent",permissionName = "导出学生为表格")
    @GetMapping(value = "expertStudent")
    public void expertStudent(HttpServletResponse response, StudentQuery studentQuery){
        List<Students> students= (List<Students>) studentService.queryStudentPaging(studentQuery).get("rows");
        try {
            ExcelUtil.exportExcel(response,"学生.xlsx",students);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "批量导入学生",notes = "批量导入学生",httpMethod = "POST")
    @PermissionMethod(value = "importStudent",permissionName = "批量导入学生")
    @PostMapping("importStudent")
    public Result importUser(@RequestParam("file") MultipartFile file,HttpSession session) throws IOException {
        Object obj= session.getAttribute("userInfo");
        if(obj==null){
            return new Result(false,"请先登录");
        }
        Map map=(Map) obj;

        String userId= (String) map.get("uid");
        Users users=userService.queryUserByUserId(userId);
        LinkedHashMap linkedHashMap=new LinkedHashMap();
        linkedHashMap.put("NetPusherId",userId);
        linkedHashMap.put("CreateUser",users.getLoginName());
        return utilService.impoertExcel("students",Students.class,file,linkedHashMap);

    }

    @ApiOperation(value = "获取学生列checkbox",notes = "获取学生列checkbox",httpMethod = "GET")
    @PermissionMethod(value = "getTemplate",permissionName = "获取学生列checkbox")
    @GetMapping("getTemplate")
    public List<Map> getTemplate(){
        return utilService.CheckBoxClassMapper(Students.class);
    }

    @ApiOperation(value = "下载模板",notes = "下载模板",httpMethod = "GET")
    @PermissionMethod(value = "expertTemplate",permissionName = "下载模板")
    @GetMapping("expertTemplate")
    public void expertTemplate(HttpServletResponse response,String names){
        try {
            ExcelUtil.TemplateExprot(response,"学生模板.xlsx", Arrays.asList(names.split(",")));
        } catch (IOException e) {
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
