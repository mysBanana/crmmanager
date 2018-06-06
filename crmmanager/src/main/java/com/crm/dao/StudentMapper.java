package com.crm.dao;

import com.crm.bean.StudentQuery;
import com.crm.entity.Students;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
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
     * 新增学生
     * @param students 学生实体类
     * @return  受影响的行数
     */
    int addStudent(Students students);

    /**
     * 修改学生的咨询师
     * @param id 学生id
     * @param askerId 咨询师id
     * @return  受影响的行数
     */
    int updateStudentAkser(@Param("id") long id,@Param("askerId") String askerId);

    /**
     *  修改学生信息
     * @param students  学生实体类
     * @return  受影响的行数
     */
    int updateStudent(Students students);

    /**
     * 根据学生id删除学生
     * @param studentId 学生id
     * @return  受影响的行数
     */
    int deleteStudentById(int studentId);

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
    int updateStudentAkserIdNull(@Param("askerId") String akserId);

    /**
     * 把网络咨询下所有的学生 清空askerid列
     * @param netId   网络咨询id
     * @return  受影响的行数
     */
    int updateStudentnetIdNull(@Param("netId") String netId);
}
