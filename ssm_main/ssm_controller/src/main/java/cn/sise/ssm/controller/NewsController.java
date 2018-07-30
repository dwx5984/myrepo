/**
 * 
 */
package cn.sise.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.sise.ssm.josnmsg.Msg;
import cn.sise.ssm.po.News;
import cn.sise.ssm.service.NewsService;

/**
 * @author dwx 新闻控制类
 */
@Controller
public class NewsController {
	// 注入业务组件
	@Autowired
	NewsService newsService;

	/*
	 * 用model封装数据
	 */
	@RequestMapping("/newsbymodel")
	public String getNews(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) { // 引入pagehelper分页插件
																										// // //
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 10);
		// 在startPage后面紧跟一个查询
		List<News> news = newsService.getAllNewses(); //
		// 使用PageInfo包装查询后的结果，只需要把pageinfo交给页面
		// PageInfo封装了详细的分页信息，包括查询出来的数据，传入连续显示的页数
		PageInfo pageInfo = new PageInfo(news, 5);
		// 把pageinfo封装进Model
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}

	/*
	 * 用model封装数据
	 */
	@RequestMapping("/newsbyctgy")
	public String getNewsByCtgy(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			@RequestParam(value = "cid") Integer cid) { // 引入pagehelper分页插件 // //
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 10);
		// 在startPage后面紧跟一个查询
		List<News> news = newsService.getNewsesByCtgy(cid); //
		// 使用PageInfo包装查询后的结果，只需要把pageinfo交给页面
		// PageInfo封装了详细的分页信息，包括查询出来的数据，传入连续显示的页数
		PageInfo pageInfo = new PageInfo(news, 5);
		// 把pageinfo封装进Model
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}

	/**
	 * 使用ajax 查询新闻 分页显示 导入jackson包。
	 * 
	 * @param pn
	 * @return
	 */
	@RequestMapping("/news")
	@ResponseBody
	public Msg getNewsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 6);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<News> news = newsService.getAllNewses();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(news, 5);
		return Msg.success().add("pageInfo", page);
	}

	/*
	 * 根据新闻类别查找新闻
	 */
	@RequestMapping("/newsfromctgy")
	@ResponseBody
	public Msg getNewsWithJsonByCtgy(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "cid") Integer cid) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 6);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<News> news = newsService.getNewsesByCtgy(cid);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(news, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/*
	 * 根据新闻标题查找新闻
	 */
	@RequestMapping("/newsfromtitle")
	@ResponseBody
	public Msg getNewsWithJsonByTitle(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			String title) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 6);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<News> news = newsService.getNewsesByTitle(title);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(news, 5);
		return Msg.success().add("pageInfo", page);
	}

	/*
	 * 根据id查询新闻
	 */
	@RequestMapping(value = "/news/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getNewsById(@PathVariable("id") Integer id) {
		News news = newsService.getNewsById(id);
		return Msg.success().add("news", news);
	}

	/*
	 * ajax发送PUT情趣时，tomcat不会对表单数据进行封装，springmvc提供了解决方案
	 * 在web.xml中配置上HttpPutFormContentFilter
	 * HttpPutFormContentFilter作用：将请求体中的数据封装成一个Map，request被重新包装
	 * 
	 * 
	 * 更新员工
	 */
	@RequestMapping(value = "/news/{newsId}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateNews(News news) {
		newsService.updateNews(news);
		return Msg.success();
	}

	/*
	 * 单个或批量删除新闻
	 */
	@RequestMapping(value = "/news/{ids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteNews(@PathVariable("ids") String ids) {
		// 批量删除
		if (ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			// 组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			newsService.deleteNewsBatch(del_ids);

		} else {
			// 单个删除
			Integer id = Integer.parseInt(ids);
			newsService.deleteNews(id);
		}
		return Msg.success();
	}

	/*
	 * 添加新闻
	 */
	@RequestMapping(value = "/news", method = RequestMethod.POST)
	@ResponseBody
	public Msg addNews(News news) {

		news.setIssuetime(new Date());
		newsService.addNews(news);
		return Msg.success();
	}
}
