package com.crm.dao;

import com.crm.entity.Userroles;
import org.apache.ibatis.annotations.Param;

public interface UserRolesMapper {
    /**
     * 根据用户id 和 角色id 获取他所属的 用户角色关系id
     * @param userId    用户id
     * @param roleId    角色id
     * @return  用户角色实体类
     */
    Userroles getUserRole(@Param("userId") String userId,@Param("roleId") String roleId);
}
