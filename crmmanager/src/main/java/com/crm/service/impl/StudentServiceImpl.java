package com.crm.service.impl;

import com.crm.bean.StudentQuery;
import com.crm.controller.StudentCtroller;
import com.crm.dao.AskerMapper;
import com.crm.dao.StudentMapper;
import com.crm.entity.Askers;
import com.crm.entity.Students;
import com.crm.entity.Users;
import com.crm.service.AskerService;
import com.crm.service.RecyclingService;
import com.crm.service.StudentService;
import com.crm.service.UserService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService{
    @Autowired(required = false)
    private StudentMapper studentMapper;
    @Autowired
    private AskerService askerService;
    @Autowired
    private UserService  userService;
    @Autowired
    private RecyclingService recyclingService;
    @Override
    public List<Students> queryStudent(StudentQuery studentQuery) {
        return studentMapper.queryStudent(studentQuery);
    }

    @Override
    public int queryStudentCount() {
        return studentMapper.queryStudentCount();
    }

    @Override
    public Map queryStudentPaging(StudentQuery studentQuery) {
        List<Students> students=queryStudent(studentQuery);
        int total=queryStudentCount();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",students);
        return map;
    }

    @Override
    @Transactional
    public Result addStudent(Students students) {
        String netPusherId=students.getNetPusherId();
        Users users=userService.queryUserByUserId(netPusherId);
        students.setCreateUser(users.getLoginName());
        int id=studentMapper.addStudent(students);
        if(!StudentCtroller.isDistribution){
            return new Result(id>0);
        }
        Askers askers=askerService.queryAskerByCheckOrderWeight();
        if(askers==null){
            int uprow=askerService.updateAskerIsChange();
            if(uprow==0)
                return new Result(id>0);
            //所有签到的咨询师全部修改为是
            //重新查询咨询师
            askers=askerService.queryAskerByCheckOrderWeight();
        }
        Result result=updateStudentAkser(students.getId()+"",askers.getAskerId());
        int row=askerService.updateAskerChangeState(askers.getAskerId(),"否");
        if(id<0||row<0){
            return new Result(false);
        }

        return result;
    }

    @Override
    @Transactional
    public Result updateStudentAkser(String studentIds,String askerId) {

        boolean success=true;
        for (String id : studentIds.split(",")) {
            int row= studentMapper.updateStudentAkser(new Long(id), askerId);
            if(row<0)
                success=false;
        }
        return new Result(success);
    }

    @Override
    public Result updateStudent(Students students) {
        return new Result(studentMapper.updateStudent(students)>0);
    }
    @Override
    public Result deleteStudentById(int studentId) {
        try {
            Students students=getStudent(studentId+"");
            String uuid=recyclingService.addRecycling("students",studentId+"",students.getName());
            return new Result(true);
        }catch (Exception e){
            return new Result(false);
        }
    }

    @Override
    public Result deleteStudentByIdD(int studentId) {
        return new Result(studentMapper.deleteStudentById(studentId)>0);
    }

    @Override
    public Students getStudent(String studentId) {
        return studentMapper.getStudent(studentId);
    }

    @Override
    public int updateStudentAkserIdNull(String akserId) {
        return studentMapper.updateStudentAkserIdNull(akserId);
    }

    @Override
    public int updateStudentnetIdNull(String netId) {
        return studentMapper.updateStudentnetIdNull(netId);
    }
}


