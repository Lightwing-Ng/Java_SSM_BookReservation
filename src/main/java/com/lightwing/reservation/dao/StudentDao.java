package com.lightwing.reservation.dao;

import com.lightwing.reservation.entiy.Student;
import org.apache.ibatis.annotations.Param;

public interface StudentDao {
    // 向数据库验证输入的密码是否正确
    Student quaryStudent(@Param("studentId") long studentId, @Param("password") long password);
}