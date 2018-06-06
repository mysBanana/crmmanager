package com.crm.service.impl;

import com.crm.dao.ChartMapper;
import com.crm.service.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ChartServiceImpl implements ChartService{
    @Autowired(required = false)
    private ChartMapper chartMapper;
    @Override
    public List<Map> getStudentByStuStatusdDstribution() {
        return chartMapper.getStudentByStuStatusdDstribution();
    }

    @Override
    public List<Map> getStudentSourceChannel() {
        return chartMapper.getStudentSourceChannel();
    }

    @Override
    public List<Map> getStateDstribution() {
        return chartMapper.getStateDstribution();
    }

    @Override
    public List<Map> getIsplayDstribution() {
        return chartMapper.getIsplayDstribution();
    }

    @Override
    public List<Map> getAddressDstribution() {
        return chartMapper.getAddressDstribution();
    }
}
