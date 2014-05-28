package org.nlpchina.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nlpchina.web.domain.DocMenu;
import org.nlpchina.web.domain.Document;
import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nlpchina.web.util.StringUtil;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
public class DocumentAction {

	@Inject
	private GeneralService generalService;

	/**
	 * 保存菜单栏,并且为每个菜单栏生成唯一ID
	 * 
	 * @param content
	 * @return
	 * @throws Exception
	 */
	@At("/doc_menu/save/")
	@Ok("redirect:/docs/editor/${obj.id}?code=${obj.extractingCode}")
	public DocMenu saveMenu(@Param("::docMenu") DocMenu docMenu) throws Exception {

		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = UserInfo.DEFAULT_USER;
		}

		makeMenu2Content(docMenu);

		if (docMenu.getId() == null) {
			docMenu.setPublishTime(new Date());
			docMenu.setUpdateTime(new Date());
			docMenu.setDocId(UUID.randomUUID().toString());
			docMenu.setExtractingCode(UUID.randomUUID().toString().split("-")[1]);
			docMenu.setAuthor(userInfo.getId());
			generalService.save(docMenu);
		} else {
			DocMenu oldMenu = generalService.find(docMenu.getId(), DocMenu.class);
			docMenu.setUpdateTime(new Date());
			docMenu.setAuthor(userInfo.getId());
			docMenu.setPublishTime(oldMenu.getPublishTime());
			docMenu.setExtractingCode(oldMenu.getExtractingCode());
			docMenu.setDocId(oldMenu.getDocId());
			generalService.update(docMenu);
		}
		return docMenu;
	}

	@At("/doc/save/")
	@Ok("json")
	public Map<String, String> saveDoc(@Param("::document") Document document) throws Exception {

		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");

		if (userInfo == null) {
			userInfo = UserInfo.DEFAULT_USER;
		}

		document.setUpdateTime(new Date());

		Map<String, String> result = new HashMap<String, String>();

		// 先查询旧的菜单取得修改码
		DocMenu docMenu = null;
		if (document.getMenuId() != null) {
			docMenu = generalService.find(document.getMenuId(), DocMenu.class);
			if (docMenu == null) {
				result.put("msg", "保存失败,本文档所依付的菜单不存在!");
				return result;
			}
		}

		if (docMenu == null) {
			result.put("type", "single");
		} else {
			result.put("type", "multi");
		}

		Document oldDoc = null;
		if (!StringUtil.isBlank(document.getId())) {
			oldDoc = generalService.findByCondition(Document.class, Cnd.where("id", "=", document.getId()));
		} else {
			document.setId(UUID.randomUUID().toString());
		}

		// 全新的存储
		if (oldDoc == null) {
			document.setAuthor(userInfo.getId());
			document.setPublishTime(new Date());
			if (document.getMenuId() == null && StringUtil.isBlank(document.getExtractingCode())) {
				document.setExtractingCode(UUID.randomUUID().toString().split("-")[1]);
			}
			generalService.save(document);
			result.put("msg", "保存成功!");
			result.put("code", document.getExtractingCode());
			result.put("id", document.getId());
			return result;
		} else {

			// 验证当前文档和验证码是否一样
			// TODO:如果当前用户是作者那么不用验证

			String code = docMenu == null ? oldDoc.getExtractingCode() : docMenu.getExtractingCode();

			if (!code.equalsIgnoreCase(code)) {
				result.put("msg", "验证码错误!");
				return result;
			}

			document.setAuthor(userInfo.getId());

			document.setExtractingCode(oldDoc.getExtractingCode());

			generalService.update(document);

			result.put("msg", "更新成功!");
			result.put("code", document.getExtractingCode());
			result.put("id", document.getId());
			return result;
		}
	}

	/**
	 * 多文档编辑初始进入页
	 * 
	 * @return
	 * 
	 * @return
	 */
	@At("/docs/")
	@Ok("jsp:/document/doc_editor.jsp")
	public String multiDocument(HttpServletRequest request) {
		return "multi";
	}

	/**
	 * 单文档编辑初始进入页
	 * 
	 * @return
	 */
	@At("/doc")
	@Ok("jsp:/document/doc_editor.jsp")
	public String singleDocument() {
		return "single";
	}

	/**
	 * 单文档查看
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	@At("/doc/?")
	@Ok("jsp:/document/doc_view.jsp")
	public void docView(String docId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Document document = generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));
		if (document == null) {
			request.setAttribute("message", "您访问的文档没有找到!");
			request.getRequestDispatcher("/404.jsp").forward(request, response);
			;
		}
		request.setAttribute("document", document);
	}

	/**
	 * 多文档查看
	 * 
	 * @param docMenuId
	 * @param request
	 * @throws Exception
	 */
	@At("/docs/?")
	@Ok("jsp:/document/doc_view.jsp")
	public void docView(Integer docMenuId, HttpServletRequest request) throws Exception {
		docView(docMenuId, null, request);
	}

	/**
	 * 多文档查看
	 * 
	 * @param docMenuId
	 * @param docId
	 * @param extractingCode
	 * @param request
	 */
	@At("/docs/?/?")
	@Ok("jsp:/document/doc_view.jsp")
	public void docView(Integer docMenuId, String docId, HttpServletRequest request) {

		DocMenu docMenu = generalService.find(docMenuId, DocMenu.class);

		if (docMenu == null) {
			request.getRequestDispatcher("/404.jsp");
		}

		if (StringUtil.isBlank(docId)) {
			docId = docMenu.getDocId();
		}

		Document document = generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));

		if (document == null) {
			request.getRequestDispatcher("/404.jsp");
		}

		makeMenu2Html(docMenu, false, null, docId);

		request.setAttribute("document", document);
		request.setAttribute("docMenu", docMenu);
	}

	/**
	 * 单文档编辑
	 * 
	 * @param id
	 * @throws Exception
	 */
	@At("/doc/editor/?")
	@Ok("jsp:/document/doc_editor.jsp")
	public void docEditor(String docId, @Param("code") String extractingCode, HttpServletRequest request) {
		// TODO:先判断用户权限

		Document document = generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));
		if (document == null) {
			request.getRequestDispatcher("/404.jsp");
		}
		if (!extractingCode.equals(document.getExtractingCode())) {
			request.setAttribute("message", "你输入的提取码错误!");
			request.getRequestDispatcher("/404.jsp");
		}

		request.setAttribute("document", document);
	}

	/**
	 * 多文档编辑
	 * 
	 * @param id
	 * @throws Exception
	 */
	@At("/docs/editor/?")
	@Ok("jsp:/document/doc_editor.jsp")
	public void docEditor(Integer docMenuId, @Param("code") String extractingCode, HttpServletRequest request, HttpServletResponse response) throws Exception {
		docEditor(docMenuId, null, extractingCode, request, response);
	}

	/**
	 * 多文档编辑
	 * 
	 * @param docMenuId
	 * @param docId
	 * @param extractingCode
	 * @param request
	 * @throws Exception
	 */
	@At("/docs/editor/?/?")
	@Ok("jsp:/document/doc_editor.jsp")
	public void docEditor(Integer docMenuId, String docId, @Param("code") String extractingCode, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// TODO:先判断用户权限

		DocMenu docMenu = generalService.find(docMenuId, DocMenu.class);

		if (docMenu == null) {
			request.getRequestDispatcher("/404.jsp");
		}

		if (StringUtil.isBlank(docId)) {
			docId = docMenu.getDocId();
		}

		Document document = generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));

		String updateCode = docMenu == null ? document.getExtractingCode() : docMenu.getExtractingCode();

		boolean canEditor = updateCode.equalsIgnoreCase(extractingCode);

		if (!canEditor) {
			request.setAttribute("message", "你输入的提取码错误!");
			request.getRequestDispatcher("/404.jsp").forward(request, response);
			return;
		}

		makeMenu2Html(docMenu, canEditor, updateCode, docId);

		if (document == null) {
			document = new Document();
			document.setId(docId);
		}
		request.setAttribute("document", document);
		request.setAttribute("docMenu", docMenu);
	}

	/**
	 * 解析文档类生成html
	 * 
	 * @param docMenu
	 * @return
	 * @throws Exception
	 */
	private void makeMenu2Html(DocMenu docMenu, boolean canEditor, String extractingCode, String activeId) {

		String content = docMenu.getContent();

		String[] split = content.split("\n");

		StringBuilder sb = new StringBuilder();

		for (String line : split) {
			if (StringUtil.isBlank(line)) {
				continue;
			}
			String temp = line.trim();
			if (temp.startsWith("#")) {
				sb.append("<li><a>" + temp.substring(1) + "</a></li>\n");
				continue;
			}

			String[] strs = temp.split("\\|");
			boolean active = false;
			if (strs.length == 2) {

				active = strs[1].equalsIgnoreCase(activeId);

				if (canEditor) {
					sb.append("<li class='active'><a href='/docs/editor/" + docMenu.getId() + "/" + strs[1] + "?code=" + extractingCode + "'");
					if (active) {
						sb.append(" style='color:orange;'>" + strs[0] + "</a></li>\n");
					} else {
						sb.append("'>" + strs[0] + "</a></li>\n");
					}
				} else {
					sb.append("<li class='active'><a href='/docs/" + docMenu.getId() + "/" + strs[1].trim() + "'");
					if (active) {
						sb.append(" style='color:orange;'>" + strs[0] + "</a></li>\n");
					} else {
						sb.append("'>" + strs[0] + "</a></li>\n");
					}
				}
			}
		}

		docMenu.setHtml(sb.toString());
	}

	private void makeMenu2Content(DocMenu docMenu) {

		String content = docMenu.getContent().replace("\r", "");

		String[] split = content.split("\n");

		StringBuilder md = new StringBuilder();

		for (String line : split) {
			if (StringUtil.isBlank(line)) {
				md.append("\n");
				continue;
			}
			String temp = line.trim();
			if (temp.startsWith("#")) {
				md.append(line + "\n");
				continue;
			}
			String[] strs = temp.split("\\|");
			if (strs.length == 1) {
				md.append(line + "|" + UUID.randomUUID().toString() + "\n");
			} else {
				md.append(line + "\n");
			}
		}

		System.out.println(md.toString());
		docMenu.setContent(md.toString());
	}

}
