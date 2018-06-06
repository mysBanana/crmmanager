package com.crm.service.impl;

import com.crm.dao.RoleModuleMapper;
import com.crm.entity.Rolemodules;
import com.crm.service.RoleModuleService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleModuleServiceImpl implements RoleModuleService{
    @Autowired(required = false)
    private RoleModuleMapper roleModuleMapper;
    @Override
    @Transactional
    public int addRoleModules(List<Rolemodules> rolemodules) {
        return roleModuleMapper.addRoleModules(rolemodules);
    }

    @Override
    @Transactional
    public int deleteRoleModules(String roleId) {
        return roleModuleMapper.deleteRoleModules(roleId);
    }

    @Override
    @Transactional
    public Result roleSetModules(List<Rolemodules> rolemodules) {
        if(rolemodules.size()==0){
            return new Result(false,"请选择相应的模块");
        }
        int r=deleteRoleModules(rolemodules.get(0).getRoleId());
        int row=addRoleModules(rolemodules);

        if(r<0||row<0){
            return new Result(false,"设置失败");
        }
        return new Result(true);
    }
}
