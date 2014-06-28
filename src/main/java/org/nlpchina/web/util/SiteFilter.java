package org.nlpchina.web.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nlpcn.commons.lang.util.StringUtil;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;

import com.alibaba.fastjson.JSONObject;

/**
 * 网站全局过滤器
 * 
 * @author ansj
 * 
 */
public class SiteFilter implements ActionFilter {

	private static final Logger LOG = Logger.getLogger(SiteFilter.class.getName());

	@Override
	public View match(ActionContext actionContext) {
		try {
			HttpSession session = Mvcs.getHttpSession(true);

			// 判断用户是
			if (session.getAttribute("userInfo") != null) {
				return null;
			}

			// 如果用户为null用用户的cookie登录试试

			Cookie[] cookies = Mvcs.getReq().getCookies();

			if (cookies == null) {
				return null;
			}
			for (Cookie cookie : cookies) {
				if ("userInfo".equals(cookie.getName())) {
					LOG.info("use user cookie to login !");
					if (StringUtil.isBlank(cookie.getValue())) {
						return null;
					}
					JSONObject job = JSONObject.parseObject(cookie.getValue());
					if (checkcookieSecretKey(job.getLongValue("t"), job.getString("name"), job.getIntValue("id"), job.getDoubleValue("k"))) {
						UserInfo userInfo = StaticValue.ioc.get(GeneralService.class).find(job.getIntValue("id"), UserInfo.class);
						Mvcs.getHttpSession().setAttribute("userInfo", userInfo);
						LOG.info("userId:" + userInfo.getId() + "\t" + userInfo.getName() + " login ok by cookie");
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 验证用户的cookie是否有效
	 * 
	 * @param t
	 * @param name
	 * @param id
	 * @param k
	 * @return
	 */
	private boolean checkcookieSecretKey(long t, String name, int id, double k) {
		return Math.log((t - name.hashCode() / Math.log(id + 1)) * 3 + 1) == k;
	}
}
