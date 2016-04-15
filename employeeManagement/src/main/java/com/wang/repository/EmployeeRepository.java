package com.wang.repository;
import com.wang.entity.Employee;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	@Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update Employee em set em.name=:qName, em.pwd=:qPwd, em.email=:qEmail, em.salary=:qSalary,em.department.id=:qDepartmentId, em.hireDate=:qHireDate where em.id=:qId")
    public void updateEmployee(@Param("qName") String name, @Param("qPwd") String pwd, @Param("qEmail") String email, @Param("qSalary") Float salary, @Param("qDepartmentId") Integer departmentId, @Param("qHireDate") String hireDate, @Param("qId") Integer id);
}
