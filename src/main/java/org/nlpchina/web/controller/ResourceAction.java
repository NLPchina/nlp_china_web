package org.nlpchina.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.dao.BasicDao;
import org.nlpchina.web.domain.Tag;
import org.nutz.dao.Cnd;
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
	private BasicDao basicDao;

	@At("/resource/list")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request) {
		list(request, null);
	}

	@At("/resource/list/?")
	@Ok("jsp:/resource-list.jsp")
	public void list(HttpServletRequest request, Integer categoryId) {
		List<Tag> tags = basicDao.search(Tag.class, Cnd.where("type", "=", 1));
		request.setAttribute("tags", tags);
	}
}
