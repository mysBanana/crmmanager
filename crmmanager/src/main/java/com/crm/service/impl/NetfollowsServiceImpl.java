package com.crm.service.impl;

import com.crm.bean.NetfollowsQuery;
import com.crm.dao.NetfollowsMapper;
import com.crm.entity.Netfollows;
import com.crm.service.NetfollowsService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NetfollowsServiceImpl implements NetfollowsService{
    @Autowired(required = false)
    private NetfollowsMapper netfollowsMapper;
    @Override
    public Result addNetfollows(Netfollows netfollows) {
        return new Result(netfollowsMapper.addNetfollows(netfollows)>0);
    }

    @Override
    public Result getNetfollows(int studentId, int page, int rows) {
        List<Netfollows> netfollows=netfollowsMapper.getNetfollows(studentId, (page-1)*rows, rows);
        int total=netfollowsMapper.getNetfollowsCount();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",netfollows);
        return new Result(true,map);
    }

    @Override
    public Result getNetfollowsByNetfollowsQuery(NetfollowsQuery netfollowsQuery) {
        List<Netfollows> netfollows=netfollowsMapper.getNetfollowsByNetfollowsQuery(netfollowsQuery);
        int total=netfollowsMapper.getNetfollowsCount();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",netfollows);
        return new Result(true,map);
    }


}
