package com.crm.service.impl;

import com.crm.bean.UserCheckQuery;
import com.crm.bean.UsersQuery;
import com.crm.dao.UserCheckMapper;
import com.crm.entity.Roles;
import com.crm.entity.Userchecks;
import com.crm.entity.Users;
import com.crm.service.AskerService;
import com.crm.service.RolesService;
import com.crm.service.UserCheckService;
import com.crm.service.UserService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class UserCheckServiceImpl implements UserCheckService{
    @Autowired(required = false)
    private UserCheckMapper userCheckMapper;
    @Autowired(required = false)
    private UserService userService;
    @Autowired(required = false)
    private RolesService rolesService;
    @Autowired(required = false)
    private AskerService askerService;
    @Override
    public Map queryUserChecksPaging(UserCheckQuery userCheckQuery) {
        List<Userchecks> userchecks=queryUserChecks(userCheckQuery);
        int total=queryUserChecksColumns();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",userchecks);
        return map;
    }

    @Override
    public List<Userchecks> queryUserChecks(UserCheckQuery userCheckQuery) {
        return userCheckMapper.queryUserChecks(userCheckQuery);
    }

    @Override
    public Result updateuUserCheckOut(String id) {
        return new Result(userCheckMapper.updateuUserCheckOut(id)>0);
    }

    @Override
    public int queryUserChecksColumns() {
        return userCheckMapper.queryUserChecksColumns();
    }

    @Override
    public int queryUserCheckTthisTime(String userId, String checkState) {
        return userCheckMapper.queryUserCheckTthisTime(userId,checkState);
    }

    @Override
    public Map queryUserCheckAndCheckOut(String userId) {

        int checkInt=queryUserCheckTthisTime(userId,"已签到");
        int checkOutInt=queryUserCheckTthisTime(userId,"已签退");
        Map map=new HashMap();
        map.put("isCheck",checkInt>0||checkOutInt>0);
        map.put("isCheckOut",checkOutInt>0);
        return map;
    }

    @Override
    public int addUserCheck(Userchecks userchecks) {
        return userCheckMapper.addUserCheck(userchecks);
    }

    @Override
    @Transactional
    public boolean userCheckAndCheckOut(String userId, boolean flag) {
        Users user=userService.queryUserByUserId(userId);
        List<Roles> roles=rolesService.queryRolesByUserName(user.getLoginName());
        List<String> roleNames=roles.stream().map(Roles::getName).collect(Collectors.toList());
        if(flag){//用户签到
            Userchecks usercheck=new Userchecks();
            usercheck.setUserId(user.getId());
            usercheck.setUserName(user.getLoginName());
            if(roleNames.contains("咨询师")){//咨询师需要在咨询师表也签到
                askerService.updateAskerField(userId,"CheckState","已签到");
                askerService.updateAskerField(userId,"CheckInTime",new Date());
                askerService.updateAskerField(userId,"ChangeState","是");
            }
            return addUserCheck(usercheck)>0;
        }else {//用户签退
            Userchecks usercheck=getUserCheckById(user.getId());
            Result result=updateuUserCheckOut(usercheck.getId()+"");
            if(roleNames.contains("咨询师")){//咨询师需要在咨询师表也签到
                askerService.updateAskerField(userId,"CheckState","已签退");
                askerService.updateAskerField(userId,"ChangeState","否");
            }
            return result.isSuccess();
        }
    }

    @Override
    public Userchecks getUserCheckById(String userId) {
        return userCheckMapper.getUserCheckById(userId);
    }


}
