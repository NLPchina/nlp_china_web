package org.nlpchina.web.util;

import org.nlpchina.web.database.H2Server;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

/**
 * 网站启动需要初始化的数据
 * @author ansj
 */
public class SiteSetup implements Setup {

	public void init(NutConfig nc) {
		H2Server.startServer();
	}

	public void destroy(NutConfig nc) {
		H2Server.stopServer();
	}

}
