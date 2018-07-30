package cn.sise.ssm.po;

import java.util.Date;

public class News {
	private Integer newsId;

	private String title;

	private String content;

	private String source;

	private Date issuetime;

	private Integer cId;

	private Category category;

	/**
	 * @param newsId
	 * @param title
	 * @param content
	 * @param source
	 * @param issuetime
	 * @param cId
	 */
	public News(Integer newsId, String title, String content, String source, Date issuetime, Integer cId) {
		super();
		this.newsId = newsId;
		this.title = title;
		this.content = content;
		this.source = source;
		this.issuetime = issuetime;
		this.cId = cId;
	}

	// 定义了有参构造器后，一定要定义无参构造器
	/**
	 * 
	 */
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getNewsId() {
		return newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source == null ? null : source.trim();
	}

	public Date getIssuetime() {
		return issuetime;
	}

	public void setIssuetime(Date issuetime) {
		this.issuetime = issuetime;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}