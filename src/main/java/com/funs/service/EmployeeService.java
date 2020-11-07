package com.funs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funs.dao.EmployeeMapper;
import com.funs.domain.Employee;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;

	
	/**
	 * 查询所有员工信息(带部门信息)
	 * @return
	 */
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectEmployeeWithDept();
	}


	/**
	 * 添加员工方法
	 * @param employee
	 */
	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}


	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateEmployee(employee);
	}


	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		return employeeMapper.selectEmployee(id);
	}


	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteEmployee(id);
	}


	
}
