package org.nlpchina.web.controller;

import java.util.Date;
import java.util.List;

import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.ResourceTag;
import org.nlpchina.web.domain.Tag;
import org.nlpchina.web.service.GeneralService;
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
	private GeneralService generalService;

	@At("/admin/resource/list")
	@Ok("jsp:/admin/resource-list.jsp")
	public List<Resource> adminList() {
		return generalService.search(Resource.class, "id");
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
			return generalService.find(id, Resource.class);
		}
	}

	@At("/admin/resource/delete/?")
	@Ok("redirect:/admin/resource/list")
	public void delete(Integer id) {
		generalService.delById(id, Resource.class);
		generalService.delete("resource_tag", Cnd.where("resource_id", "=", id));
	}

	@At("/admin/resource/insert")
	@Ok("redirect:/admin/resource/list")
	public void insert(@Param("::obj.") Resource obj) {
		try {
			Resource old = null;

			obj.setUpdateTime(new Date());

			// TODO: 先写我的名字.稍后需要传入request来取得用户名
			obj.setAuthor("ansj");

			if (obj.getId() != null) {
				old = generalService.find(obj.getId(), Resource.class);
			}

			obj.setUpdateTime(new Date());

			if (old == null) {
				obj.setPublishTime(new Date());
				obj = generalService.save(obj);
			} else {
				obj.setPublishTime(old.getPublishTime());
				generalService.update(obj);
			}

			if (!StringUtils.isEmpty(obj.getTags())) {
				String[] split = obj.getTags().trim().toLowerCase().split(",");

				// 把以前的tagID清空
				generalService.delete("resource_tag", Cnd.where("resource_id", "=", obj.getId()));

				// 增加新的tag关联
				for (String tagName : split) {
					if (StringUtils.isEmpty(tagName)) {
						Tag tag = generalService.findByCondition(Tag.class, Cnd.where("name", "=", tagName));
						if (tag == null) {
							tag = new Tag(tagName, 0);
							tag = generalService.save(tag);
						}

						generalService.save(new ResourceTag(obj.getId(), tag.getId()));
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
