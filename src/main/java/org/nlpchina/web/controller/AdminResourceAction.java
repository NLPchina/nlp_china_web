package org.nlpchina.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.ResourceTag;
import org.nlpchina.web.domain.Tag;
import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nlpchina.web.service.ResourceService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.druid.util.StringUtils;

@IocBean
public class AdminResourceAction {

	@Inject
	private GeneralService generalService;

	@Inject
	private ResourceService resourceService;

	@At("/admin/resource/list")
	@Ok("jsp:/admin/resource-list.jsp")
	public void adminList(HttpServletRequest request, @Param("category_id") Integer categoryId, @Param("::pager") Pager pager) {
		if (pager == null) {
			pager = new Pager();
		}
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");

		request.setAttribute("obj", resourceService.search(categoryId, "id", pager, userInfo.getId()));
		request.setAttribute("pager", pager);
	}

	@At("/admin/resource/editer")
	@Ok("jsp:/admin/resource-editer.jsp")
	public Resource edite(HttpServletRequest request) {
		return editer(null, request);
	}

	@At("/admin/resource/editer/?")
	@Ok("jsp:/admin/resource-editer.jsp")
	public Resource editer(Integer id, HttpServletRequest request) {
		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");

		if (userInfo != null && userInfo.getUserType() > 0) {
			if (id == null || id < 1) {
				return null;
			} else {
				return resourceService.get(id);
			}
		} else {
			System.err.println("未登录或用户权限不够");
			return null;
		}

	}

	@At("/admin/resource/delete/?")
	@Ok("redirect:/admin/resource/list")
	public void delete(Integer id) {
		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");

		if (userInfo == null) {
			throw new RuntimeException("autor err! you are not login !");
		}

		Resource old = resourceService.get(id);

		if (old == null) {
			return;
		}

		// 如果资源id和用户id不匹配.那么抛出异常
		if (!old.getAuthor().equals(userInfo.getId())) {
			throw new RuntimeException("autor err! this is not your resource !");
		}

		generalService.delById(id, Resource.class);
		generalService.delete("resource_tag", Cnd.where("resource_id", "=", id));
	}

	@At("/admin/resource/insert")
	@Ok("redirect:/admin/resource/list")
	public void insert(@Param("::obj.") Resource obj) {

		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		try {
			Resource old = null;

			obj.setUpdateTime(new Date());

			if (obj.getId() != null) {
				old = resourceService.get(obj.getId());
			}

			obj.setUpdateTime(new Date());

			if (old == null) {
				obj.setAuthor(userInfo.getId());
				obj.setPublishTime(new Date());
				obj = generalService.save(obj);
			} else {
				// 如果资源id和用户id不匹配.那么抛出异常
				if (!old.getAuthor().equals(userInfo.getId())) {
					throw new RuntimeException("autor err!");
				}

				obj.setPublishTime(old.getPublishTime());
				generalService.update(obj);
			}

			if (!StringUtils.isEmpty(obj.getTags())) {
				String[] split = obj.getTags().trim().toLowerCase().split(",");

				// 把以前的tagID清空
				generalService.delete("resource_tag", Cnd.where("resource_id", "=", obj.getId()));

				// 增加新的tag关联
				for (String tagName : split) {
					if (!StringUtils.isEmpty(tagName)) {
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
