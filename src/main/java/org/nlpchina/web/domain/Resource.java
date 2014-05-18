package org.nlpchina.web.domain;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 资源实体类
 * 
 * @author ansj
 * 
 */
@Table("resource")
public class Resource {
	@Id
	private Integer id;
	@Column
	private String title;
	@Column("sys_img")
	private String sysImg; // 系统图片.
	@Column
	private String summary;
	@Column("publish_time")
	private Date publishTime;
	@Column("update_time")
	private Date updateTime;
	@Column
	private String author;
	private String visitUrl;
	@Column("category_id")
	private Integer categoryId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSysImg() {
		return sysImg;
	}

	public void setSysImg(String sysImg) {
		this.sysImg = sysImg;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getVisitUrl() {
		return visitUrl;
	}

	public void setVisitUrl(String visitUrl) {
		this.visitUrl = visitUrl;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

}
