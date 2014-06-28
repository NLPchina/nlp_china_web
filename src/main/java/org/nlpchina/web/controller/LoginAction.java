package org.nlpchina.web.controller;

import java.util.ResourceBundle;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;
import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nlpchina.web.service.SinaWeiboService;
import org.nlpchina.web.util.StaticValue;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.FailToGetValueException;
import org.nutz.lang.Mirror;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import weibo4j.Oauth;
import weibo4j.Users;
import weibo4j.http.AccessToken;
import weibo4j.model.User;
import weibo4j.model.WeiboException;

import com.alibaba.fastjson.JSONObject;

@IocBean
public class LoginAction {

	private static final Logger LOG = Logger.getLogger(LoginAction.class.getName());

	private static final Mirror<AccessToken> AT_MIRROR = Mirror.me(AccessToken.class);

	private static final boolean test = StaticValue.IS_TEST;

	@Inject
	private SinaWeiboService sinaWeiboService;
	@Inject
	private GeneralService generalService;

	@At("/sinaWeibo/login")
	@Ok("redirect:/")
	public void sinaWeiBoLogin(@Param("code") String code) throws FailToGetValueException, NoSuchFieldException {

		if (test) {
			// zuoge jia denglu !!!
			UserInfo userInfo = generalService.find(1, UserInfo.class);
			if (userInfo == null) {
				userInfo = new UserInfo();
			}
			userInfo.setUserType(2);
			Mvcs.getHttpSession().setAttribute("userInfo", userInfo);
			return;
		}

		try {
			// 获得授权码
			AccessToken token = new Oauth().getAccessTokenByCode(code);
			// i do not know why it private uid ; i use reflection
			String uid = AT_MIRROR.getValue(token, AT_MIRROR.getField("uid")).toString();
			// get userInfo
			Users um = new Users();
			um.client.setToken(token.getAccessToken());
			User user = um.showUserById(uid);
			UserInfo userInfo = sinaWeiboService.insertOrUpdateUser(token.getAccessToken(), user);

			String publishUser = ResourceBundle.getBundle("config").getString("publish_user");
			if (publishUser.equals(user.getName())) {
				StaticValue.siteToken = token.getAccessToken();
				StaticValue.siteUid = uid;
			}
			Mvcs.getHttpSession().setAttribute("userInfo", userInfo);

			// 给用户种一个cookie
			JSONObject job = new JSONObject();
			job.put("name", user.getName());
			job.put("t", userInfo.getUpdateTime().getTime());
			job.put("id", userInfo.getId());
			job.put("k", cookieSecretKey(userInfo.getUpdateTime().getTime(), userInfo.getName(), userInfo.getId()));
			Cookie cookie = new Cookie("userInfo", job.toJSONString());
			cookie.setMaxAge(30 * 24 * 3600);
			cookie.setPath("/");
			Mvcs.getResp().addCookie(cookie);

		} catch (WeiboException e) {
			if (401 == e.getStatusCode()) {
				LOG.info("Unable to get the access token.");
			} else {
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@At("/login_out")
	@Ok("redirect:/")
	public void loginOut() {
		Mvcs.getHttpSession().removeAttribute("userInfo");
		Cookie cookie = new Cookie("userInfo", null);
		// 删除cookie
		cookie.setMaxAge(0);
		Mvcs.getResp().addCookie(cookie);
	}

	private double cookieSecretKey(long t, String userName, int id) {
		return Math.log((t - userName.hashCode() / Math.log(id + 1)) * 3 + 1);
	}

}
