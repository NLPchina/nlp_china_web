package org.nlpchina.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
public class AdminUserAction {

	@Inject
	private GeneralService generalService;

	@At("/admin/user/list")
	@Ok("jsp:/admin/user-list.jsp")
	public void adminList(HttpServletRequest request, @Param("user_type") Integer userType, @Param("::pager") Pager pager) {
		if (pager == null) {
			pager = new Pager();
		}

		Cnd where = null;
		if (userType != null) {
			where = Cnd.where("userType", "=", userType);
		}
		
		request.setAttribute("obj", generalService.searchByPage(UserInfo.class, where, pager));
		request.setAttribute("pager", pager);
	}

	@At("/admin/user/editer/?")
	@Ok("jsp:/admin/user-editer.jsp")
	public UserInfo editer(Integer id) {
		if (id == null || id < 1) {
			return null;
		} else {
			return generalService.find(id, UserInfo.class) ;
		}
	}

}