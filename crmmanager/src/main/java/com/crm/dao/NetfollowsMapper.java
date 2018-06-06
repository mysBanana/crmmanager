package com.crm.dao;

import com.crm.bean.NetfollowsQuery;
import com.crm.entity.Netfollows;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NetfollowsMapper {
    /**
     * 跟踪学生
     * @param netfollows  跟踪实体类
     * @return  受影响的行数
     */
    int addNetfollows(Netfollows netfollows);

    /**
     * 根据学生id获取所有跟踪信息(分页)
     * @param studentId 学生id
     * @return  所有跟踪实体类
     */
    List<Netfollows> getNetfollows(@Param("id") int studentId,@Param("offsex") int offsex,@Param("rows") int rows);

    /**
     * 查询上一个(查询带SQL_CALC_FOUND_ROWS)不带limit的总条数
     *
     * @return  总条数
     */
    int getNetfollowsCount();

    /**
     *  根据条件查询跟踪信息(分页)
     * @param netfollowsQuery  跟踪消息查询实体类
     * @return  跟踪消息集合
     */
    List<Netfollows> getNetfollowsByNetfollowsQuery(NetfollowsQuery netfollowsQuery);

}
