package com.crm.service.impl;

import com.crm.bean.UsersQuery;
import com.crm.dao.RolesMapper;
import com.crm.dao.UserMapper;
import com.crm.dao.UserRolesMapper;
import com.crm.entity.Askers;
import com.crm.entity.Roles;
import com.crm.entity.Userroles;
import com.crm.entity.Users;
import com.crm.service.AskerService;
import com.crm.service.RecyclingService;
import com.crm.service.UserService;
import com.crm.util.JacksonUtil;
import com.crm.util.PasswordEncoder;
import com.crm.util.Result;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService{
    @Autowired(required = false)
    private UserMapper userMapper;
    @Autowired(required = false)
    private RolesMapper rolesMapper;
    @Autowired(required = false)
    private UserRolesMapper userRolesMapper;
    @Autowired(required = false)
    private AskerService askerService;
    @Autowired
    private RecyclingService recyclingService;

    @Override
    public List<Users> queryUser(UsersQuery userQuery) {
        return userMapper.queryUser(userQuery);
    }

    @Override
    @Transactional
    public Result addUser(Users user) {
        String id = UUID.randomUUID().toString();
        user.setId(id);
        PasswordEncoder encoder=new PasswordEncoder(user.getLoginName(),"MD5");
        user.setPassword(encoder.encode(user.getPassword()));
        Result result=null;
        try {
            int row=userMapper.addUser(user);
            result=new Result(row>0,id);
        } catch (DuplicateKeyException e) {
            result=new Result(false,"用户名重复,请修改用户名");
            //e.printStackTrace();
        }
        return result;
    }

    @Override
    @Transactional
    public Result queryUser(String un, String pwd) {
        Users user=userMapper.queryUserByname(un);
        Result result;
        PasswordEncoder encoder=new PasswordEncoder(un,"MD5");
        if(user==null){
            //该用户不存在
            result=new Result(false,"用户不存在");
        }
        else if(!user.getPassword().equals(encoder.encode(pwd))){
                //密码错误
                result = new Result(false, "密码错误");
                updateUserFieldValue("PsdWrongTime",user.getPsdWrongTime()+1,user.getId());
                if(user.getPsdWrongTime()+1>=5){
                    updateUserFieldValue("IsLockout","是",user.getId());
                    SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String datetime = tempDate.format(new java.util.Date());
                    updateUserFieldValue("LockTime",datetime,user.getId());
                    result=new Result(false,"该用户已被锁定,请联系管理员解锁");
                }
        }
        else if(user.getIsLockout().equals("是")){
            //已锁定
            result=new Result(false,"该用户已被锁定,请联系管理员解锁");
        }
        else{
            //用户数据正确,获取角色信息
            userMapper.updateUserFieldValue("PsdWrongTime","0",user.getId());//
            List<Roles> roles=rolesMapper.queryRolesByUserName(un);
            List<String> roleNames =roles.stream().map(Roles::getName).collect(Collectors.toList());
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("roleNames",roleNames);
            map.put("uid",user.getId());
            //修改最后登录时间
            userMapper.updateUserFieldValue("LastLoginTime",new Date(),user.getId());
            result=new Result(true,map,user.getLoginName());
        }
        return result;
    }

    @Override
    public Map queryUserPaging(UsersQuery usersQuery){
        Map map=new HashMap();
        List<Users> users=userMapper.queryUser(usersQuery);
        int total=userMapper.queryUserCount();
        map.put("total",total);
        map.put("rows",users);
        return map;
    }

    @Override
    @Transactional
    public Result deleteUser(String id) {
        try {
            Users users=queryUserByUserId(id);
            String uuid=recyclingService.addRecycling("users",id,users.getLoginName());
            updateUserName(uuid,id);
            return new Result(true);
        }catch (Exception e){
            return new Result(false);
        }

    }

    @Override
    public Result deleteUserD(String id) {
        Users users=queryUserByUserId(id);

        return new Result(userMapper.deleteUser(id)>0);
    }

    @Override
    @Transactional
    public Result updateUser(String id, String mTel, String email) {
        return new Result(userMapper.updateUser(id, mTel, email)>0);
    }

    @Override
    @Transactional
    public Result updateUserFieldValue(String fieldName, Object fieldValue, String id) {
        if(fieldName.equalsIgnoreCase("IsLockout")&&fieldValue.toString().equalsIgnoreCase("否")){
            //解锁用户
            userMapper.updateUserFieldValue("PsdWrongTime","0",id);
        }
        if(fieldName.equalsIgnoreCase("Password")){
            Users user=queryUserByUserId(id);
            PasswordEncoder encoderMd5 = new PasswordEncoder(user.getLoginName(), "MD5");
            String newPassword= encoderMd5.encode(fieldValue.toString());
            userMapper.updateUserFieldValue("IsLockout", "否", id);
            return new Result(userMapper.updateUserFieldValue(fieldName, newPassword, id)>0);
        }
        return new Result(userMapper.updateUserFieldValue(fieldName, fieldValue, id)>0);
    }

    @Override
    @Transactional
    public Result userSetRoles(String userId, String rolesString,boolean flag)   {
        List<Userroles> userroles=new ArrayList<Userroles>();
        JavaType javaType = JacksonUtil.getCollectionType(ArrayList.class, Roles.class);
        List<Roles> roles = null;
        try {
            roles = new ObjectMapper().readValue(rolesString, javaType);
        } catch (IOException e) {
            e.printStackTrace();
            return new Result(false);
        }
        int row=-1;
        Users users=queryUserByUserId(userId);
        if(flag){
            for (Roles role: roles) {
                String userrolesId=UUID.randomUUID().toString();
                Userroles userrole=new Userroles();
                userrole.setId(userrolesId);
                userrole.setUserId(userId);
                userrole.setRoleId(role.getId());
                userroles.add(userrole);
                if(role.getName().equals("咨询师")){
                    Askers askers=new Askers();
                    askers.setAskerId(userId);
                    askers.setAskerName(users.getLoginName());
                    askerService.addAsker(askers);
                }
            }
            row=userMapper.userSetRole(userroles);
        }
        else {
            for (Roles role: roles) {
                if(role.getName().equals("咨询师")){
                    askerService.deleteAskerByid(userId);
                }
            }
            List<String> rolesIds=roles.stream().map(Roles::getId).collect(Collectors.toList());
            for (String rolesId: rolesIds) {
                userroles.add(userRolesMapper.getUserRole(userId,rolesId));
            }
            List<String> userrolesId=userroles.stream().map(Userroles::getId).collect(Collectors.toList());
            row=userMapper.userRomeveRole(userrolesId);
        }
        return new Result(row>0);
    }

    @Override
    public Result updateUserPassword(String userId,String password){
        Users user=queryUserByUserId(userId);
        PasswordEncoder encoderMd5 = new PasswordEncoder(user.getLoginName(), "MD5");
        String newPassword= encoderMd5.encode(password);
        return new Result(userMapper.updateUserPassword(user.getLoginName(), newPassword)>0);
    }

    @Override
    public Users queryUserByUserId(String userId) {
        return userMapper.queryUserByUserId(userId);
    }

    @Override
    public Result validaOldPassword(String userId, String password) {
        Users user=queryUserByUserId(userId);
        PasswordEncoder encoderMd5 = new PasswordEncoder(user.getLoginName(), "MD5");
        String newPassword= encoderMd5.encode(password);
        boolean va=user.getPassword().equals(newPassword);
        return new Result(va);
    }

    @Override
    public List<Users> queryUsersAll() {
        return userMapper.queryUsersAll();
    }

    @Override
    public int checkUserName(String name) {
        return userMapper.checkUserName(name);
    }

    @Override
    public int updateUserName(String name, String id) {
        return userMapper.updateUserName(name,id);
    }


}
