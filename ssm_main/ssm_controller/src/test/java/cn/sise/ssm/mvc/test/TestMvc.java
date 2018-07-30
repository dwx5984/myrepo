/**
 * 
 */
package cn.sise.ssm.mvc.test;

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

import com.github.pagehelper.PageInfo;

import cn.sise.ssm.po.Category;

/**
 * @author dwx
 *
 *         使用spring提供的测试请求功能，测试crud的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:springmvc.xml" })
public class TestMvc {
	// 传入springmvc的ioc（需添加注解@WebAppConfiguration）
	@Autowired
	WebApplicationContext context;
	// 虚拟mvc请求，获取处理结果
	MockMvc mockMvc;

	@Before
	// 创建mockMvc
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	/*@Test
	// 测试分页数据
	public void testPage() throws Exception {
		// 模拟请求，拿到返回值
		//MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/newsbymodel").param("pn", "5")).andReturn();
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/newsbyctgy").param("pn", "5").param("cid", "2")).andReturn();

		// 请求成功后，请求域中有Pageinfo信息，取出Page Info信息进行测试
		MockHttpServletRequest request = mvcResult.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码：" + pi.getPageNum());
		System.out.println("总页码：" + pi.getPages());
		System.out.println("总记录数：" + pi.getTotal());
		System.out.println("页面需要连续显示的页码：");
		int[] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" " + i);
		}
	}*/
	@Test
	public void testPage() throws Exception {
		// 模拟请求，拿到返回值
		//MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/newsbymodel").param("pn", "5")).andReturn();
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/checkuser").param("name", "111").param("pwd", "123")).andReturn();

		// 请求成功后，请求域中有Pageinfo信息，取出Page Info信息进行测试
		MockHttpServletRequest request = mvcResult.getRequest();
		
	}
	
}
