package org.nlpchina.web.database;

import java.sql.SQLException;

import org.h2.tools.Server;

/**
 * h2数据库
 * 
 * @author ansj
 * 
 */
public class H2Server {
	private static Server server;

	public static void startServer() {

		if (server != null && server.isRunning(true)) {
			return;
		}
		try {
			System.out.println("正在启动h2...");
			server = Server.createTcpServer("-webPort","9093","-tcpPort","9092").start();
		} catch (SQLException e) {
			System.out.println("启动h2出错：" + e.toString());
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		System.out.println("数据库启动完毕...");
	}

	public static void stopServer() {
		if (server != null) {
			System.out.println("正在关闭h2...");
			server.stop();
			System.out.println("关闭成功.");
		}
	}

}
