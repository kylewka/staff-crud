package com.funs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funs.dao.DepartmentMapper;
import com.funs.domain.Department;

@Service
public class DepartmentService {

	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<Department> getAllDept(){
		return departmentMapper.selectDepartment();
	}
}
