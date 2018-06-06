package com.crm.service;

import com.crm.bean.LogginQuery;
import com.crm.entity.LogginPermission;

import java.util.List;
import java.util.Map;

public interface LogginPermissionService {
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
     * 分页查询日志权限
     * @param logginQuery  日志查询实体类
     * @return 日志集合
     */
    Map queryLogginPermissionPaging(LogginQuery logginQuery);

    /**
     * 查询总条数
     * @return
     */
    int queryLogginPermissionColumn();
}
