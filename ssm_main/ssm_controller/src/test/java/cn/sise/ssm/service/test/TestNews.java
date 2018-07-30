/**
 * 
 */
package cn.sise.ssm.service.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.sise.ssm.mapper.CategoryMapper;
import cn.sise.ssm.mapper.NewsMapper;
import cn.sise.ssm.mapper.UserMapper;
import cn.sise.ssm.po.Category;
import cn.sise.ssm.po.CategoryExample;
import cn.sise.ssm.po.News;
import cn.sise.ssm.po.User;
import cn.sise.ssm.service.CategoryService;

/**
 * @author dwx
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml" })
public class TestNews {
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private CategoryService categoryService;

	/**
	 * 
	 */
	/*
	 * @Test public void testNews() { List<News> list =
	 * newsMapper.selectByExample(null); for (News news : list) {
	 * System.out.println(news.getIssuetime()); }
	 * 
	 * }
	 */
	/*
	 * @Test public void testCtgy() { Category category =new Category();
	 * category.setCtgyName("111"); categoryService.addCategory(category);
	 * System.out.println("111"); }
	 */

	/*
	 * @Test public void testNewsWithCtgy() { List<News> list =
	 * newsMapper.selectByExampleWithCtgy(null); for (News news : list) {
	 * System.out.println(news.getCategory()); } }
	 */

	
	  @Test public void testCtgy() { List<Category> list =
	  categoryService.getAllCategory(); for (Category category : list) {
	  System.out.println(category.getCtgyName()); } }
	 

	/*
	 * @Test public void testNewsByTitle() { List<News> list =
	 * newsMapper.selectByTitle("标"); for (News news : list) {
	 * System.out.println(news.getContent()); } }
	 */

	/*
	 * @Test public void testdeleteNewsByCtgy() { Category category =
	 * categoryMapper.selectByPrimaryKey(1); newsMapper.deleteByCtgy(category); }
	 */
	/*
	 * @Test public void testuser() { //userMapper.deleteByPrimaryKey(2); List<User>
	 * users = userMapper.selectByExample(null); for (User user : users) {
	 * System.out.println(user.getUserName()); } }
	 */
	/*
	 * 批量插入news
	 */

/*	@Test
	public void testaddnews() {
		NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
		for (int i = 0; i < 3; i++) {
			String newsTitle = "长春长生董事长高俊芳等15人被刑拘";
			String newsContent = "7月23日，已近午夜，一辆白色轿车在长春长生生物科技"
					+ "有限公司的大门前停下。车上共两人，其中一名女子从副驾位置走下，向门卫而去。大门内，已有两三人接"
					+ "应。简单交流后，几人快步走向主楼。约十分钟后，一辆载有数人的轿车从公司快速驶出，直奔长春新区公安分局。这是李蓉（化名）被警方带走前的最后一幕。\r\n" + 
					"\r\n" + 
					"　　李蓉家属回忆，当晚11时，李蓉接到公司电话后，即与公公一同前往公司，驾车40分钟才到达。“她的工作就是给白鼠打针，做实验的。”李蓉的公公告诉红星新闻记者。\r\n" + 
					"\r\n" + 
					"　　和李蓉同被带走的，还有多名普通员工。而在此前，长春长生董事长高俊芳及4名高管已被公安机关带走审查。\r\n" + 
					"\r\n" + 
					"　　7月24日晚8时，长春新区公安分局发布最新消息称，长春长生生物科技有限责任公司董事长高某芳等15名涉案人员因涉嫌"
					+ "刑事犯罪，被长春新区公安分局依法采取刑事拘留强制措施。目前案件相关工作正在进行中。";
			Date issueTime = new Date();

				String source = "新浪新闻";
			mapper.insertSelective(new News(null, newsTitle, newsContent, source, issueTime, 10));
		}
		System.out.println("批量操作完成。。");
	}*/

}
