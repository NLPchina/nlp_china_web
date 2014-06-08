package org.nlpchina.web.controller;

import java.util.ResourceBundle;

import org.apache.log4j.Logger;
import org.nlpchina.web.domain.UserInfo;
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

@IocBean
public class LoginAction {

	private static final Logger LOG = Logger.getLogger(LoginAction.class
			.getName());

	private static final Mirror<AccessToken> AT_MIRROR = Mirror
			.me(AccessToken.class);

	@Inject
	private SinaWeiboService sinaWeiboService;

	@At("/sinaWeibo/login")//zhege jiushi fangwendizhi ...
	@Ok("redirect:/")//zhege shi fangwen chenggong 后的跳转地址。。具体看 nutz 文档。
	public void sinaWeiBoLogin(@Param("code") String code)
			throws FailToGetValueException, NoSuchFieldException {
		if (StaticValue.ioc == null) {
			StaticValue.ioc = Mvcs.getIoc();
		}
		if (true) {
			//zuoge jia denglu !!!
			UserInfo userInfo = new UserInfo();
			userInfo.setId(1);
			userInfo.setName("admin");
			Mvcs.getHttpSession().setAttribute("userInfo", userInfo);
			return;
		}

		try {
			// 获得授权码
			AccessToken token = new Oauth().getAccessTokenByCode(code);
			// i do not know why it private uid ; i use reflection
			String uid = AT_MIRROR.getValue(token, AT_MIRROR.getField("uid"))
					.toString();

			// get userInfo
			Users um = new Users();
			um.client.setToken(token.getAccessToken());
			User user = um.showUserById(uid);
			UserInfo userInfo = sinaWeiboService.insertOrUpdateUser(
					token.getAccessToken(), user);

			String publishUser = ResourceBundle.getBundle("config").getString(
					"publish_user");
			if (publishUser.equals(user.getName())) {
				StaticValue.siteToken = token.getAccessToken();
				StaticValue.siteUid = uid;
			}

			Mvcs.getHttpSession().setAttribute("userInfo", userInfo);

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
	}

}
