package org.nlpchina.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.service.ResourceService;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

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
		pager.setPageSize(10) ;
		request.setAttribute("all", resourceService.search(categoryId, "id", pager));
		request.setAttribute("pager", pager);
	}
	
	@At("/resource/?")
	@Ok("jsp:/resource.jsp")
	public Resource findById(Integer id){
		return resourceService.get(id) ;
	}
}
