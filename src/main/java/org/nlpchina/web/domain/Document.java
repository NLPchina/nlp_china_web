package org.nlpchina.web.domain;

import java.io.StringReader;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("document")
public class Document {
	@Name
	private String id ;
	
	@Column
	private String content ;
	
	@Column
	private Integer author ;

	@Column("publish_time")
	private Date publishTime;

	@Column("update_time")
	private Date updateTime;
	
	@Column("extracting_code")
	private String extractingCode;
	
	@Column("menu_id")
	private Integer menuId ;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAuthor() {
		return author;
	}

	public void setAuthor(Integer author) {
		this.author = author;
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

	public String getExtractingCode() {
		return extractingCode;
	}

	public void setExtractingCode(String extractingCode) {
		this.extractingCode = extractingCode;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	
	
	public String getName() {
		 String[] strings=content.split("\n");
		 for (String str : strings) {
			if (str.trim().length()>0) {
				return str;
			}
		 }
		 return null;
	}
	
}
