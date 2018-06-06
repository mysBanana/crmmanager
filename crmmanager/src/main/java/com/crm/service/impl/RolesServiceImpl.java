package com.crm.service.impl;

import com.crm.dao.RolesMapper;
import com.crm.dao.UserMapper;
import com.crm.entity.Roles;
import com.crm.service.RecyclingService;
import com.crm.service.RolesService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RolesServiceImpl implements RolesService {
    @Autowired(required = false)
    private RolesMapper rolesMapper;
    @Autowired
    private RecyclingService recyclingService;

    @Override
    public List<Roles> queryRolesByUserName(String un) {
        return rolesMapper.queryRolesByUserName(un);
    }

    @Override
    public List<Roles> queryRoles() {
        return rolesMapper.queryRoles();
    }

    @Override
    public List<Roles> queryRolesByNoUserName(String un) {
        return rolesMapper.queryRolesByNoUserName(un);
    }

    @Override
    public Result queryRolesByUserNameAndNoUserName(String un) {
        List<Roles> beLogedRoles=this.queryRolesByUserName(un);
        List<Roles> noBeLogedRoles=null;
        if(beLogedRoles.size()==0)
            noBeLogedRoles=this.queryRoles();
        else
            noBeLogedRoles=this.queryRolesByNoUserName(un);
        if((beLogedRoles.size()==0 && noBeLogedRoles.size()==0)){
            return new Result(false,"获取角色信息失败");
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("beLogedRoles",beLogedRoles);
        map.put("noBeLogedRoles",noBeLogedRoles);
        return new Result(true,map);
    }

    @Override
    public Map queryRolesPaging(String roleName,int page, int rows) {
        List<Roles> roles=rolesMapper.queryRolesPaging(roleName,(page-1)*rows, rows);
        int total=rolesMapper.queryRolesPagingRows();
        Map<String,Object> map=new HashMap<>();
        map.put("total",total);
        map.put("rows",roles);
        return map;
    }
    @Override
    public Result addRole(Roles roles) {
        int row=rolesMapper.addRole(roles);
        return new Result(row>0);
    }

    @Override
    public Result updateRole(Roles roles) {
        return new Result(rolesMapper.updateRole(roles)>0);
    }

    @Override
    public Result deleteRole(String roleId) {
        Roles roles=queryRolesByRoleId(roleId);
        try {
            String uuid=recyclingService.addRecycling("roles",roleId,roles.getName());
            return new Result(true);
        }catch (Exception e){
            return new Result(false);
        }
    }

    @Override
    public Result deleteRoleD(String roleId) {
        return new Result(rolesMapper.deleteRole(roleId)>0);
    }

    @Override
    public Roles queryRolesByRoleId(String roleId) {
        return rolesMapper.queryRolesByRoleId(roleId);
    }

}
