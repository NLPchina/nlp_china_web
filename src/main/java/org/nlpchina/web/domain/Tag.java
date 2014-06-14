package org.nlpchina.web.domain;

import java.util.List;

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

	private String query;//选择多个tag时取消的参数
	
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

	public String getQuery() {
		
		return query;
	}

	public void setQuery(String tagIds) {
		String[] ids = tagIds.split(",");
		query = "";
		if (ids.length > 1) {
			for (int i = 0; i < ids.length; i++) {
				if (i < (ids.length - 1)) {
					if (Integer.parseInt(ids[i]) == this.id) {
						query = tagIds.replace(ids[i] + ",", "");
                        return ;
					}
				} else if (i == (ids.length - 1)) {
					if (Integer.parseInt(ids[i]) == this.id) {
						query = tagIds.replace(","+ids[i], "");
						return;
					}else {
						System.out.print("Tag.java: 字符串处理出错了");
					}
				}
			}
		} else {
			query=null;
			System.out.print("Tag.java tagids为1个");
		}
	}

	
}
