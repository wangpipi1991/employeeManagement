package com.wang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wang.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer>{

}
