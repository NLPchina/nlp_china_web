package org.nlpchina.web.domain;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("doc_menu")
public class DocMenu {
	@Id
	private Integer id;

	@Column
	private String content;

	@Column
	private String author;

	@Column("publish_time")
	private Date publishTime;

	@Column("update_time")
	private Date updateTime;

	@Column("extracting_code")
	private String extractingCode;
	
	
	private String html ;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		if (content == null) {
			return "";
		}
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
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



	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public String getExtractingCode() {
		return extractingCode;
	}

	public void setExtractingCode(String extractingCode) {
		this.extractingCode = extractingCode;
	}

}
