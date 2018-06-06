package com.crm.service;

import com.crm.bean.NetfollowsQuery;
import com.crm.entity.Netfollows;
import com.crm.util.Result;

import java.util.List;

public interface NetfollowsService {
    /**
     * 跟踪学生
     * @param netfollows  跟踪实体类
     * @return  受影响的行数
     */
    Result addNetfollows(Netfollows netfollows);

    /**
     * 根据学生id获取所有跟踪信息 分页
     * @param studentId 学生id
     * @return  所有跟踪实体类
     */
    Result getNetfollows(int studentId,int page,int rows);

    /**
     * 根据跟踪信息条件类查询 跟踪信息
     * @param netfollowsQuery   查询实体类
     * @return  传值实体类
     */
    Result getNetfollowsByNetfollowsQuery(NetfollowsQuery netfollowsQuery);
}
