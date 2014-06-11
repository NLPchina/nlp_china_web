package org.nlpchina.web.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.Tag;
import org.nlpchina.web.domain.UserInfo;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Criteria;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.google.common.base.Joiner;

@IocBean
public class ResourceService {
	@Inject
	protected Dao dao;

	/**
	 * 分页查找 resource
	 * 
	 * @param categoryId
	 *            分类id好好
	 * @param order
	 * @param pager
	 * @return
	 */
	public List<Resource> search(Integer categoryId, String order, Pager pager) {
		List<Resource> query = null;

		if (categoryId != null) {
			query = dao.query(Resource.class, Cnd.where("categoryId", "=", categoryId).desc("id"), pager);
			if (pager != null) {
				pager.setRecordCount(dao.count(Resource.class, Cnd.where("categoryId", "=", categoryId)));
			}

		} else {
			query = dao.query(Resource.class, Cnd.orderBy().desc("id"), pager);
			if (pager != null) {
				pager.setRecordCount(dao.count(Resource.class));
			}
		}
		for (Resource resource : query) {
			resourceRelationFull(resource);
		}
		return query;
	}

	private void resourceRelationFull(Resource resource) {
		Sql sql = Sqls.create("select t.name from tag as t, resource_tag as rt where rt.resource_id = " + resource.getId() + " and rt.tag_id = t.id");
		dao.execute(sql.setCallback(new SqlCallback() {
			@Override
			public String invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				// TODO Auto-generated method stub
				List<String> result = new ArrayList<String>();
				while (rs.next()) {
					result.add(rs.getString(1));
				}
				return Joiner.on(',').join(result);
			}
		}));
		
		List<UserInfo> user=dao.query(UserInfo.class, Cnd.where("id", "=", resource.getAuthor()));
		if(user.size()>0){
			resource.setUserInfo(user.get(0));
		}else {
			System.out.print("resourceservice:用户id无效");
		}
		
		resource.setTags((String) sql.getResult());
	}

	/**
	 * 找到一个tag和级联的信息
	 * 
	 * @param id
	 * @return
	 */
	public Resource get(Integer id) {
		Resource resource = dao.fetch(Resource.class, id);

		resourceRelationFull(resource);
		return resource;
	}
	
	
	/**
	 * 按照tag分页查找 resource
	 * 
	 * @param tagId
	 *            标签id
	 * @param order
	 * @param pager
	 * @return
	 */
	public List<Resource> resourceTagSearch(String tagIds, String order, Pager pager) {
		
		List<Resource> query = null;
        //将tagids字符串拆分成id数组进行and查询
		String[] ids = tagIds.split(",");
		if (ids.length > 0) {
			String sqlTagsResource = "select * from resource as r, resource_tag as rt where (rt.resource_id = r.id and rt.tag_id = "
					+ Integer.parseInt(ids[0]) + ")";
			for (int j = 1; j < ids.length; j++) {
				sqlTagsResource = sqlTagsResource + " and (r.id in (select r"
						+ j + ".id from resource as r" + j
						+ ", resource_tag as rt" + j + " where (rt" + j
						+ ".resource_id = r" + j + ".id and rt" + j
						+ ".tag_id = " + Integer.parseInt(ids[j]) + ")))";

			}
			Sql sql_resource = Sqls.create(sqlTagsResource);
			sql_resource.setCallback(Sqls.callback.entities());
			sql_resource.setEntity(dao.getEntity(Resource.class));
			dao.execute(sql_resource);
			query = sql_resource.getList(Resource.class);
			if (pager != null) {
				pager.setRecordCount(query.size());
			}
			for (Resource resource : query) {
				resourceRelationFull(resource);
			}
		} else {
			System.out.print("resourservice: tagids无效");
		}
		return query;
	}
	
	
	/**
	 * 旧的，无and关系的tag查询
	 * 
	 * @param tagIds
	 *            标签ids
	 * @param order
	 * @param pager
	 * @return
	 */
	public List<Resource> resourceTagSearchold(Integer tagId, String order, Pager pager) {
		
		List<Resource> query = null;

		if (tagId != null) {
			Sql sql_resource = Sqls.create("select * from resource as r, resource_tag as rt where rt.resource_id = r.id and rt.tag_id = "+tagId);
			sql_resource.setCallback(Sqls.callback.entities());
			sql_resource.setEntity(dao.getEntity(Resource.class));
			dao.execute(sql_resource);
			query = sql_resource.getList(Resource.class);
			if (pager != null) {
				pager.setRecordCount(query.size());
			}

		} else {
			System.out.print("resourceservice: tagid无效");
		}
		for (Resource resource : query) {
			resourceRelationFull(resource);
		}
		return query;
	}
	
	/**
	 * 获取tagNames
	 * 
	 * @param tagIds
	 *            标签ids
	 * @return
	 */
	public ArrayList<Tag>  getTagNames(String tagIds){
		ArrayList<Tag> tagNames=new ArrayList<Tag>();
		String[] ids=tagIds.split(",");
		for (String id : ids) {
			String sqlTags="select * from tag as t where t.id="+id;
			Sql sql_resource = Sqls.create(sqlTags);
			sql_resource.setCallback(Sqls.callback.entities());
			sql_resource.setEntity(dao.getEntity(Tag.class));
			dao.execute(sql_resource);
			List<Tag> tags=sql_resource.getList(Tag.class);
			if(tags.size()>0){
				tags.get(0).setQuery(tagIds);
				tagNames.add(tags.get(0));
			}else {
				System.out.print("resourceservice: tagid无效");
			}
		}
			
		return tagNames;
	}
}
