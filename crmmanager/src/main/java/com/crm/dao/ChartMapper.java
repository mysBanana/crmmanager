package com.crm.dao;

import java.util.List;
import java.util.Map;

public interface ChartMapper {
    /**
     * 查询学生的学历分类分布
     * @return  StuStaus:学历  num:人数
     */
    List<Map> getStudentByStuStatusdDstribution();

    /**
     * 查询学生 来源渠道 分布情况
     * @return  MsgSource:来源渠道  num:人数
     */
    List<Map> getStudentSourceChannel();

    /**
     * 查询学生 个人状态 分布情况
     * @return  PerState:来源渠道  num:人数
     */
    List<Map> getStateDstribution();

    /**
     * 查询学生 个人状态 分布情况
     * @return  IsPay: 是否付款  num:人数
     */
    List<Map> getIsplayDstribution();

    /**
     * 查询学生 个人状态 分布情况
     * @return  Address: 城市  num:人数
     */
    List<Map> getAddressDstribution();

}
