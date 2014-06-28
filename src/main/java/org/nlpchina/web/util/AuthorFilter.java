package org.nlpchina.web.util;

import org.nlpchina.web.domain.UserInfo;
import org.nlpcn.commons.lang.util.StringUtil;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.view.ServerRedirectView;

public class AuthorFilter implements ActionFilter {

	@Override
	public View match(ActionContext actionContext) {
		String path = actionContext.getPath();
		if (StringUtil.isBlank(path)) {

		}

		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");

		if (path.startsWith("/admin/resource")) {
			if (userInfo == null || userInfo.getUserType() < 1) {
				return new ServerRedirectView("/admin/login.htm");
			}

		}

		if (path.startsWith("/admin/user")) {
			if (userInfo == null || userInfo.getUserType() != 2) {
				return new ServerRedirectView("/admin/login.htm");
			}

		}

		return null;
	}

}
