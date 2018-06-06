package com.crm.dao;

import java.util.Date;
import java.util.List;

import com.crm.annotation.FifterMethodRecycling;
import com.crm.bean.UsersQuery;
import com.crm.entity.Roles;
import com.crm.entity.Userroles;
import com.crm.entity.Users;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    /**
     * 根据条件搜索用户
     * @param userQuery 用户对象
     * @return  符合条件的用户集合
     */
    List<Users> queryUser(UsersQuery userQuery);

    /**
     * 新增用户
     * @param user 用户对象
     * @return id号
     */
    int addUser(Users user);
    /**
     * 按照名称查询单个用户
     * @param un    用户名
     * @return  用户对象
     */
    Users queryUserByname(@Param("un") String un);

    /**
     * 查询符合条件总条数
     *  注意 要在 queryUser(UsersQuery userQuery) 方法执行完后执行 才能准确获取到符合条件的总条数
     * @return 总条数
     */
    int queryUserCount();

    /**
     * 根据用户Id 删除用户
     * @param id 用户id
     * @return  受影响的行数
     */
    int deleteUser(@Param("id") String id);

    /**
     * 修改用户
     * @param id    用户id
     * @param mTel  用户手机号
     * @param email 用户邮箱
     * @return 受影响的行数
     */
    int updateUser(@Param("id") String id,@Param("mTel")String mTel,@Param("email")String email);

    /**
     *  修改某一字段的值
     * @param fieldName 字段名称
     * @param fieldValue    字段新值
     * @param id    id号
     * @return 受影响的行数
     */
    int updateUserFieldValue(@Param("fieldName")String fieldName,@Param("fieldValue") Object fieldValue,@Param("id") String id);

    /**
     * 用户设置用户角色关系
     * @param list  用户角色关系集合
     * @return  受影响行数
     */
    int userSetRole(List<Userroles> list);
    /**
     * 用户移除用户角色关系
     * @param list  用户角色关系集合
     * @return  受影响行数
     */
    int userRomeveRole(List<String> list);

    /**
     * 用户修改密码
     * @param userName 用户名称
     * @param password  用户新的密码
     * @return  受影响的行数
     */
    int updateUserPassword(@Param("userName") String userName,@Param("password") String password);

    /**
     * 根据用户id查找用户
     * @param userId   用户id
     * @return  用户对象
     */
    Users queryUserByUserId(@Param("userId") String userId);

    /**
     * 查询所有用户
     * @return  用户集合
     */
    List<Users> queryUsersAll();

    /**
     * 根据名称查询是否已有此名称用户
     * @param name 名称
     * @return  0,1 (0:未存在 1:已存在)
     */
    int checkUserName(@Param("name") String name);

    /**
     * 修改用户的名称
     * @param name  用户名称
     * @return  受影响的行数
     */
    int updateUserName(@Param("name") String name,@Param("id") String id);
}

