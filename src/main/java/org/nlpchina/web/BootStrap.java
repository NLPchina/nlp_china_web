package org.nlpchina.web;

import org.nlpchina.web.util.SiteSetup;
import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

/**
 * 项目启动
 * 
 */

@Modules(packages = { "org.nlpchina.web.controller" }, scanPackage = true)
@IocBy(type = ComboIocProvider.class, args = { "*org.nutz.ioc.loader.json.JsonLoader", "ioc.js", "*org.nutz.ioc.loader.annotation.AnnotationIocLoader",
		"org.nlpchina.web" })
@Encoding(input = "UTF-8", output = "UTF-8")
@SetupBy(SiteSetup.class)
public class BootStrap {
}