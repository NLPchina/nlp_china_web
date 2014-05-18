package org.nlpchina.web.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nlpchina.web.domain.Category;
import org.nlpchina.web.domain.Tag;
import org.nlpchina.web.service.GeneralService;
import org.nutz.dao.Cnd;

/**
 * 用来存储全局的静态值，可能会发生改变
 * 
 * @author Ansj
 * 
 */
public class StaticValue {

	public static List<Tag> tags = new ArrayList<Tag>();

	public static Map<Integer, Category> categoryMap = new HashMap<Integer, Category>();

	public static List<Category> categorys = new ArrayList<Category>();

	
	public synchronized static void updateTags(GeneralService generalService) {
		List<Tag> tags = generalService.search(Tag.class, Cnd.where("type", "=", 1));
		StaticValue.tags = tags;
	}

	public synchronized static void updateCategorys(GeneralService generalService) {
		List<Category> categorys = generalService.search(Category.class, Cnd.orderBy().asc("id"));
		Map<Integer, Category> categoryMap = new HashMap<Integer, Category>();
		for (Category category : categorys) {
			categoryMap.put(category.getId(), category);
		}
		StaticValue.categorys = categorys ;
		StaticValue.categoryMap = categoryMap;
	}
}
