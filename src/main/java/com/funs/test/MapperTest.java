package com.funs.test;

import java.io.IOException;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.funs.dao.DepartmentMapper;
import com.funs.dao.EmployeeMapper;
import com.funs.domain.Employee;


/**
 * 测试dao层的工作
 * @author kylewka
 *推荐Spring的项目可以使用单元测试，可以自动注入我们需要的组件
 *1、导入SpringTest模块
 *2、@ContextConfiguration指定Spring配置文件的位置
 *3、直接autowired要使用的组件
 */


@RunWith(SpringJUnit4ClassRunner.class)//Spirng启动的单元测试模块
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper; 
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	/**
	 * 测试Department
	 * @throws IOException 
	 */
	@Test
	public void testCRUD() {
		//1.创建SpringIOC容器
//		ClassPathXmlApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
//		//2.从容器中获取mapper
//		DepartmentMapper departmentMapper= ac.getBean("departmentMapper",DepartmentMapper.class);
//		
//		System.out.println(ac);
//		System.out.println("hello");
		System.out.println(employeeMapper);

		//测试插入部门数据
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
		
		//生成员工数据,测试员工插入数据
//		employeeMapper.insertSelective(new Employee(null,"张三","男","zhangsan@dxa.com",1));
		
		//批量插入多个员工,批量,使用可以执行批量操作的sqlSession
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 199; i++) {
			String uid=UUID.randomUUID().toString().substring(0,5)+i;
			if(i%3!=0) {
			 mapper.insertSelective(new Employee(null,uid,"M",uid+"@funs.com",1));
			}else {
				mapper.insertSelective(new Employee(null,uid,"F",uid+"@funs.com",1));
			}
		}
		System.out.println("批量完成");
	}
}
