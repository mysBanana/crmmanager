package com.crm.dao;

import com.crm.bean.UserCheckQuery;
import com.crm.bean.UsersQuery;
import com.crm.entity.Userchecks;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserCheckMapper {
    /**
     * 按照条件查询用户签到
     * @param userCheckQuery    用户签到查询实体类
     * @return  用户签到集合
     */
    List<Userchecks> queryUserChecks(UserCheckQuery userCheckQuery);


    /**
     * 用户签退
     * @param id    用户签到id
     * @return  受影响的行数
     */
    int updateuUserCheckOut(@Param("id") String id);

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
    int queryUserCheckTthisTime(@Param("userId") String userId,@Param("checkState") String checkState);

    /**
     * 用户签到
     * @param userchecks  用户签到实体类
     * @return  受影响的行数
     */
    int addUserCheck(Userchecks userchecks);

    /**
     * 根据用户id查询今天用户签到实体
     * @param userId    用户签到id
     * @return  用户签到实体类
     */
    Userchecks  getUserCheckById(@Param("userId") String userId);



}
