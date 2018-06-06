package com.crm.service;

import com.crm.entity.Rolepermission;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolePermissionService {
    /**
     * 批量插入角色权限关系表
     * @param  roleId 角色id
     * @param rolepermissions   角色权限实体类集合
     * @return  受影响的行数
     */
    Result addRolesPermissions(String roleId,List<Rolepermission> rolepermissions);
    /**
     * 根据角色id删除角色权限表的所属所有角色权限关系
     * @param roleId 角色id
     * @return  受影响的行数
     */
    int deleteRolePermissions(String roleId);
}
