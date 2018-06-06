package com.crm.service;

import com.crm.bean.UserCheckQuery;
import com.crm.bean.UsersQuery;
import com.crm.entity.Userchecks;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserCheckService {
    /**
     * 按照条件查询用户签到
     * @param userCheckQuery    用户查询实体类
     * @return  Map rows实体集合 total总条数
     */
    Map queryUserChecksPaging(UserCheckQuery userCheckQuery);

    /**
     * 按照条件查询用户签到
     * @param userCheckQuery    用户查询实体类
     * @return  用户签到集合
     */
    List<Userchecks> queryUserChecks(UserCheckQuery userCheckQuery);

    /**
     * 用户签退
     * @param id    用户签到id
     * @return  受影响的行数
     */
    Result updateuUserCheckOut(@Param("id") String id);

    /**
     * 查询上一个带funrow的查询语句不带limit的总条数
     * @return  总条数
     */
    int queryUserChecksColumns();

    /**
     * 查询用户今天有没有签到和签退
     * @param userId 用户id
     * @param checkState 签到状态  (已签到,已签退)
     * @return  大于0找到 等于0没有找到
     */
    int queryUserCheckTthisTime(String userId,String checkState);

    /**
     * 查询今天用户是否签到和签退
     * @param userId   用户id
     * @return  isCheck 是否签到 isCheckOut 是否签退
     */
    Map queryUserCheckAndCheckOut(String userId);

    /**
     * 用户签到表新增
     * @param userchecks  用户签到实体类
     * @return  受影响的行数
     */
    int addUserCheck(Userchecks userchecks);

    /**
     * 用户签到或者签退
     * @param userId   用户id
     * @param flag  true 签到 false签退
     * @return  是否成功
     */
    boolean userCheckAndCheckOut(String userId,boolean flag);

    /**
     * 根据用户id查询今天用户签到实体
     * @param userId    用户签到id
     * @return  用户签到实体类
     */
    Userchecks  getUserCheckById(String userId);
}
