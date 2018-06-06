package com.crm.dao;

import com.crm.entity.Roles;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolesMapper {
    /**
     * 根据用户名查询所属角色
     * @param un    用户名
     * @return  角色集合
     */
    List<Roles> queryRolesByUserName(@Param("un") String un);

    /**
     * 查询全部角色
     * @return 角色集合
     */
    List<Roles> queryRoles();

    /**
     * 根据用户名查询不是所属的角色
     * @param un    用户名
     * @return  角色集合
     */
   List<Roles> queryRolesByNoUserName(@Param("un") String un);

    /**
     * 分页查询角色
     * @param roleName 角色名称
     * @param offsex 偏移量
     * @param rows  条数
     * @return  角色实体类
     */
   List<Roles> queryRolesPaging(@Param("roleName") String roleName,@Param("offsex") int offsex,@Param("rows")int rows);

    /**
     * 获取分页查询后不带limit的条数  只能用于分页查询后使用
     * @return  总条数
     */
   int queryRolesPagingRows();

    /**
     * 新增角色
     * @param roles 角色实体类
     * @return 受影响的行数
     */
   int addRole(@Param("role") Roles roles);

    /**
     * 修改角色
     * @param roles 角色实体类
     * @return  受影响的行数
     */
   int updateRole(@Param("role") Roles roles);

    /**
     * 删除角色
     * @param roleId 角色id号
     * @return  受影响的行数
     */
   int deleteRole(@Param("roleId") String roleId);

    /**
     * 根据角色id获取角色对象
     * @param roleId    角色id
     * @return  角色对象
     */
   Roles queryRolesByRoleId(@Param("roleId") String roleId);

    /**
     * 根据用户名查询所属角色
     * @param un    用户名
     * @return  角色集合
     */
    List<Roles> queryRolesByUserNameAll(@Param("un") String un);

}
