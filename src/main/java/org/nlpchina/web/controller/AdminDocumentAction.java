package org.nlpchina.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.DocMenu;
import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.DocumentService;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
@IocBean
public class AdminDocumentAction {
	@Inject
	private DocumentService documentService;
	@Inject
	private GeneralService generalService;

	/**
	 * 多页文档列表
	 * @param request
	 * @param pager
	 */
	@At("/docs/menu-list/")
	@Ok("jsp:/admin/user-document-list.jsp")
	public void userDocmenuList(HttpServletRequest request, @Param("::pager") Pager pager){
		UserInfo userInfo=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		if (userInfo!=null) {//判断是否登录
			if (pager==null) {
				pager=new Pager();
			}
			System.err.println("执行到这里了，共得到记录"+documentService.getUserDocMenus(userInfo.getId(), "id", pager).size());
			request.setAttribute("all", documentService.getUserDocMenus(userInfo.getId(), "id", pager));
			request.setAttribute("pager", pager);
			
			return;
		} else {
			try {
				Mvcs.getResp().sendRedirect(request.getContextPath()+"/admin/erro.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 多页文档删除
	 * @param menu_id
	 * @param request
	 * @param pager
	 */
	@At("/docs/menu/delete/?")
	@Ok("jsp:/admin/user-document-list.jsp")	
	public void deleteDocmenuList(Integer menu_id, HttpServletRequest request, @Param("::pager") Pager pager){
		
		UserInfo userInfo=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		
		if (userInfo!=null) {//判断是否登录
			boolean flag=documentService.deletDocumenu(menu_id, userInfo.getId());
			if (flag) {
			    pager=new Pager();
				userDocmenuList(request, pager);
				return;
			}
		}else {
			try {
				Mvcs.getResp().sendRedirect(request.getContextPath()+"/admin/erro.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 单页文档删除
	 * @param docid
	 * @param request
	 * @param pager
	 */
	@At("/docs/single/delete/?")
	@Ok("jsp:/admin/user-documentsingle-list.jsp")
	public void deleteDocsingle(String docid, HttpServletRequest request, @Param("::pager") Pager pager){
		
		UserInfo userInfo=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		
		if (userInfo!=null) {//判断是否登录
			boolean flag=documentService.deletDocusingle(docid, userInfo.getId());
			if (flag) {
			    pager=new Pager();
			    userDocSingleList(request, pager);
				return;
			}
		}else {
			try {
				Mvcs.getResp().sendRedirect(request.getContextPath()+"/admin/erro.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	/**
	 * 单页文档列表
	 * @param request
	 * @param pager
	 */
	@At("/docs/single-list/")
	@Ok("jsp:/admin/user-documentsingle-list.jsp")
	public void userDocSingleList(HttpServletRequest request, @Param("::pager") Pager pager){
		UserInfo userInfo=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		if (userInfo!=null) {//判断是否登录
			if (pager==null) {
				pager=new Pager();
			}
			pager.setPageSize(10);
			request.setAttribute("alls", documentService.getUserDocsingle(userInfo.getId(), "id", pager));
			request.setAttribute("pager", pager);
			return;
		} else {
			try {
				Mvcs.getResp().sendRedirect(request.getContextPath()+"/admin/erro.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
