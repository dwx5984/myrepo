package cn.sise.ssm.mapper;

import cn.sise.ssm.po.Category;
import cn.sise.ssm.po.CategoryExample;
import cn.sise.ssm.po.News;
import cn.sise.ssm.po.NewsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsMapper {
    long countByExample(NewsExample example);

    int deleteByExample(NewsExample example);

    int deleteByPrimaryKey(Integer newsId);
    
	/*
	 * 删除新闻类别同时删除所有该类别的新闻  
	 */
    int deleteByCtgy(Category record);

    int insert(News record);

    int insertSelective(News record);
	/*
	 * 新增自定义查询（联合查询）
	 * 
	 */
	List<News> selectByExampleWithCtgy(CategoryExample example);
	
	List<News> selectByCtgy(Integer ctgyId);
	
	List<News> selectByTitle(String title);

	News selectByPrimaryKeyWithCtgy(Integer newsId);
	
	
	

    List<News> selectByExample(NewsExample example);

    News selectByPrimaryKey(Integer newsId);

    int updateByExampleSelective(@Param("record") News record, @Param("example") NewsExample example);

    int updateByExample(@Param("record") News record, @Param("example") NewsExample example);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}