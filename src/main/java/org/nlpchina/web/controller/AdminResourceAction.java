package org.nlpchina.web.controller;

import java.util.Date;
import java.util.List;

import org.nlpchina.web.dao.BasicDao;
import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.ResourceTag;
import org.nlpchina.web.domain.Tag;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.druid.util.StringUtils;

@IocBean
public class AdminResourceAction {

	@Inject
	private BasicDao basicDao;

	@At("/admin/resource/list")
	@Ok("jsp:/admin/resource-list.jsp")
	public List<Resource> adminList() {
		return basicDao.search(Resource.class, "id");
	}

	@At("/admin/resource/editer")
	@Ok("jsp:/admin/resource-editer.jsp")
	public Resource edite() {
		return editer(null);
	}

	@At("/admin/resource/editer/?")
	@Ok("jsp:/admin/resource-editer.jsp")
	public Resource editer(Integer id) {
		if (id == null || id < 1) {
			return null;
		} else {
			return basicDao.find(id, Resource.class);
		}
	}

	@At("/admin/resource/delete/?")
	@Ok("redirect:/admin/resource/list")
	public void delete(Integer id) {
		basicDao.delById(id, Resource.class);
		basicDao.delete("resource_tag", Cnd.where("resource_id", "=", id));
	}

	@At("/admin/resource/insert")
	@Ok("redirect:/admin/resource/list")
	public void insert(@Param("::obj.") Resource obj, @Param("tags") String tags) {
		try {
			Resource old = null;

			obj.setUpdateTime(new Date());

			// TODO: 先写我的名字.稍后需要传入request来取得用户名
			obj.setAuthor("ansj");

			if (obj.getId() != null) {
				old = basicDao.find(obj.getId(), Resource.class);
			}

			obj.setUpdateTime(new Date());

			if (old == null) {
				obj.setPublishTime(new Date());
				obj = basicDao.save(obj);
			} else {
				obj.setPublishTime(old.getPublishTime());
				basicDao.update(obj);
			}

			if (!StringUtils.isEmpty(tags)) {
				String[] split = tags.trim().toLowerCase().split(",");

				// 把以前的tagID清空
				basicDao.delete("resource_tag", Cnd.where("resource_id", "=", obj.getId()));

				// 增加新的tag关联
				for (String tagName : split) {
					if (StringUtils.isEmpty(tagName)) {
						Tag tag = basicDao.findByCondition(Tag.class, Cnd.where("name", "=", tagName));
						if (tag == null) {
							tag = new Tag(tagName, 0);
							tag = basicDao.save(tag);
						}

						basicDao.save(new ResourceTag(obj.getId(), tag.getId()));
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
