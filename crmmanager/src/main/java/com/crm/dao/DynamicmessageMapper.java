package com.crm.dao;

import com.crm.entity.Dynamicmessages;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DynamicmessageMapper {
    /**
     * 新增动态信息列
     * @param dynamicmessages   动态信息实体类
     * @return  受影响的行数
     */
    int addDynamicmessage(Dynamicmessages dynamicmessages);

    /**
     * 根据咨询师id查询所有的未打开的动态消息
     * @param askerId   咨询师 id
     * @return  动态消息集合
     */
    List<Dynamicmessages> queryDynamicmessages(@Param("askerId") String askerId);

    /**
     * 修改消息未已读
     * @param id    消息id
     * @return  受影响的行数
     */
    int updateDynamicmessage(@Param("id") int id);
}
