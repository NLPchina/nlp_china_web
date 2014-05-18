package org.nlpchina.web.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.nlpchina.web.domain.Resource;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.pager.Pager;
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
		} else {
			query = dao.query(Resource.class, Cnd.orderBy().desc("id"), pager);
		}
		for (Resource resource : query) {
			Sql sql = Sqls.create("select t.name from tag as t, resource_tag as rt where rt.resource_id = " + resource.getId() + " and rt.tag_id = t.id");
			dao.execute(sql.setCallback(new SqlCallback() {
				@Override
				public String invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
					// TODO Auto-generated method stub
					List<String> result = new ArrayList<String>();
					while (rs.next()) {
						result.add(rs.getString(0));
					}
					return Joiner.on(',').join(result);
				}
			}));
			resource.setTags((String) sql.getResult());
		}
		return query;
	}

	/**
	 * 找到一个tag和级联的信息
	 * @param id
	 * @return
	 */
	public Resource get(Integer id) {
		Resource resource = dao.fetch(Resource.class, id);

		Sql sql = Sqls.create("select t.name from tag as t, resource_tag as rt where rt.resource_id = " + id + " and rt.tag_id = t.id");
		dao.execute(sql.setCallback(new SqlCallback() {
			@Override
			public String invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				// TODO Auto-generated method stub
				List<String> result = new ArrayList<String>();
				while (rs.next()) {
					result.add(rs.getString(0));
				}
				return Joiner.on(',').join(result);
			}
		}));
		resource.setTags((String) sql.getResult());
		return resource;
	}
}
