/**
 * 
 */
package cn.sise.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sise.ssm.mapper.NewsMapper;
import cn.sise.ssm.po.News;
import cn.sise.ssm.po.NewsExample;
import cn.sise.ssm.po.NewsExample.Criteria;

/**
 * @author dwx
 *
 */
@Service
public class NewsService {
	//注入NewsMapper
	@Autowired
	private NewsMapper newsMapper;
	
	/*
	 * 获取所有新闻
	 */
	public List<News> getAllNewses() {
		List<News> newses = newsMapper.selectByExampleWithCtgy(null); 
		return newses;
	}

	/**
	 * @param cid
	 * @return
	 */
	public List<News> getNewsesByCtgy(Integer cid) {
		// TODO Auto-generated method stub
		
		List<News> newses = newsMapper.selectByCtgy(cid);
		return newses;
	}

	/**
	 * @param id
	 * @return
	 */
	public News getNewsById(Integer id) {
		// TODO Auto-generated method stub
		News news = newsMapper.selectByPrimaryKey(id);
		return news;
	}

	/**
	 * @param news
	 */
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		newsMapper.updateByPrimaryKeySelective(news);
	}

	/**
	 * @param del_ids
	 */
	public void deleteNewsBatch(List<Integer> del_ids) {
		// TODO Auto-generated method stub
		NewsExample newsExample = new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andNewsIdIn(del_ids);
		newsMapper.deleteByExample(newsExample);
	}

	/**
	 * @param id
	 */
	public void deleteNews(Integer id) {
		// TODO Auto-generated method stub
		newsMapper.deleteByPrimaryKey(id);
	}

	/**
	 * @param news
	 */
	public void addNews(News news) {
		// TODO Auto-generated method stub
		newsMapper.insertSelective(news);
	}

	/**
	 * @param title
	 * @return
	 */
	public List<News> getNewsesByTitle(String title) {
		// TODO Auto-generated method stub
		List<News> list = newsMapper.selectByTitle(title);
		return list;
	}
	
}
