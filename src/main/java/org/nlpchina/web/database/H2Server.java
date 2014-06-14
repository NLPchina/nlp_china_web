package org.nlpchina.web.database;

import java.io.File;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.h2.tools.Server;
import org.nlpchina.web.service.GeneralService;
import org.nlpcn.commons.lang.util.IOUtil;
import org.nlpcn.commons.lang.util.StringUtil;
import org.nutz.mvc.NutConfig;

/**
 * h2数据库
 * 
 * @author ansj
 * 
 */
public class H2Server {
	private static final Logger LOG = Logger.getLogger(H2Server.class);

	private static Server server;

	public static void startServer(NutConfig nc) {

		if (server != null && server.isRunning(true)) {
			return;
		}
		try {
			LOG.info("database path is " + "正在启动h2...");
			boolean dbIsActive = new File("h2db").isDirectory();
			LOG.info("database path is " + new File("h2db").getAbsolutePath());
			server = Server.createPgServer(new String[] { "-baseDir", "h2db" }).start();

			if (!dbIsActive) {
				LOG.warn("the database is not create , use db script to create it!");
				String content = null;
				if (new File("config/db.sql").isFile()) {
					content = IOUtil.getContent("config/db.sql", IOUtil.UTF8);
				} else if (new File("src/main/resource/db.sql").isFile()) {
					content = IOUtil.getContent("src/main/resource/db.sql", IOUtil.UTF8);
				}
				if(StringUtil.isNotBlank(content)){
					nc.getIoc().get(GeneralService.class).executeSql(content);
				}
			}
		} catch (SQLException e) {
			LOG.error("启动h2出错：" + e.toString());
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		LOG.info("数据库启动完毕...");
	}

	public static void stopServer() {
		if (server != null) {
			System.out.println("正在关闭h2...");
			server.stop();
			System.out.println("关闭成功.");
		}
	}

}
