package com.crm.dao;

import com.crm.bean.LogginQuery;
import com.crm.entity.LogginPermission;

import java.util.List;

public interface LogginPermissionMapper {
    /**
     * 新增日志
     * @param logginPermission 日志对象
     * @return 受影响的行数
     */
    int addLogginPermission(LogginPermission logginPermission);

    /**
     * 查询日志权限
     * @param logginQuery  日志查询实体类
     * @return 日志集合
     */
    List<LogginPermission> queryLogginPermission(LogginQuery logginQuery);

    /**
     * 查询总条数
     * @return
     */
    int queryLogginPermissionColumn();
}
