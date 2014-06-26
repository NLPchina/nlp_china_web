package org.nlpchina.web.service;

import java.util.List;

import org.nlpchina.web.domain.DocMenu;
import org.nlpchina.web.domain.Document;
import org.nlpcn.commons.lang.util.StringUtil;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.alibaba.druid.sql.visitor.functions.Concat;
/**
 * 文档数据库操作
 * @author Administrator
 *
 */

@IocBean
public class DocumentService {
	
	@Inject
	protected Dao dao;
	
	@Inject
	protected GeneralService generalService;
	
	/**
	 * 根据用户id返回其多页文档
	 * @param authorId
	 * @param order
	 * @param pager
	 * @return
	 */
	public List<DocMenu> getUserDocMenus(Integer authorId, String order, Pager pager) {
		List<DocMenu> result=generalService.searchByPage(DocMenu.class, Cnd.where("author", "=", authorId).desc("id"), pager);
		for (DocMenu docMenu : result) {
			makeMenu2HtmlView(docMenu, null, docMenu.getDocId());
		}
		return result;
		
	}
	
	
	/**
	 * 根据用户id返回其单页文档
	 * @param authorId
	 * @param order
	 * @param pager
	 * @return
	 */
	public List<Document> getUserDocsingle(Integer authorId, String order, Pager pager) {
		List<Document> result=generalService.searchByPage(Document.class, Cnd.where("author", "=", authorId).and("menu_id", "is ", null).desc("id"), pager);
		
		return result;
		
	}
	
	
	public boolean deletDocumenu(Integer menu_id, Integer authorId){
		Sql sql = Sqls.create("delete from  document where menu_id ="+menu_id+"  and author="+ authorId);
		dao.execute(sql);
		generalService.delById(menu_id, DocMenu.class);
		List<Document> documents=generalService.search(Document.class, Cnd.where("menu_id","=",menu_id));
		DocMenu  docMenus=generalService.find(menu_id, DocMenu.class);
		if (documents.size()>0||docMenus!=null) {
			System.err.println("删除文档发生错误");
			return false;
		}
		
		return true;
	}
	
	
	public boolean deletDocusingle(String docid, Integer authorId){
		Sql sql = Sqls.create("delete from  document where id ='"+docid+"'  and author="+ authorId);
		dao.execute(sql);
		List<Document> documents=generalService.search(Document.class, Cnd.where("id","=",docid));
		if (documents.size()>0) {
			System.err.println("删除文档发生错误");
			return false;
		}
		
		return true;
	}
	
	
	
	/**
	 * 解析文档类生成html
	 * 
	 * @param docMenu
	 * @return
	 * @throws Exception
	 */
	private void makeMenu2HtmlView(DocMenu docMenu, String extractingCode, String activeId) {

		String content = docMenu.getContent();

		String[] split = content.split("\n");

		docMenu.setNum(split.length);
		StringBuilder sb = new StringBuilder();

		for (String line : split) {
			if (StringUtil.isBlank(line)) {
				continue;
			}
			String temp = line.trim();
			if (temp.startsWith("#")) {
				sb.append("<li role='presentation' ><a role='menuitem' tabindex='-1' href='#'>" + temp.substring(1) + "</a></li>\n");
				continue;
			}

			String[] strs = temp.split("\\|");
			boolean active = false;
			if (strs.length == 2) {
				active = strs[1].equalsIgnoreCase(activeId);
				sb.append("<li><a href='/docs/" + docMenu.getId() + "/" + strs[1]+"'>" + strs[0] + "</a></li>\n");
			}
		}

		docMenu.setHtml(sb.toString());
	}


}
