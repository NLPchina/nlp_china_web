package org.nlpchina.web.domain;

/**
 * tag 资源关联表
 * 
 * @author ansj
 * 
 */
public class ResourceTag {
	private Integer id;
	private Integer resourceId;
	private Integer tagId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

}
