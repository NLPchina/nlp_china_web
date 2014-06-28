package org.nlpchina.web.domain;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

import weibo4j.model.User;

@Table("user_info")
public class UserInfo {
	public static final UserInfo DEFAULT_USER = instanceDefaultUser() ;
	
	public static final String SINA_WEIBO = "sinaWeibo" ;
	
	@Id
	private Integer id;
	@Column("user_type")
	private int userType; // 0 普通用户 1,组织用户 2 管理员
	@Column("site_type")
	private String siteType; // 网站类型
	@Column("site_id")
	private String siteId; // 用户UID
	@Column
	private String name; // 微博昵称
	@Column("access_token")
	private String accessToken; // 权限token
	@Column("update_time")
	private Date updateTime; // token 更新时间
	@Column("register_time")
	private Date registerTime; // 注册时间
	@Column
	private String location; // 地址
	@Column
	private String description; // 个人描述
	@Column
	private String url; // 用户博客地址
	@Column("profile_image_url")
	private String profileImageUrl; // 自定义图像
	@Column("user_domain")
	private String userDomain; // 用户个性化URL
	@Column
	private String gender; // 性别,m--男，f--女,n--未知
	@Column("avatar_large")
	private String avatarLarge; // 大头像地址
	public UserInfo() {}
	
	
	private static UserInfo instanceDefaultUser() {
		UserInfo userInfo = new UserInfo();
		userInfo.setId(0);
		return userInfo ;
	}
	public void update(User user, String accessToken) {
		siteType = SINA_WEIBO;
		//userType = 0;
		this.accessToken = accessToken;
		updateTime = new Date();
		siteId = user.getId();
		name = user.getScreenName();
		location = user.getLocation();
		description = user.getDescription();
		url = user.getUrl();
		profileImageUrl = user.getProfileImageUrl();
		userDomain = user.getUserDomain();
		gender = user.getGender();
		avatarLarge = user.getAvatarLarge();
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getSiteType() {
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getProfileImageUrl() {
		return profileImageUrl;
	}

	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}

	public String getUserDomain() {
		return userDomain;
	}

	public void setUserDomain(String userDomain) {
		this.userDomain = userDomain;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAvatarLarge() {
		return avatarLarge;
	}

	public void setAvatarLarge(String avatarLarge) {
		this.avatarLarge = avatarLarge;
	}

}
