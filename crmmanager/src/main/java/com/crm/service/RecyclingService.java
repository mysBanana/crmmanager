package com.crm.service;

import com.crm.bean.RecyclingQuery;
import com.crm.bean.RecylingReduction;
import com.crm.entity.Recycling;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RecyclingService {
    /**
     * 回收站新增
     * @param recycling 回收站对象
     * @return 受影响的行数
     */
    int addRecycling(Recycling recycling);

    /**
     * 回收站新增
     * @param deleteTable 删除表名
     * @param deleteId  删除id
     * @return 返回新增的uuid
     */
    String addRecycling(String deleteTable,String deleteId);

    /**
     * 回收站新增
     * @param deleteTable 删除表名
     * @param deleteId  删除id
     * @param string0 扩展0
     * @return 返回新增的uuid
     */
    String addRecycling(String deleteTable,String deleteId,String string0);


    /**
     * 分页查询回收站
     * @param recyclingQuery 查询回收站对象
     * @return  回收站集合
     */
    List<Recycling> queryRecycling(RecyclingQuery recyclingQuery);

    /**
     * 查询刚才SQL_CALC_FOUND_ROWS  返回不带limit的总条数
     * @return  条数
     */
    int queryCount();

    /**
     * 分页查询回收站 返回分页显示的数据
     * @param recyclingQuery    回收站查询实体类
     * @return  map total 总条数 rows 实体集合
     */
    Map queryRecyclingPaging(RecyclingQuery recyclingQuery);

    /**
     * 回收站还原
     * @param recylingReduction 回收站还原对象
     * @return  受影响的行数
     */
    int updateReduction(RecylingReduction recylingReduction);

    /**
     * 删除回收站
     * @param recyclingId 回收站id
     * @return  受影响的行数
     */
    int deleteRecycling(String recyclingId);

    /**
     * 还原
     * @param recycling 回收站对象
     * @return 是否成功
     */
    Result reduction(Recycling recycling);

    /**
     * 批量还原
     * @param recyclings 回收站对象集合
     * @return  传值实体类
     */
    Result reductionList(List<Recycling> recyclings);

    /**
     * 修改指定回收的string0列值
     * @param recyclingId  回收站id
     * @param string0   回收站string0值
     * @return 受影响的行数
     */
    Result updateString0Byid(String recyclingId,String string0);

    Result deleteD(Recycling recycling);


}
