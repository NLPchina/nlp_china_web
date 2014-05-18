package org.nlpchina.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.service.GeneralService;
import org.nlpchina.web.service.ResourceService;
import org.nlpchina.web.util.StaticValue;
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

	@Inject
	private ResourceService resourceService;

	@At("/resource/list")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request, Pager pager) {
		list(request, null, pager);
	}

	@At("/resource/list/?")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request, Integer categoryId, Pager pager) {
		request.setAttribute("tags", StaticValue.tags);
		request.setAttribute("all", resourceService.search(categoryId, "id", pager));
		request.setAttribute("pager", pager);
	}
}
