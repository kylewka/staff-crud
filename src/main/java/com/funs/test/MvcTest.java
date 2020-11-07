package com.funs.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.funs.domain.Employee;
import com.github.pagehelper.PageInfo;

/**
 * ʹ��Spring�����׿��ṩ�Ĳ���������,����crud�������ȷ��
 * @author kylewka
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)//Spirng�����ĵ�Ԫ����ģ��
@WebAppConfiguration//ʹ@Autowired�Զ�װ����Ի��Web ioc����
@ContextConfiguration(locations = {"classpath:spring.xml","file:src/main/webapp/WEB-INF/springmvc.xml"})
public class MvcTest {
	
	//����SpringMVC��ioc
	//Autowired��Ҫ�Զ�װ��SpringMVC�����Լ�,��Ҫ���@WebAppConfigurationע��
	@Autowired
	WebApplicationContext context;
	
	//�����MVC�����ȡ��������
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	//��д���Է�ҳ�ķ���
	@Test
	public void testPage() throws Exception {
		//ģ��request�����õ�����ֵ
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
				.param("pn", "1")).andReturn();
		System.out.println(result);
		//����ɹ���,�������л���pageInfo,���ǿ���ȡ��pageInfo������֤
		MockHttpServletRequest request = result.getRequest();
		PageInfo attribute =   (PageInfo) request.getAttribute("empInfo");
		System.out.println(attribute);
		System.out.println("��ǰҳ��:"+attribute.getPageNum());
		System.out.println("��ҳ��:"+attribute.getPages());
		System.out.println("�ܼ�¼��:"+attribute.getTotal());
		System.out.println("��ҳ����Ҫ��ʾ������ҳ��");
		int[] nums = attribute.getNavigatepageNums();//��ҳ����Ҫ��ʾ������ҳ��
		for (int i : nums) {
			System.out.print(" "+i);
		}
		System.out.println();
		//��ȡԱ������
		List<Employee> list = attribute.getList();
		for (Employee employee : list) {
			System.out.println(employee);
		}
	}
	
	
	
}
