package com.lightwing.reservation.service.Impl;

import com.lightwing.reservation.dao.AppointmentDao;
import com.lightwing.reservation.dao.BookDao;
import com.lightwing.reservation.dao.StudentDao;
import com.lightwing.reservation.dto.AppointExecution;
import com.lightwing.reservation.entiy.Appointment;
import com.lightwing.reservation.entiy.Book;
import com.lightwing.reservation.entiy.Student;
import com.lightwing.reservation.enums.AppointStateEnum;
import com.lightwing.reservation.exception.AppointException;
import com.lightwing.reservation.exception.NoNumberException;
import com.lightwing.reservation.exception.RepeatAppointException;
import com.lightwing.reservation.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private BookDao bookDao;
    @Autowired
    private AppointmentDao appointmentDao;
    @Autowired
    private StudentDao studentDao;

    @Override
    public Book getById(long bookId) {
        return bookDao.queryById(bookId);
    }

    @Override
    public List<Book> getList() {
        return bookDao.queryAll(0, 1000);
    }

    @Override
    public Student validateStu(Long studentId, Long password) {
        return studentDao.quaryStudent(studentId, password);
    }

    @Override
    public List<Book> getSomeList(String name) {
        return bookDao.querySome(name);
    }

    @Override
    public List<Appointment> getAppointByStu(long studentId) {
        return appointmentDao.quaryAndReturn(studentId);
    }

    @Override
    @Transactional
    public AppointExecution appoint(long bookId, long studentId) {
        // 在Dao的基础上组织逻辑，形成与web成交互用的方法
        try {
            // 返回成功预约的类型。
            int update = bookDao.reduceNumber(bookId); // 减库存
            if (update <= 0) {
                // 已经无库存！
                throw new NoNumberException("no number");
            } else {
                // 执行预约操作
                int insert = appointmentDao.insertAppointment(bookId, studentId);
                if (insert <= 0) {
                    // 重复预约
                    throw new RepeatAppointException("repeat appoint");
                } else {
                    // 预约成功
                    return new AppointExecution(bookId, AppointStateEnum.SUCCESS);
                }
            }
        } catch (NoNumberException e1) {
            throw e1;
        } catch (RepeatAppointException e2) {
            throw e2;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            // 所有编译期异常转换为运行期异常
            throw new AppointException("appoint inner error:" + e.getMessage());
        }
    }
}