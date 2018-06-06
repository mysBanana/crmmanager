package com.crm.service.impl;

import com.crm.dao.AskerMapper;
import com.crm.entity.Askers;
import com.crm.entity.Users;
import com.crm.service.AskerService;
import com.crm.service.StudentService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class AskerServiceImpl implements AskerService{
    @Autowired(required = false)
    private AskerMapper askerMapper;
    @Autowired
    private StudentService studentService;

    @Override
    public List<Askers> queryAskersAll() {
        return askerMapper.queryAskersAll();
    }

    @Override
    public Result queryAskerByAskerId(String askerId) {
        Askers askers=askerMapper.queryAskerByAskerId(askerId);
        if(askers==null)
            return new Result(false,"没有找到咨询师");
        return new Result(true,askers);
    }

    @Override
    public Askers queryAskerByCheckOrderWeight() {
        return askerMapper.queryAskerByCheckOrderWeight();
    }

    @Override
    public int updateAskerChangeState(String askerId, String changeState) {
        return askerMapper.updateAskerChangeState(askerId,changeState);
    }

    @Override
    public List<Askers> queryAskersPaging(String askerName, int offsex, int rows) {
        return askerMapper.queryAskersPaging(askerName, offsex, rows);
    }

    @Override
    public int queryAskersPagingColumn() {
        return askerMapper.queryAskersPagingColumn();
    }

    @Override
    public Map queryAskerPagingMain(String askerName, int page, int rows) {
        List<Askers> askers=queryAskersPaging(askerName, (page-1)*rows, rows);
        int total=queryAskersPagingColumn();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",askers);
        return map;
    }

    @Override
    public Result updateAskerWeightAndContext(String askerId, int weight, String bakContent) {
        return new Result(askerMapper.updateAskerWeightAndContext(askerId, weight, bakContent)>0);
    }

    @Override
    public int updateAskerField(String askerId, String fieldName, Object fieldValue) {
        return askerMapper.updateAskerField(askerId, fieldName, fieldValue);
    }

    @Override
    public int addAsker(Askers askers) {
        return askerMapper.addAsker(askers);
    }

    @Override
    public int deleteAskerByid(String askerId) {
        studentService.updateStudentAkserIdNull(askerId);
        return askerMapper.deleteAskerByid(askerId);
    }

    @Override
    public List<Askers> queryAskersByCheck() {
        return askerMapper.queryAskersByCheck();
    }

    @Override
    public int updateAskerIsChange() {
        return askerMapper.updateAskerIsChange();
    }
}
