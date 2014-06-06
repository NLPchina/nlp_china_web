package org.nlpchina.web.domain;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * tag表
 * 
 * @author ansj
 * 
 */
@Table("tag")
public class Tag {

	public Tag() {
	};

	public Tag(String name, Integer type) {
		this.name = name;
		this.type = type;
	}

	@Id
	private Integer id;
	@Column
	private Integer type; // 类型0 用户tag 1 系统tag
	@Column
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
