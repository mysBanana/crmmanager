package com.crm.dao;

import com.crm.bean.RecyclingQuery;
import com.crm.bean.RecylingReduction;
import com.crm.entity.Recycling;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecyclingMapper {
    /**
     * 回收站新增
     * @param recycling 回收站对象
     * @return 受影响的行数
     */
    int addRecycling(Recycling recycling);

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
    int deleteRecycling(@Param("id") String recyclingId);

    /**
     * 修改指定回收的string0列值
     * @param recyclingId  回收站id
     * @param string0   回收站string0值
     * @return 受影响的行数
     */
    int updateString0Byid(@Param("recyclingId") String recyclingId,@Param("string0") String string0);

}
