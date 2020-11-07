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
 * 使用Spring测试米快提供的测试请求功能,测试crud请求的正确性
 * @author kylewka
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)//Spirng启动的单元测试模块
@WebAppConfiguration//使@Autowired自动装配可以获得Web ioc容器
@ContextConfiguration(locations = {"classpath:spring.xml","file:src/main/webapp/WEB-INF/springmvc.xml"})
public class MvcTest {
	
	//传入SpringMVC的ioc
	//Autowired需要自动装配SpringMVC容器自己,需要添加@WebAppConfiguration注解
	@Autowired
	WebApplicationContext context;
	
	//虚拟的MVC请求获取到处理结果
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	//编写测试分页的方法
	@Test
	public void testPage() throws Exception {
		//模拟request请求拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
				.param("pn", "1")).andReturn();
		System.out.println(result);
		//请求成功后,请求域中会有pageInfo,我们可以取出pageInfo进行验证
		MockHttpServletRequest request = result.getRequest();
		PageInfo attribute =   (PageInfo) request.getAttribute("empInfo");
		System.out.println(attribute);
		System.out.println("当前页码:"+attribute.getPageNum());
		System.out.println("总页码:"+attribute.getPages());
		System.out.println("总记录数:"+attribute.getTotal());
		System.out.println("在页面需要显示的连续页码");
		int[] nums = attribute.getNavigatepageNums();//在页面需要显示的连续页码
		for (int i : nums) {
			System.out.print(" "+i);
		}
		System.out.println();
		//获取员工数据
		List<Employee> list = attribute.getList();
		for (Employee employee : list) {
			System.out.println(employee);
		}
	}
	
	
	
}
