package org.nlpchina.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.markdown4j.Markdown4jProcessor;
import org.nlpchina.web.domain.DocMenu;
import org.nlpchina.web.domain.Document;
import org.nlpchina.web.domain.Resource;
import org.nlpchina.web.domain.UserInfo;
import org.nlpchina.web.service.GeneralService;
import org.nlpcn.commons.lang.util.StringUtil;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.druid.sql.visitor.functions.Concat;

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

			//document.setAuthor(userInfo.getId());

			document.setExtractingCode(oldDoc.getExtractingCode());

			generalService.update(document);

			result.put("msg", "更新成功!");
			result.put("code", document.getExtractingCode());
			result.put("id", document.getId());
			return result;
		}
	}

	/**
	 * 将单页文档发布为资源
	 * @param docId
	 * @return
	 */
	@At("/doc/publishsingle/?")
	@Ok("json")
	public Map<String, String> publishDoc(String docId,HttpServletRequest request){
		Document document=generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));
		UserInfo userInfo=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		Map<String, String> result = new HashMap<String, String>();
		if (document!=null&&userInfo!=null&&(document.getAuthor()==userInfo.getId())) {
			String url="http://www.nlpcn.org/doc/"+docId;
			Resource resource=generalService.findByCondition(Resource.class, Cnd.where("visit_url", "=", url));
			if (resource==null) {//资源是否已发布
				resource=new Resource();
				Date date=new Date();
				resource.setAuthor(userInfo.getId());
				resource.setCategoryId(3);
				resource.setPublishTime(date);
				resource.setVisitUrl(url);
				String summary="文档查看地址："+url+"\n" +document.getContent();
				if (summary.length()>250) {
					resource.setSummary(summary.substring(0, 250));
				}else {
					resource.setSummary(summary);
				}
				resource.setSysImg("document");
				
				resource.setTitle(document.getName());
				resource.setUpdateTime(date);
				
				
				try {
					generalService.save(resource);
					result.put("msg", "文档发布成功");
					result.put("sta", "1");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					result.put("msg", "sorry, we have a problem now, please try again or contanct administrator! ");
					result.put("sta", "0");
					e.printStackTrace();
				}
			}else {
				result.put("msg", "文档已经发布过，不能重新发布，如有问题，联系管理员");
				result.put("sta", "0");
			}
			
		}else {
			result.put("msg", "未登录，或尝试发布他人文档");
			result.put("sta", "0");
			System.err.println("因为用户id和文档id冲突，不能发布资源");
		}
		
		return result;
		
	}
	
	
	/**
	 * 将多页文档发布为资源
	 * @param docId
	 * @return
	 */
	@At("/doc/publishmenu/?")
	@Ok("json")
	public Map<String, String> publishMenuDoc(Integer menuId,HttpServletRequest request){
		DocMenu docMenu=generalService.find(menuId, DocMenu.class);
		UserInfo userInfo=(UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		Map<String, String> result = new HashMap<String, String>();
		if (docMenu!=null&&userInfo!=null&&(docMenu.getAuthor()==userInfo.getId())) {
			String url="http://www.nlpcn.org/docs/"+menuId;
            
			Resource resource=generalService.findByCondition(Resource.class, Cnd.where("visit_url", "=", url));
			if (resource==null) {//是否已发布
				resource=new Resource();
				Date date=new Date();
				resource.setAuthor(userInfo.getId());
				resource.setCategoryId(3);
				resource.setPublishTime(date);
				System.err.println("地址："+url);
				resource.setVisitUrl(url);
				Document defaultDocument=generalService.findByCondition(Document.class, Cnd.where("id", "=", docMenu.getDocId()));
				String summary="文档查看地址："+url;
				if (defaultDocument!=null) {
					summary=summary+"\n" +defaultDocument.getContent();
				}
				if (summary.length()>250) {
					resource.setSummary(summary.substring(0, 250));
				}else {
					resource.setSummary(summary);
				}
				resource.setSysImg("document");
				
				Pattern pattern = Pattern.compile("<.+?>", Pattern.DOTALL);
				makeMenu2HtmlView(docMenu, null, docMenu.getDocId(),request);
				Matcher matcher = pattern.matcher(docMenu.getHtml());
				String string = matcher.replaceAll(" ");
				resource.setTitle(string);
				resource.setUpdateTime(date);
				
				
				try {
					generalService.save(resource);
					result.put("msg", "文档发布成功");
					result.put("sta", "1");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					result.put("msg", "sorry, we have a problem now, please try again or contanct administrator! ");
					result.put("sta", "0");
					e.printStackTrace();
				}
			}else {
				result.put("msg", "文档已经发布过，不能重新发布，如有问题，联系管理员");
				result.put("sta", "0");
			}
			
		}else {
			result.put("msg", "未登录，或尝试发布他人文档");
			result.put("sta", "0");
			System.err.println("因为用户id和文档id冲突，不能发布资源");
		}
		
		return result;
		
	}
	
	
	/**
	 * 多文档编辑初始进入页
	 * 
	 * @return
	 * 
	 * @return
	 */
	@At("/docs/")
	@Ok("jsp:/document/editor_multi.jsp")
	public String multiDocument(HttpServletRequest request) {
		return "multi";
	}

	/**
	 * 单文档编辑初始进入页
	 * 
	 * @return
	 */
	@At("/doc")
	@Ok("jsp:/document/editor_single.jsp")
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
	@Ok("jsp:/document/view_single.jsp")
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
	@Ok("jsp:/document/view_multi.jsp")
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
	@Ok("jsp:/document/view_multi.jsp")
	public void docView(Integer docMenuId, String docId, HttpServletRequest request) {

		boolean index=false;
		if (docId==null||StringUtil.isBlank(docId)) {
			index=true;
		}
		DocMenu docMenu = generalService.find(docMenuId, DocMenu.class);

		if (docMenu == null) {
			request.getRequestDispatcher("/404.jsp");
		}

		if (docId==null||StringUtil.isBlank(docId)) {
			docId = docMenu.getDocId();
		}

		Document document = generalService.findByCondition(Document.class, Cnd.where("id", "=", docId));

		if (document == null) {

			System.err.println("null c++++++++");
			request.getRequestDispatcher("/404.jsp");
		}

		makeMenu2HtmlView(docMenu, null, docId,request);
		try {
			if (document!=null) {
				document.setContent(new Markdown4jProcessor().process(document.getContent()));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		UserInfo userInfo=generalService.find(docMenu.getAuthor(), UserInfo.class);
		
		request.setAttribute("user", userInfo);
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
	@Ok("jsp:/document/editor_single.jsp")
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
	@Ok("jsp:/document/editor_multi.jsp")
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
	@Ok("jsp:/document/editor_multi.jsp")
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

		makeMenu2Html(docMenu, updateCode, docId);

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
	private void makeMenu2Html(DocMenu docMenu, String extractingCode, String activeId) {

		String content = docMenu.getContent();

		String[] split = content.split("\n");

		StringBuilder sb = new StringBuilder();

		for (String line : split) {
			if (StringUtil.isBlank(line)) {
				continue;
			}
			String temp = line.trim();
			if (temp.startsWith("#")) {
				sb.append("<li class='active'><a>" + temp.substring(1) + "</a></li>\n");
				continue;
			}

			String[] strs = temp.split("\\|");
			boolean active = false;
			if (strs.length == 2) {
				active = strs[1].equalsIgnoreCase(activeId);
				sb.append("<li><a href='/docs/editor/" + docMenu.getId() + "/" + strs[1] + "?code=" + extractingCode + "'");
				if (active) {
					sb.append(" style='color:orange;'>" + strs[0] + "</a></li>\n");
				} else {
					sb.append("'>" + strs[0] + "</a></li>\n");
				}
			}
		}

		docMenu.setHtml(sb.toString());
	}

	/**
	 * 解析文档类生成html
	 * 
	 * @param docMenu
	 * @param request 
	 * @return
	 * @throws Exception
	 */
	private void makeMenu2HtmlView(DocMenu docMenu, String extractingCode, String activeId, HttpServletRequest request) {

		//自动机  状态: 首页  自由状态 在章节中
		String content = docMenu.getContent();

		String[] split = content.split("\n");

		StringBuilder sb = new StringBuilder();

		float num=0;//页数
		int chnum=0;//章节数
		int chapagenum=0;//章节下的页数
		float request_num=0;//请求的第几页
		boolean inchap=false;
		
		
		boolean active = false;
		for (String line : split) {
			num++;
			if (StringUtil.isBlank(line)) {
				continue;
			}
			String temp = line.trim();
			if (temp.startsWith("#")) {
				if (!active) {
				    request_num++;
				}
				chnum++;
				chapagenum=0;
				if (inchap) {
					sb.append("</ul>  </li>");
				}
				sb.append("<li data-level=\""+chnum+"\" data-path=\"\"><a><i class=\"fa fa-check\"></i> <b>"+chnum+".</b>"+ temp.substring(1)+" </a> <ul class=\"articles\">");
				//sb.append("<li class='active'><a>" + temp.substring(1) + "</a></li>\n");
				
				if (!inchap) {
					inchap=true;
				}
				continue;
			}

			String[] strs = temp.split("\\|");
		
			if (strs.length == 2) {
				if (!active) {
					active = strs[1].equalsIgnoreCase(activeId);
				    request_num++;
				}
				
				if (strs[1].equalsIgnoreCase(activeId)) {
					String chapter=chnum+"."+(chapagenum+1);
					sb.append("<li  style='background-color:white' data-level=\""+(inchap==true?chapter:1)+"\" data-path=\""+"/docs/"+docMenu.getId()+"/"+strs[1]+"\"><a href='/docs/" + docMenu.getId() + "/" + strs[1]+"'>"+"<i class=\"fa fa-check \"></i> <b>"+(inchap==true?chapter:"")+"</b>"+ strs[0]+" </a></li>");

				}else {
					String chapter=chnum+"."+(chapagenum+1);

					sb.append("<li  data-level=\""+(inchap==true?chapter:1)+"\" data-path=\""+"/docs/"+docMenu.getId()+"/"+strs[1]+"\"><a href='/docs/" + docMenu.getId() + "/" + strs[1]+"'>"+" <b>"+(inchap==true?chapter:"")+"</b>"+ strs[0]+" </a></li>");

				}
                
				//sb.append("<li><a href='/docs/" + docMenu.getId() + "/" + strs[1]+"'>" + strs[0] + "</a></li>\n");
			}
			
			chapagenum++;//该章节下的文章数+1
		}

		if (inchap) {
			sb.append("</ul>  </li>");
		}
		if (active) {//是否在首页
			
			boolean flag=false;
			request.setAttribute("progress",100*((request_num+1)/(num+1)));
			for (int i = (int) (request_num-2); i >=0; i--) {
				String[] pages=split[i].split("\\|");
				if (pages.length>1) {
					String prepage=pages[1];
					request.setAttribute("prepage",prepage);
					flag=true;
					break;
				}
			}

			if (!flag) {
				request.setAttribute("prepage",-1);
			}
			
			if (request_num<num) {
				for (int i = (int) (request_num); i < split.length; i++) {
					String[] pages=split[i].split("\\|");
					if (pages.length>1) {
						String nextpage=pages[1];
						request.setAttribute("nextpage",nextpage);
					    break;
					}
				}
			}
		}else {
			
			request.setAttribute("progress",100*(1/(num+1)));
			if (num>0) {
				
				for (int i = 0; i < split.length; i++) {
					String[] pages=split[i].split("\\|");
					if (pages.length>1) {
						String nextpage=pages[1];
						request.setAttribute("nextpage",nextpage);
					    break;
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
