package org.nlpchina.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.nlpchina.web.domain.DocMenu;
import org.nlpchina.web.domain.Document;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;

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
	@Ok("redirect:/document/${obj.id}?code=${obj.extractingCode}")
	public DocMenu saveMenu(@Param("::docMenu") DocMenu docMenu) throws Exception {

		if (docMenu.getId() == null) {
			docMenu.setPublishTime(new Date());
			docMenu.setUpdateTime(new Date());
			docMenu.setExtractingCode(UUID.randomUUID().toString().split("-")[1]);
			docMenu.setAuthor("ansj");
			generalService.save(docMenu);
		} else {
			DocMenu oldMenu = generalService.find(docMenu.getId(), DocMenu.class);
			docMenu.setUpdateTime(new Date());
			docMenu.setAuthor("ansj");
			docMenu.setPublishTime(oldMenu.getPublishTime());
			docMenu.setExtractingCode(oldMenu.getExtractingCode());
			generalService.update(docMenu);
		}
		return docMenu;
	}

	@At("/doc/save/")
	@Ok("raw")
	public String saveDoc(@Param("::document") Document document) throws Exception {
		//修改时间
		document.setUpdateTime(new Date());
		
		// 先查询旧的菜单取得修改码
		DocMenu docMenu = null;
		if (document.getMenuId() != null) {
			docMenu = generalService.find(document.getMenuId(), DocMenu.class);
			if (docMenu == null) {
				return "本文档所依付的菜单不存在!";
			}
		}

		Document oldDoc = generalService.findByCondition(Document.class, Cnd.where("id", "=", document.getId()));


		// 全新的存储
		if (oldDoc == null) {
			document.setAuthor("ansj");
			document.setPublishTime(new Date());
			if (document.getMenuId() == null && StringUtils.isEmpty(document.getExtractingCode())) {
				document.setExtractingCode(UUID.randomUUID().toString().split("-")[1]);
			}
			generalService.save(document);
			return "保存成功!";
		}

		// 验证当前文档和验证码是否一样
		// TODO:如果当前用户是作者那么不用验证
		if (docMenu == null) {
			if (!oldDoc.getExtractingCode().equalsIgnoreCase(document.getExtractingCode())) {
				return "验证码失败!";
			}
		} else {
			if (!docMenu.getExtractingCode().equalsIgnoreCase(document.getExtractingCode())) {
				return "验证码失败!";
			}
		}

		document.setAuthor("ansj");

		generalService.update(document);

		return "保存成功";
	}

	/**
	 * 多文档编辑
	 * 
	 * @return
	 */
	@At("/document/")
	@Ok("jsp:/document/document.jsp")
	public void multiDocument(HttpServletRequest request) {
		request.setAttribute("canEditor", true);
		request.setAttribute("docType", "multi");
	}

	/**
	 * 单文档编辑
	 * 
	 * @return
	 */
	@At("/document/single/")
	@Ok("jsp:/document/document.jsp")
	public String singleDocument() {
		return "single";
	}

	/**
	 * 显示多文档
	 * 
	 * @param id
	 * @throws Exception
	 */
	@At("/document/?")
	@Ok("jsp:/document/document.jsp")
	public void showDocuments(Integer id, @Param("code") String extractingCode, HttpServletRequest request) throws Exception {
		DocMenu docMenu = generalService.find(id, DocMenu.class);
		if (docMenu == null) {
			return;
		}

		boolean canEditor = docMenu.getExtractingCode().equalsIgnoreCase(extractingCode);

		boolean update = makeMenu2Html(docMenu, canEditor, extractingCode);

		if (update) {
			generalService.update(docMenu);
		}

		request.setAttribute("canEditor", docMenu.getExtractingCode().equalsIgnoreCase(extractingCode));

		request.setAttribute("docMenu", docMenu);

	}

	@At("/document/?/?")
	@Ok("jsp:/document/document.jsp")
	public void showDocuments(Integer docMenuId, String docId, @Param("code") String extractingCode, HttpServletRequest request) {

		Document document = generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));
		DocMenu docMenu = generalService.find(docMenuId, DocMenu.class);

		String updateCode = docMenu == null ? document.getExtractingCode() : docMenu.getExtractingCode();

		boolean canEditor = updateCode.equalsIgnoreCase(extractingCode);

		makeMenu2Html(docMenu, canEditor, updateCode);

		if(document==null){
			document = new Document() ;
			document.setId(docId);
		}
		request.setAttribute("canEditor", canEditor);
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
	private boolean makeMenu2Html(DocMenu docMenu,boolean canEditor,String extractingCode) {

		String content = docMenu.getContent();

		String[] split = content.split("\n");

		StringBuilder sb = new StringBuilder();
		StringBuilder md = new StringBuilder();

		boolean update = false;

		for (String line : split) {
			if (StringUtils.isEmpty(line)) {
				md.append(line);
				continue;
			}

			String[] params = line.trim().split("\\|");

			List<String> list = new ArrayList<String>();
			for (String param : params) {
				if (!StringUtils.isEmpty(param)) {
					list.add(param.trim());
				}
			}
			if (list.size() == 1) {
				md.append(list.get(0) + "\n");
				sb.append("<li><a>" + list.get(0) + "</a></li>\n");
			} else if (list.size() == 2 && "active".equalsIgnoreCase(list.get(1))) {
				String uuid = UUID.randomUUID().toString();
				sb.append("<li class='active'><a href='/document/+" + docMenu.getId() + "/" + uuid +(canEditor?"?code="+extractingCode:"")+ "'>" + list.get(0) + "</a></li>\n");
				md.append(list.get(0) + "|active|" + uuid + "\n");
				update = true;
			} else if (list.size() == 3 && "active".equalsIgnoreCase(list.get(1))) {
				sb.append("<li class='active'><a href='/document/" + docMenu.getId() + "/" + list.get(2) + (canEditor?"?code="+extractingCode:"") +"'>" + list.get(0) + "</a></li>\n");
				md.append(list.get(0) + "|active|" + list.get(2) + "\n");
			} else {
				md.append(line);
			}

		}

		docMenu.setHtml(sb.toString());

		docMenu.setContent(md.toString());

		return update;
	}
}
