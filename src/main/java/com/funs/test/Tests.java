package com.funs.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.funs.dao.UserMapper;
import com.funs.domain.Department;
import com.funs.domain.Employee;
import com.funs.domain.User;
import com.funs.service.DepartmentService;
import com.funs.service.EmployeeService;
import com.funs.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)//Spirng启动的单元测试模块
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class Tests {
	@Autowired
	UserService userMapper;

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Test
	public void getAllDept() {
		List<Department> list = departmentService.getAllDept();
		for (Department department : list) {
			System.out.println(department);
		}
	}
	
	@Test
	public void updateEmp() {
		employeeService.deleteEmp(402);	
	}
	
	
	@Test
	public void getPassword() {
		String password = userMapper.getPassword("kylewka");
		System.out.println(password);
	}
	
	@Test
	public void addUser() {
		userMapper.addUser(new User("taolem","4565678"));
		String password = userMapper.getPassword("taolem");
		System.out.println(password);
	}
}

