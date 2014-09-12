package org.nlpchina.web;

import java.io.File;
import java.util.ResourceBundle;

import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.nio.SelectChannelConnector;
import org.eclipse.jetty.util.thread.QueuedThreadPool;
import org.eclipse.jetty.webapp.WebAppContext;
import org.nlpchina.web.util.AuthorFilter;
import org.nlpchina.web.util.SiteFilter;
import org.nlpchina.web.util.SiteSetup;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

/**
 * 项目启动
 * 
 */

@Modules(packages = { "org.nlpchina.web.controller" }, scanPackage = true)
@IocBy(type = ComboIocProvider.class, args = { "*org.nutz.ioc.loader.json.JsonLoader", "ioc.js", "*org.nutz.ioc.loader.annotation.AnnotationIocLoader", "org.nlpchina.web" })
@Encoding(input = "UTF-8", output = "UTF-8")
@SetupBy(SiteSetup.class)
@Filters({ @By(type = SiteFilter.class), @By(type = AuthorFilter.class) })
public class BootStrap {
	private static Server server;

	public static void main(String[] args) throws Exception {
		ResourceBundle bundle = ResourceBundle.getBundle("config");
		String web_dir = null;

		if (bundle.containsKey("web_dir")) {
			web_dir = bundle.getString("web_dir");
			;
		} else if (new File("src/main/webapp").isDirectory()) {
			web_dir = "src/main/webapp";
		} else if (new File("webapp").isDirectory()) {
			web_dir = "webapp";
		} else {
			throw new Exception("not find web app! in " + new File("").getAbsolutePath());
		}

		server = new Server();
		QueuedThreadPool threadPool = new QueuedThreadPool();
		server.setThreadPool(threadPool);
		Connector connector = new SelectChannelConnector();
		connector.setPort(Integer.parseInt(bundle.getString("port")));
		server.setConnectors(new Connector[] { connector });
		connector.setRequestHeaderSize(1024*1024*10);
		WebAppContext context = new WebAppContext(web_dir, "/");
		server.setAttribute("org.eclipse.jetty.server.Request.maxFormContentSize", "-1");
		server.setAttribute("org.mortbay.util.URI.charset", "utf-8");
		context.setMaxFormContentSize(-1);
		server.setHandler(context);
		server.setStopAtShutdown(true);
		server.setSendServerVersion(false);
		server.start();
		server.join();

	}

	public static void shutdown() {
		try {
			server.stop();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}