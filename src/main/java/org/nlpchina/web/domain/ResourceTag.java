package org.nlpchina.web.domain;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * tag 资源关联表
 * 
 * @author ansj
 * 
 */
@Table("resource_tag")
public class ResourceTag {
	@Id
	private Integer id;
	@Column("resource_id")
	private Integer resourceId;
	@Column("tag_id")
	private Integer tagId;

	public ResourceTag(){} ;
	
	public ResourceTag(Integer resourceId, Integer tagId){
		this.resourceId = resourceId ;
		this.tagId =  tagId ;
	} ;
	
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
