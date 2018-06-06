package com.crm.service.impl;

import com.crm.bean.RecyclingQuery;
import com.crm.bean.RecylingReduction;
import com.crm.dao.RecyclingMapper;
import com.crm.dao.RolesMapper;
import com.crm.entity.Modules;
import com.crm.entity.Recycling;
import com.crm.entity.Roles;
import com.crm.service.*;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class RecyclingServiceImpl implements RecyclingService{
    @Autowired(required = false)
    private RecyclingMapper recyclingMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private RolesService rolesService;
    @Autowired
    private StudentService studentService;
    @Autowired(required = false)
    private RolesMapper rolesMapper;
    @Autowired(required = false)
    private AskerService askerService;

    @Override
    public int addRecycling(Recycling recycling) {
        return recyclingMapper.addRecycling(recycling);
    }

    @Override
    public String addRecycling(String deleteTable, String deleteId) {
        Recycling recycling=new Recycling();
        String  uuid= UUID.randomUUID().toString();
        recycling.setRecylingId(uuid);
        recycling.setDeleteTable(deleteTable);
        recycling.setDeleteId(deleteId);
        addRecycling(recycling);
        return uuid;
    }

    @Override
    public String addRecycling(String deleteTable, String deleteId, String string0) {
        Recycling recycling=new Recycling();
        String uuid = UUID.randomUUID().toString();
        recycling.setRecylingId(uuid);
        recycling.setDeleteTable(deleteTable);
        recycling.setDeleteId(deleteId);
        recycling.setString0(string0);
        addRecycling(recycling);
        return uuid;
    }

    @Override
    public List<Recycling> queryRecycling(RecyclingQuery recyclingQuery) {
        return recyclingMapper.queryRecycling(recyclingQuery);
    }

    @Override
    public int queryCount() {
        return recyclingMapper.queryCount();
    }

    @Override
    public Map queryRecyclingPaging(RecyclingQuery recyclingQuery) {
        List<Recycling> recyclings=queryRecycling(recyclingQuery);
        int total=queryCount();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",recyclings);
        return map;
    }

    @Override
    public int updateReduction(RecylingReduction recylingReduction) {
        return recyclingMapper.updateReduction(recylingReduction);
    }

    @Override
    public int deleteRecycling(String recyclingId) {
        return recyclingMapper.deleteRecycling(recyclingId);
    }

    @Override
    public Result reduction(Recycling recycling) {
        RecylingReduction recylingReduction=new RecylingReduction();
        recylingReduction.setId(recycling.getDeleteId());
        recylingReduction.setTableName(recycling.getDeleteTable());
        recylingReduction.setNameValue(recycling.getString0());
        recylingReduction.setRecyclingId(recycling.getRecylingId());
        String tableName=recylingReduction.getTableName();
        //转换对应的表名称和名字列名
        switch (tableName){
            case "用户":
                tableName="users";
                recylingReduction.setTableName("users");
                break;
            case "角色":
                tableName="roles";
                recylingReduction.setTableName("roles");
                break;
            case "学生":
                tableName="students";
                recylingReduction.setTableName("students");
                break;
            case "模块":
                tableName="modules";
                recylingReduction.setTableName("modules");
                break;
        }
        switch (tableName){
            case "users":
                recylingReduction.setNameColumn("LoginName");
                break;
            case "students":
                recylingReduction.setNameColumn("Name");
                break;
            case "roles":
                recylingReduction.setNameColumn("Name");
                break;
            case "modules":
                recylingReduction.setNameColumn("Name");
                break;
        }

        //用户检查重名
        if(tableName.equals("users")){
            int cz=userService.checkUserName(recylingReduction.getNameValue());
            if(cz==1){
                return new Result(false,recycling,"用户名重名");
            }
        }
        //模块检查重名
        if(tableName.equals("modules")){
            Modules module=moduleService.getModuleByid(new Integer(recylingReduction.getId()));
            List<Modules> modulesList=moduleService.queryModules(module.getParentId());//获取同级模块集合
            List<String> moduleNames=modulesList.stream().map(Modules::getName).collect(Collectors.toList());
            if(moduleNames.contains(recylingReduction.getNameValue()))
                return new Result(false,recycling,"父级模块下已有重名模块");
        }
        int row1=updateReduction(recylingReduction);
        int row2=deleteRecycling(recylingReduction.getRecyclingId());
        return new Result(row1>0||row2>0);
    }

    @Override
    public Result reductionList(List<Recycling> recyclings) {
        boolean isSuccess=true;
        Object message="";
        String remark="";
        for (Recycling r:recyclings) {
            Result re=reduction(r);
            if(!re.isSuccess()){
                isSuccess=false;
                message=re.getMessage();
                remark=re.getRemark();
            }

        }
        return new Result(isSuccess,message,remark);
    }

    @Override
    public Result updateString0Byid(String recyclingId, String string0) {
        return new Result(recyclingMapper.updateString0Byid(recyclingId, string0)>0);
    }

    @Override
    public Result deleteD(Recycling recycling) {
        String tableName=recycling.getDeleteTable();
        Result result=null;
        //转换对应的表名称和名字列名
        switch (tableName){
            case "用户":
            case "users":

                System.out.println(recycling.getString0());
                List<Roles> roles=rolesMapper.queryRolesByUserNameAll(recycling.getRecylingId());
                System.out.println(roles);
                for (Roles role: roles) {
                    if(role.getName().equalsIgnoreCase("咨询师"))
                        askerService.deleteAskerByid(recycling.getDeleteId());
                    if(role.getName().equalsIgnoreCase("网络咨询")){
                        studentService.updateStudentnetIdNull(recycling.getDeleteId());
                    }
                }
                result=userService.deleteUserD(recycling.getDeleteId());
                break;
            case "角色":
            case "roles":
                result=rolesService.deleteRoleD(recycling.getDeleteId());
                break;
            case "学生":
            case "students":
                result=studentService.deleteStudentByIdD(new Integer(recycling.getDeleteId()));
                break;
            case "模块":
            case "modules":
                result=moduleService.deleteModulesD(new Integer(recycling.getDeleteId()));
                break;
        }
        int row2=deleteRecycling(recycling.getRecylingId());
        return result;
    }
}
