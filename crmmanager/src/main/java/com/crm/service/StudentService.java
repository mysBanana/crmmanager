package com.crm.service;

import com.crm.bean.StudentQuery;
import com.crm.entity.Students;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentService {
    /**
     * 按条件查询学生
     * @param studentQuery  查询学生实体类
     * @return  返回查询的学生
     */
    List<Students> queryStudent(StudentQuery studentQuery);

    /**
     * 查询 按条件查询学生后 不带limit的 总数
     * @return  总条数
     */
    int queryStudentCount();

    /**
     * 按条件查询所有学生
     * @param studentQuery  查询学生实体类
     * @return  total 总条数 rows 学生数据
     */
    Map queryStudentPaging(StudentQuery studentQuery);

    /**
     * 新增学生
     * @param students 学生实体类
     * @return  受影响的行数
     */
    Result addStudent(Students students);

    /**
     * 修改学生的所属咨询师
     * @param studentIds 学生id集合
     * @param askerId 咨询师id
     * @return  传值实体类
     */
    Result  updateStudentAkser(String studentIds,String askerId);

    /**
     * 修改学生信息
     * @param students  学生对象
     * @return  传值实体类
     */
    Result  updateStudent(Students students);

    /**
     * 根据学生id删除学生
     * @param studentId 学生id
     * @return  传值实体类
     */
    Result deleteStudentById(int studentId);

    /**
     * 根据学生id删除学生(彻底删除)
     * @param studentId 学生id
     * @return  传值实体类
     */
    Result deleteStudentByIdD(int studentId);

    /**
     * 根据学生id获取学生
     * @param studentId 学生id
     * @return  学生对象
     */
    Students getStudent(@Param("studentId") String studentId);

    /**
     * 把咨询师下所有的学生 清空askerid列
     * @param akserId   咨询师id
     * @return  受影响的行数
     */
    int updateStudentAkserIdNull(String akserId);

    /**
     * 把网络咨询下所有的学生 清空askerid列
     * @param netId   网络咨询id
     * @return  受影响的行数
     */
    int updateStudentnetIdNull(String netId);
}
