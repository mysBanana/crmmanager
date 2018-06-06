package com.crm.service;

import com.crm.entity.Rolemodules;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleModuleService {
    /**
     * 给角色设置模块
     * @param rolemodules   角色模块关系集合
     * @return  受影响的行数
     */
    int addRoleModules(List<Rolemodules> rolemodules);

    /**
     * 把角色模块关系表中所有属于该角色的全部删除
     * @param roleId    角色id
     * @return  受影响的行数
     */
    int deleteRoleModules(String roleId);

    /**
     * 给角色设置的模块
     * @param rolemodules 角色模块关系表
     * @return  传值实体类
     */
    Result roleSetModules(List<Rolemodules> rolemodules);
}
