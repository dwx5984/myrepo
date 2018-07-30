/**
 * 
 */
package cn.sise.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sise.ssm.mapper.CategoryMapper;
import cn.sise.ssm.po.Category;

/**
 * @author dwx
 *新闻类别业务组件
 */
@Service
public class CategoryService {
	//注入mapper
	@Autowired
	private CategoryMapper categoryMapper;
	
	/**
	 * 获取新闻类别
	 */
	public List<Category> getAllCategory() {
		// TODO Auto-generated method stub
		List<Category> list = categoryMapper.selectByExample(null);
		return list;
	}
	/*
	 * 添加新闻类别
	 */
	public void addCategory(Category category) {
		categoryMapper.insertSelective(category);
	}
	/*
	 * 删除新闻类别
	 */
	public void deleteCategory(Integer ctgyId) {
		categoryMapper.deleteByPrimaryKey(ctgyId);
	}
}
