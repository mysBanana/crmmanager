package com.crm.dao;

import com.crm.bean.Node;
import com.crm.bean.PermissionQuery;
import com.crm.bean.PermissionTree;
import com.crm.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionMapper {
    /**
     * 批量插入权限表
     * @param permissions   权限集合
     * @return 受影响的行数
     */
    int addPermission(List<Permission> permissions);

    /**
     * 根据角色id获取权限中不属于他的权限
     * @param roleId 角色id
     * @return  权限集合
     */
    List<Permission> queryPermissionByNoRoleId(@Param("roleId") String roleId);

    /**
     * 根据角色id获取权限中属于他的权限
     * @param roleId    角色id
     * @return  权限集合
     */
    List<Permission> queryPermissionByRoleId(@Param("roleId") String roleId);

    /**
     * 查询所有权限
     * @return 节点集合
     */
    List<Node> queryPermissionAll();

    /**
     * 查询角色名称中的所有权限信息
     * @param roleNames 角色名称中间用逗号分隔
     * @return  权限集合
     */
    List<Permission> queryPermissionByRoleName(@Param("roleNames") String roleNames);
    @Deprecated
    /**
     * 分页查询权限
     * @return 节点集合
     */
    List<Node> queryPermissionPaging(PermissionQuery permissionQuery);

    @Deprecated
    /**
     * 查询不带limit的总条数 按权限名称查询
     * @return  总条数
     */
    int queryPermissionPagingCount(@Param("permssionName") String permssionName);

    /**
     * 按照权限名称查询所有权限
     * @return 节点集合
     */
    List<Node> queryPermissionByPermissionName(@Param("permissionName") String permissionName);

    /**
     * 查询不带limit的总条数 按权限名称查询
     * @return  总条数
     */
    int queryPermissionByPermissionNameCount();

    /**
     * 根据权限名称分页查询第一级
     * @param permissionName 权限名称
     * @param offsex   偏移量
     * @param rows  条数
     * @return  权限集合
     */
    List<PermissionTree> queryGroupByPrmissionAndModuleNameParentPaging(@Param("permissionName") String permissionName, @Param("offsex") int offsex, @Param("rows") int rows);

    /**
     * 根据权限名称分页查询第二级
     * @param permissionName 权限名称
     * @return  权限集合
     */
    List<Permission> queryGroupByPrmissionAndModuleNameChidrenPaging(@Param("permissionName") String permissionName,@Param("moduleName") String moduleName);

    /**
     * 根据权限名称查询
     * @param permissionName 权限名称
     * @return  权限集合
     */
    List<Permission> queryPermissionByName(@Param("permissionName") String permissionName);
}
