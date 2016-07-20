package org.nlpchina.web.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;
import org.ansj.app.summary.SummaryComputer;
import org.ansj.app.summary.TagContent;
import org.ansj.app.summary.pojo.Summary;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.BaseAnalysis;
import org.ansj.splitWord.analysis.IndexAnalysis;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.ansj.splitWord.analysis.ToAnalysis;
import org.nlpchina.web.service.StanfordParserService;
import org.nlpcn.commons.lang.jianfan.JianFan;
import org.nlpcn.commons.lang.pinyin.Pinyin;
import org.nlpcn.commons.lang.util.StringUtil;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.google.common.collect.Lists;

@IocBean
public class InfcnDemoAction {

	private static final String DEFAULT_CONTENT = "码完代码，他起身关上电脑，用滚烫的开水为自己泡制一碗腾着热气的老坛酸菜面。中国的程序员更偏爱拉上窗帘，在黑暗中享受这独特的美食。这是现代工业给一天辛苦劳作的人最好的馈赠。南方一带生长的程序员虽然在京城多年，但仍口味清淡，他们往往不加料包，由脸颊自然淌下的热泪补充恰当的盐分。他们相信，用这种方式，能够抹平思考着现在是不是过去想要的未来而带来的大部分忧伤…小李的父亲在年轻的时候也是从爷爷手里接收了祖传的代码，不过令人惊讶的是，到了小李这一代，很多东西都遗失了，但是程序员苦逼的味道保存的是如此的完整。 就在24小时之前，最新的需求从PM处传来，为了得到这份自然的馈赠，码农们开机、写码、调试、重构，四季轮回的等待换来这难得的丰收时刻。码农知道，需求的保鲜期只有短短的两天，码农们要以最快的速度对代码进行精致的加工，任何一个需求都可能在24小时之后失去原本的活力，变成一文不值的垃圾创意。";

	@At("/infcn/demo/")
	@Ok("jsp:/infcn_demo.jsp")
	public void demo(@Param("content") String content, HttpServletRequest request) {

		if (StringUtil.isBlank(content)) {
			content = DEFAULT_CONTENT;
		}

		// nlp分词
		List<String[]> nlpResult = nameAndNature(NlpAnalysis.parse(content));

		// nlp-min分词
		List<String[]> nlpMinResult = minNameAndNature(NlpAnalysis.parse(content));

		// to分词
		List<String[]> toResult = nameAndNature(ToAnalysis.parse(content));

		// basic分词
		List<String[]> minResult = nameAndNature(BaseAnalysis.parse(content));

		// index分词
		List<String[]> indexResult = nameAndNature(IndexAnalysis.parse(content));

		// 关键词提取
		KeyWordComputer keyWordComputer = new KeyWordComputer(30);
		Collection<Keyword> keyWords = keyWordComputer.computeArticleTfidf(content);

		// 文档摘要
		SummaryComputer sc = new SummaryComputer(null, content);
		Summary summary = sc.toSummary();
		String summaryStr = new TagContent("<font color=\"red\">", "</font>").tagContent(summary) + "....";

		request.setAttribute("fanStr", JianFan.j2F(content));
		request.setAttribute("jianStr", JianFan.f2J(content));
		request.setAttribute("pinStr", Pinyin.pinyinStr(content));
		request.setAttribute("nlpResult", nlpResult);
		request.setAttribute("nlpMinResult", nlpMinResult);
		request.setAttribute("toResult", toResult);
		request.setAttribute("minResult", minResult);
		request.setAttribute("indexResult", indexResult);
		request.setAttribute("keyWords", keyWords);
		request.setAttribute("summaryStr", summaryStr);
		request.setAttribute("content", content);

	}

	@At("/syntactic/")
	@Ok("jsp:/syntactic/home.jsp")
	public String syntactic(@Param("content") String content) {
		return StanfordParserService.parse(content);
	}

	private List<String[]> nameAndNature(List<Term> parse) {
		List<String[]> result = Lists.newArrayList();
		for (Term term : parse) {
			if (StringUtil.isNotBlank(term.getName())) {
				result.add(new String[] { term.getName(), term.getNatureStr() });
			}
		}
		return result;
	}

	private List<String[]> minNameAndNature(List<Term> parse) {
		List<String[]> result = Lists.newArrayList();
		for (Term term : parse) {
			if (StringUtil.isNotBlank(term.getName())) {
				result.add(new String[] { term.getSubTerm() == null ? term.getName() : term.getSubTerm().toString(), term.getNatureStr() });
			}
		}
		return result;
	}

	public static void main(String[] args) {
		System.out.println(ToAnalysis.parse("1987．08"));
	}
}
