package org.nlpchina.web.controller;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
public class JspAction {
	@At("/")
	@Ok("jsp:/main.jsp")
	public void index() {
	}

	@At("/donate")
	@Ok("jsp:/donate.jsp")
	public void donate() {
	}
	
	@At("/admin")
	@Ok("jsp:/admin/main.jsp")
	public void admin() {
	}
}
