package org.nlpchina.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.Tag;
import org.nlpchina.web.service.GeneralService;
import org.nlpchina.web.util.StaticValue;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * 
 * @author ansj
 * 
 */

@IocBean
public class ResourceAction {

	@Inject
	private GeneralService generalService;

	@At("/resource/list")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request) {
		list(request, null);
	}

	@At("/resource/list/?")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request, Integer categoryId) {
		List<Resource> all = null;

		if (categoryId == null) {
			all = generalService.search(Resource.class, "id");
		} else {
			all = generalService.search(Resource.class, Cnd.where("categoryId", "=", categoryId));
		}

		request.setAttribute("tags", StaticValue.tags);
		request.setAttribute("all", all);
	}
}
