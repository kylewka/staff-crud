package com.funs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funs.domain.Department;
import com.funs.domain.Msg;
import com.funs.service.DepartmentService;

/**
 * 处理部门信息
 * @author kylewka
 *
 */
@Controller
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;

	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepartments(){
		List<Department> list=departmentService.getAllDept();
		return Msg.success().add("depts", list);
	}
}

