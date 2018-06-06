package com.crm.service;

import com.crm.entity.Roles;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RolesService {
    /**
     * 根据用户名查询所属角色
     * @param un    用户名
     * @return  角色集合
     */
    List<Roles> queryRolesByUserName(String un);
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
    List<Roles> queryRolesByNoUserName(String un);

    /**
     * 根据用户名查询 所属的角色集合和不属于用户的角色集合
     * @param un    用户名
     * @return  传值实体类
     */
    Result queryRolesByUserNameAndNoUserName(String un);

    /**
     * 分页查询
     * @param roleName 角色名称
     * @param page 当前页数
     * @param rows  查询条数
     * @return  map集合 total:对应着总条数  rows:查询的角色实体
     */
    Map queryRolesPaging(String roleName,int page, int rows);
    /**
     * 新增角色
     * @param roles 角色实体类
     * @return 传值实体类
     */
    Result addRole(Roles roles);

    /**
     * 角色修改
     * @param roles 角色实体类
     * @return  传值实体类
     */
    Result updateRole(Roles roles);

    /**
     * 根据角色id删除一个角色
     * @param roleId 角色id
     * @return 传值实体类
     */
    Result deleteRole(String roleId);

    /**
     * 根据角色id删除一个角色(彻底删除)
     * @param roleId 角色id
     * @return 传值实体类
     */
    Result deleteRoleD(String roleId);

    /**
     * 根据角色id获取角色对象
     * @param roleId    角色id
     * @return  角色对象
     */
    Roles queryRolesByRoleId(String roleId);
}
