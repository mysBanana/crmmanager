package com.crm.service.impl;

import com.crm.bean.LogginQuery;
import com.crm.dao.LogginPermissionMapper;
import com.crm.entity.LogginPermission;
import com.crm.service.LogginPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LogginPermissionServiceImpl implements LogginPermissionService{
    @Autowired(required = false)
    private LogginPermissionMapper logginPermissionMapper;
    @Override
    public int addLogginPermission(LogginPermission logginPermission) {
        return logginPermissionMapper.addLogginPermission(logginPermission);
    }

    @Override
    public List<LogginPermission> queryLogginPermission(LogginQuery logginQuery) {
        return logginPermissionMapper.queryLogginPermission(logginQuery);
    }

    @Override
    public Map queryLogginPermissionPaging(LogginQuery logginQuery) {
        List<LogginPermission> logginPermissions=queryLogginPermission(logginQuery);
        int total=queryLogginPermissionColumn();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",logginPermissions);
        return map;
    }

    @Override
    public int queryLogginPermissionColumn() {
        return logginPermissionMapper.queryLogginPermissionColumn();
    }
}
