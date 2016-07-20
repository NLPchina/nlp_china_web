package org.nlpchina.web.controller;

import java.util.List;

import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
public class GroupAction {

	@Inject
	private GeneralService generalService;

	/**
	 * 保存菜单栏,并且为每个菜单栏生成唯一ID
	 * 
	 * @param content
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@At("/group/")
	@Ok("jsp:/group.jsp")
	public List<UserInfo> index()  {
		return generalService.search(UserInfo.class, Cnd.where("userType", ">", 0)) ;
	}

}
