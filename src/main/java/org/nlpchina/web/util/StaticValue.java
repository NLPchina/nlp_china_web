package org.nlpchina.web.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nlpchina.web.domain.Category;
import org.nlpchina.web.domain.Tag;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.Cnd;
import org.nutz.ioc.Ioc;
import org.nutz.mvc.NutConfig;

/**
 * 用来存储全局的静态值，可能会发生改变
 * 
 * @author Ansj
 * 
 */
public class StaticValue {

	public static Map<Integer, Category> categoryMap = new HashMap<Integer, Category>();
	
	public static String siteToken ;
	
	public static String siteUid ;
	
	public static Ioc ioc = null ;

	public synchronized static void updateTags(NutConfig nc) {
		GeneralService generalService = nc.getIoc().get(GeneralService.class);
		List<Tag> tags = generalService.search(Tag.class, Cnd.where("type", "=", 1));
		nc.setAttribute("APP_TAGS", tags);
	}

	public synchronized static void updateCategorys(NutConfig nc) {
		GeneralService generalService = nc.getIoc().get(GeneralService.class);
		List<Category> categorys = generalService.search(Category.class, Cnd.orderBy().asc("id"));
		Map<Integer, Category> categoryMap = new HashMap<Integer, Category>();
		for (Category category : categorys) {
			categoryMap.put(category.getId(), category);
		}
		StaticValue.categoryMap = categoryMap;
		nc.setAttribute("APP_CATEGORYS", categorys);

	}
}
