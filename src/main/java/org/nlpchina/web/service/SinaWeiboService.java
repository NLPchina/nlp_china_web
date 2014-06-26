package org.nlpchina.web.service;

import java.util.Date;

import org.apache.log4j.Logger;
import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.ResourceUser;
import org.nlpchina.web.domain.UserInfo;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import weibo4j.Comments;
import weibo4j.http.AccessToken;
import weibo4j.model.Comment;
import weibo4j.model.CommentWapper;
import weibo4j.model.Status;
import weibo4j.model.User;
import weibo4j.model.WeiboException;

@IocBean
public class SinaWeiboService {
	
	private static final Logger LOG = Logger.getLogger(SinaWeiboService.class.getName());
	
	@Inject
	public Dao dao;

	public void gather(String token) {
		Comments cm = new Comments();
		cm.client.setToken(token);
		try {
			CommentWapper comment = cm.getCommentToMe();
			Status first = null;
			User forward = null;
			Status status = null;
			long siteId = 0;
			for (Comment c : comment.getComments()) {
				siteId = c.getId();

				ResourceUser fetch = dao.fetch(ResourceUser.class, Cnd.where("siteId", "=", siteId));
				if (fetch != null) {
					LOG.info("gather find same doc id ! to be over!");
					break;
				}
				
				first = c.getStatus();
				forward = c.getUser();
				while ((c = c.getReplycomment()) != null) {
					if (c.getStatus() != null) {
						first = c.getStatus();
					}
				}
				if (first.getRetweetedStatus() == null) {
					status = first;
				} else {
					status = first.getRetweetedStatus();
				}

				insert(forward, status, siteId);
			}
		} catch (WeiboException e) {
			e.printStackTrace();
		}
	}

	private void insert(User forward, Status status, long siteId) {
		UserInfo forwardUser = insertOrUpdateUser(null, forward);
		UserInfo authorUser = insertOrUpdateUser(null, status.getUser());

		Resource resource = dao.fetch(Resource.class, Cnd.where("siteId", "=", status.getId()));

		if (resource == null) {
			resource = new Resource();
			resource.setSiteId(status.getId());
			resource.setTitle("微博转发");
			resource.setSysImg("document");
			resource.setSummary(status.getText());
			resource.setPublishTime(status.getCreatedAt());
			resource.setUpdateTime(new Date());
			resource.setAuthor(authorUser.getId());
			resource.setVisitUrl("#");
			resource.setCategoryId(1);
			resource = dao.insert(resource);
		}

		ResourceUser fetch = dao.fetch(ResourceUser.class, Cnd.where("resourceId", "=", resource.getId()).and("userId", "=", forwardUser.getId()));
		if (fetch == null) {
			dao.insert(new ResourceUser(resource.getId(), forwardUser.getId(), siteId, 0));
		}

		fetch = dao.fetch(ResourceUser.class, Cnd.where("resourceId", "=", resource.getId()).and("userId", "=", authorUser.getId()));
		if (fetch == null) {
			dao.insert(new ResourceUser(resource.getId(), authorUser.getId(), siteId, 0));
		}

	}

	public UserInfo insertOrUpdateUser(String token, User user) {
		// is user in db
		
		if(token==null){
			token = "" ;
		}
		UserInfo userInfo = dao.fetch(UserInfo.class, Cnd.where("siteId", "=", user.getId()).and("siteType", "=", UserInfo.SINA_WEIBO));
		if (userInfo == null) {
			userInfo = new UserInfo();
			userInfo.update(user, token) ;
			userInfo.setSiteType(UserInfo.SINA_WEIBO);
			userInfo = dao.insert(userInfo);
		} else {
			userInfo.update(user,token );
			dao.update(userInfo);
		}
		return userInfo;
	}
}
