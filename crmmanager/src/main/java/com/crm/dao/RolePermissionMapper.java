package com.crm.dao;

import com.crm.entity.Rolepermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolePermissionMapper {
    /**
     * 批量插入角色权限关系表
     * @param rolepermissions   角色权限实体类集合
     * @return  受影响的行数
     */
    int addRolesPermissions(List<Rolepermission> rolepermissions);

    /**
     * 根据角色id删除角色权限表的所属所有角色权限关系
     * @param roleId 角色id
     * @return  受影响的行数
     */
    int deleteRolePermissions(@Param("roleId") String roleId);
}
