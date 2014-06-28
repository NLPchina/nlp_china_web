//package org.nlpchina.web.controller;
//
//import org.nlpchina.web.service.GeneralService;
//import org.nutz.ioc.loader.annotation.Inject;
//import org.nutz.ioc.loader.annotation.IocBean;
//import org.nutz.mvc.annotation.At;
//import org.nutz.mvc.annotation.Ok;
//import org.nutz.mvc.annotation.Param;
//
//@IocBean
//public class TestAction {
//
//	@Inject
//	private GeneralService generalService;
//	/**
//	 * test
//	 */
//	@At("/test/execute_sql")
//	@Ok("raw")
//	public String executeSql(@Param("sql") String sql){
//		try {
//			generalService.executeSql(sql);
//			return "ok" ;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return e.getMessage() ;
//		}
//	}
//}
