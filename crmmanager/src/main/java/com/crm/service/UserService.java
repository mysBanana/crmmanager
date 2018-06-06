package com.crm.service;

import com.crm.bean.UsersQuery;
import com.crm.entity.Roles;
import com.crm.entity.Users;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface UserService {
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
    Result addUser(Users user);

    /**
     * 登录
     * @param un    用户名
     * @param pwd    密码
     * @return  传值实体类
     */
    Result queryUser(String un, String pwd);

    /**
     * 查询用户 返回总条数和符合条件的用户
     * @return  total:总条数  rows:list<Users> 所有用户
     */
    Map queryUserPaging(UsersQuery usersQuery);

    /**
     * 根据用户id 删除一个用户
     * @param id    用户id
     * @return  传值实体类
     */
    Result deleteUser(String id);

    /**
     * 根据用户id 删除一个用户(彻底删除)
     * @param id    用户id
     * @return  传值实体类
     */
    Result deleteUserD(String id);

    /**
     * 修改用户
     * @param id    用户id
     * @param mTel  用户手机号
     * @param email 用户邮箱
     * @return 传值实体类
     */
    Result updateUser(String id,String mTel,String email);

    /**
     *  修改某一字段的值
     * @param fieldName 字段名称
     * @param fieldValue    字段新值
     * @param id    id号
     * @return 传值实体类
     */
    Result updateUserFieldValue(String fieldName,Object fieldValue,String id);

    /**
     * 给用户设置角色
     * @param userId    用户id
     * @param rolesString 角色集合字符串
     * @param flag  标识  true:用户新增角色  false:移除用户的角色
     * @return  传值实体类
     */
    Result userSetRoles(String userId, String rolesString,boolean flag);

    /**
     * 修改用户密码
     * @param userId   用户id
     * @param password  用户新密码
     * @return 传值实体类
     */
    Result updateUserPassword(String userId,String password);

    /**
     * 根据用户id查找用户
     * @param userId   用户id
     * @return  用户对象
     */
    Users queryUserByUserId(String userId);

    /**
     * 验证旧密码是否一致
     * @param userId 用户id
     * @param password  旧密码
     * @return
     */
    Result validaOldPassword(String userId,String password);

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
    int checkUserName(String name);

    /**
     * 修改用户的名称
     * @param name  用户名称
     * @return  受影响的行数
     */
    int updateUserName(String name,String id);
}
