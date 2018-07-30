/**
 * 
 */
package cn.sise.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sise.ssm.josnmsg.Msg;
import cn.sise.ssm.po.Category;
import cn.sise.ssm.service.CategoryService;



/**
 * @author dwx
 *
 */
@Controller
public class CategoryController {
	// 注入业务组件
	@Autowired
	private CategoryService categoryService;

	/*
	 * 获取所有新闻类别
	 */
	@RequestMapping("/ctgy")
	@ResponseBody
	public Msg getCategorties() {
		List<Category> categories = categoryService.getAllCategory();
		return Msg.success().add("categories", categories);
	}

	/*
	 * 添加新闻类别
	 */
	@RequestMapping(value = "/ctgy" , method = RequestMethod.POST)
	@ResponseBody
	public Msg addCategory(Category category) {
		categoryService.addCategory(category);
		return Msg.success();
	}

	/*
	 * 删除新闻类别
	 */
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmps(Integer id) {
		categoryService.deleteCategory(id);
		return Msg.success();
	}

}
