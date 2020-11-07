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
//		// ��ѯ����(���Ƿ�ҳ)
//		// ��ҳ���pagehelper
//		// �ڲ�ѯ֮ǰֻ��Ҫ����pagehelper
//		// ����ҳ���ÿҳ�Ĵ�С
//		// ��ȡ��pageNumҳ��10�����ݣ�Ĭ�ϲ�ѯȫ��count(select count)	 
		//pnҳ��,����5ÿҳ��ʾ������
		//startPage��������ĵ����getAll������ѯ���Ľ�����Ƿ�ҳ��ѯ
		PageHelper.startPage(pn, 10);
		List<Employee> list = employeeService.getAll();
//		//ʹ��pageInfo��װ��ѯ,ֻ��Ҫ��pageInfo����ҳ��Ϳ�����
//		//��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ����������,��������5ҳ��ʾҳ��
		PageInfo page = new PageInfo(list,5);
		return Msg.success().add("empInfo", page);
	}
	
	
	/**
	 * ����Ա����Ϣ
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
	 * ��ѯ����Ա����Ϣ
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
	 * �޸�Ա����Ϣ(�޸�ǰ�������Ա����Ϣ)
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
	 * ɾ��Ա����Ϣ(ɾ������)
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
