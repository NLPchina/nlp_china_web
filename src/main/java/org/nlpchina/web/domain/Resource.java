package org.nlpchina.web.domain;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.nlpchina.web.util.StaticValue;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

import com.alibaba.druid.util.StringUtils;
import com.google.common.collect.Lists;

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
	@Column("visit_url")
	private String visitUrl;
	@Column("category_id")
	private Integer categoryId;

	private String tags;

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

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getCategoryStr() {
		Category category = StaticValue.categoryMap.get(this.categoryId);
		if(category==null){
			return null ;
		}
		return category.getName();
	}

	public List<String> getTagList() {
		if (StringUtils.isEmpty(tags)) {
			return Collections.emptyList();
		}
		return Lists.newArrayList(tags.split(","));
	}
	
}
