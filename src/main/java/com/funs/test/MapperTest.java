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
 * ����dao��Ĺ���
 * @author kylewka
 *�Ƽ�Spring����Ŀ����ʹ�õ�Ԫ���ԣ������Զ�ע��������Ҫ�����
 *1������SpringTestģ��
 *2��@ContextConfigurationָ��Spring�����ļ���λ��
 *3��ֱ��autowiredҪʹ�õ����
 */


@RunWith(SpringJUnit4ClassRunner.class)//Spirng�����ĵ�Ԫ����ģ��
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper; 
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	/**
	 * ����Department
	 * @throws IOException 
	 */
	@Test
	public void testCRUD() {
		//1.����SpringIOC����
//		ClassPathXmlApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
//		//2.�������л�ȡmapper
//		DepartmentMapper departmentMapper= ac.getBean("departmentMapper",DepartmentMapper.class);
//		
//		System.out.println(ac);
//		System.out.println("hello");
		System.out.println(employeeMapper);

		//���Բ��벿������
//		departmentMapper.insertSelective(new Department(null,"������"));
//		departmentMapper.insertSelective(new Department(null,"���Բ�"));
		
		//����Ա������,����Ա����������
//		employeeMapper.insertSelective(new Employee(null,"����","��","zhangsan@dxa.com",1));
		
		//����������Ա��,����,ʹ�ÿ���ִ������������sqlSession
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 199; i++) {
			String uid=UUID.randomUUID().toString().substring(0,5)+i;
			if(i%3!=0) {
			 mapper.insertSelective(new Employee(null,uid,"M",uid+"@funs.com",1));
			}else {
				mapper.insertSelective(new Employee(null,uid,"F",uid+"@funs.com",1));
			}
		}
		System.out.println("�������");
	}
}
