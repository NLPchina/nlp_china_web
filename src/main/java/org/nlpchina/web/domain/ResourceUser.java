package org.nlpchina.web.domain;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("resource_user")
public class ResourceUser {
	@Id
	private Integer id;
	@Column("resource_id")
	private Integer resourceId;
	@Column("user_id")
	private Integer userId;
	@Column("type")
	private Integer type; // 0 forward 1 publish

	@Column("site_id")
	private long siteId;

	public ResourceUser() {
	};

	public ResourceUser(Integer resourceId, Integer userId, long siteId, int type) {
		this.resourceId = resourceId;
		this.userId = userId;
		this.siteId = siteId;
		this.type = type;
	}

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

	public Integer getUserId() {
		return userId;
	}

	public void setUserInfoId(Integer userId) {
		this.userId = userId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public long getSiteId() {
		return siteId;
	}

	public void setSiteId(long siteId) {
		this.siteId = siteId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
