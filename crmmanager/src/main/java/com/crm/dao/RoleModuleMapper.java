package com.crm.dao;

import com.crm.entity.Rolemodules;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleModuleMapper {

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
    int deleteRoleModules(@Param("roleId") String roleId);

}
