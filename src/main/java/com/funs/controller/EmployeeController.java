package com.funs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funs.domain.Employee;
import com.funs.domain.Msg;
import com.funs.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWthJson(@RequestParam(value="pn",defaultValue = "1")Integer pn) {
//		// 查询所有(不是分页)
//		// 分页插件pagehelper
//		// 在查询之前只需要调用pagehelper
//		// 传入页面和每页的大小
//		// 获取第pageNum页，10条内容，默认查询全部count(select count)	 
		//pn页码,数字5每页显示的数量
		//startPage方法后面的的这个getAll方法查询到的结果就是分页查询
		PageHelper.startPage(pn, 10);
		List<Employee> list = employeeService.getAll();
//		//使用pageInfo包装查询,只需要将pageInfo交给页面就可以了
//		//封装了详细的分页信息,包括有我们查询出来的数据,传入连续5页显示页数
		PageInfo page = new PageInfo(list,5);
		return Msg.success().add("empInfo", page);
	}
	
	
	/**
	 * 新增员工信息
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method = RequestMethod.POST)
	@ResponseBody
	public Msg addEmp(Employee employee) {
		employeeService.saveEmp(employee);
		return Msg.success();
	}
	

	/**
	 * 查询单个员工信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee=employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	
	/**
	 * 修改员工信息(修改前查出单个员工信息)
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp/{empId}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 删除员工信息(删除单个)
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("id")Integer id) {
		/*
		 * for (String string : id) { System.out.println(string); }
		 */
		employeeService.deleteEmp(id);
		return Msg.success();
	}
	
	@RequestMapping("/emplist")
	public String gotoemplist() {
		return "emplist";
	}
	
	
	@RequestMapping("/deptlist")
	public String gotodeptlist() {
		return "deptlist";
	}
}
