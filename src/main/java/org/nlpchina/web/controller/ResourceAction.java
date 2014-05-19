package org.nlpchina.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.service.ResourceService;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.fastjson.JSONArray;

/**
 * 
 * @author ansj
 * 
 */

@IocBean
public class ResourceAction {

	@Inject
	private ResourceService resourceService;

	@At("/resource/list")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request, @Param("::pager") Pager pager) {
		list(null, request, pager);
	}

	@At("/resource/list/?")
	@Ok("jsp:/resource-list.jsp")
	public void list(Integer categoryId, HttpServletRequest request, @Param("::pager") Pager pager) {
		if (pager == null) {
			pager = new Pager();
		}
		request.setAttribute("all", resourceService.search(categoryId, "id", pager));
		request.setAttribute("pager", pager);
	}
}
