package org.nlpchina.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
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
	public void editer( Integer id, HttpServletRequest request) {
		if (id == null || id < 1) {
			System.err.println("用户id错误");
			request.setAttribute("user", null);
            return;
		} else {
			request.setAttribute("user", generalService.find(id, UserInfo.class));
			return;
		}
	}

	@At("/admin/user/save/")
	@Ok("jsp:/admin/user-editer.jsp")
	public void save( HttpServletRequest request, @Param("::user") UserInfo user) {
		UserInfo admin=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		if (user==null||admin==null) {
			System.err.println("用户是null");
		}else {
			UserInfo temp=generalService.find(user.getId(), UserInfo.class);
			if (temp!=null) {
				try {
					
					if (admin.getUserType()==2) {
						generalService.update(user);
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("更新用户信息失败");
					e.printStackTrace();
				}
				
				request.setAttribute("user", generalService.find(user.getId(), UserInfo.class));
			}else {
				System.err.println("用户未登录");
			}
		}
		
	}

}