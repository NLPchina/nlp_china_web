package org.nlpchina.web.util;

import org.apache.log4j.Logger;
import org.nlpchina.web.database.H2Server;
import org.nlpchina.web.service.SinaWeiboService;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

/**
 * 网站启动需要初始化的数据
 * 
 * @author ansj
 */
public class SiteSetup implements Setup {
	private static final Logger LOG = Logger.getLogger(SiteSetup.class.getName());

	/**
	 * 启动网站并且初始化数据
	 */
	public void init(NutConfig nc) {
		H2Server.startServer();
		// 加载全站数据
		StaticValue.updateCategorys(nc);
		StaticValue.updateTags(nc);

		// init gather sina weibo
		gatherSinaWeiboThread();
	}

	private void gatherSinaWeiboThread() {
		new Thread() {
			@Override
			public void run() {
				while (true) {
					try {
						Thread.sleep(1 * 30 * 1000L);
						LOG.info("begin gather sina weibo !");
						if (StringUtil.isNotBlank(StaticValue.siteToken) && StaticValue.ioc != null) {
							SinaWeiboService sinaWeiboService = StaticValue.ioc.get(SinaWeiboService.class);
							sinaWeiboService.gather(StaticValue.siteToken);
						} else {
							LOG.info("the sina weibo auth is not config!");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}.start();
	}

	public void destroy(NutConfig nc) {
		H2Server.stopServer();
	}

}
