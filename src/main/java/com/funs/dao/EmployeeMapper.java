package com.funs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.funs.domain.Employee;

public interface EmployeeMapper {
	
	
	 //��ѯ���д�������Ϣ��Ա���б�
	List<Employee> selectEmployeeWithDept();
	 
	int insertSelective(Employee record);

	int updateEmployee(@Param("record")Employee employee);

	Employee selectEmployee(Integer id);

	int deleteEmployee(Integer id);

}
