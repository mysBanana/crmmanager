package com.crm.service.impl;

import com.crm.dao.PermissionMapper;
import com.crm.dao.RolePermissionMapper;
import com.crm.entity.Rolepermission;
import com.crm.service.RolePermissionService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class RolePermissionServiceImpl implements RolePermissionService{
    @Autowired(required = false)
    private RolePermissionMapper rolePermissionMapper;

    @Override
    @Transactional
    public Result addRolesPermissions(String roleId,List<Rolepermission> rolepermissions) {
        int r=deleteRolePermissions(roleId);

        for (Rolepermission rolepermission:rolepermissions) {
            String rolesPermissionsId= UUID.randomUUID().toString();
            rolepermission.setRolePermissionId(rolesPermissionsId);
        }
        if(rolepermissions.size()==0)
            return new Result(true);
        int row=rolePermissionMapper.addRolesPermissions(rolepermissions);
        if(r<0||row<0){
            return new Result(false);
        }
        return new Result(true);
    }

    @Override
    @Transactional
    public int deleteRolePermissions(String roleId) {
        return rolePermissionMapper.deleteRolePermissions(roleId);
    }

}
