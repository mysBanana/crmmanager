package com.crm.service.impl;

import com.crm.dao.DynamicmessageMapper;
import com.crm.entity.Dynamicmessages;
import com.crm.entity.Students;
import com.crm.server.SocketServer;
import com.crm.service.DynamicmessageService;
import com.crm.service.StudentService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DynamicmessageServiceImpl implements DynamicmessageService{
    @Autowired(required = false)
    private DynamicmessageMapper dynamicmessageMapper;
    @Autowired
    private StudentService studentService;
    @Override
    public Result addDynamicmessage(Dynamicmessages dynamicmessages) {
        Students student=studentService.getStudent(dynamicmessages.getStudentId()+"");
        String askerId=student.getAskerId();
        int row=dynamicmessageMapper.addDynamicmessage(dynamicmessages);
        SocketServer.sendMessage(dynamicmessages,askerId);
        return new Result(row>0);
    }

    @Override
    public List<Dynamicmessages> queryDynamicmessages(String askerId) {
        return dynamicmessageMapper.queryDynamicmessages(askerId);
    }

    @Override
    public Result updateDynamicmessage(int id) {
        return new Result(dynamicmessageMapper.updateDynamicmessage(id)>0);
    }
}
