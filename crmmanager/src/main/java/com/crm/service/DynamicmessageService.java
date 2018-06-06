package com.crm.service;

import com.crm.entity.Dynamicmessages;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DynamicmessageService {

    /**
     * 新增动态信息列
     * @param dynamicmessages   动态信息实体类
     * @return  传值实体类
     */
    Result addDynamicmessage(Dynamicmessages dynamicmessages);

    /**
     * 根据咨询师id查询所有的未打开的动态消息
     * @param askerId   咨询师 id
     * @return  动态消息集合
     */
    List<Dynamicmessages> queryDynamicmessages(String askerId);
    /**
     * 修改消息未已读
     * @param id    消息id
     * @return  受影响的行数
     */
    Result updateDynamicmessage(int id);
}
