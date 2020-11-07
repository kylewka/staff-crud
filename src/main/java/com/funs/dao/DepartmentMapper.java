package com.funs.dao;

import java.util.List;

import com.funs.domain.Department;

public interface DepartmentMapper {
	
	//查询所有department部门信息
	List<Department> selectDepartment();
}
