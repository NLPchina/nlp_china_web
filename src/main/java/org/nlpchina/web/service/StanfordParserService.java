package org.nlpchina.web.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.ToAnalysis;
import org.nlpcn.commons.lang.standardization.SentencesUtil;
import org.nlpcn.commons.lang.util.FileFinder;
import org.nlpcn.commons.lang.util.MapCount;
import org.nlpcn.commons.lang.util.StringUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;

import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.parser.lexparser.LexicalizedParser;
import edu.stanford.nlp.trees.Tree;

public class StanfordParserService {

	private static final LexicalizedParser LP = LexicalizedParser.loadModel(FileFinder.find("chinesePCFG.ser.gz").getAbsolutePath());

	public static void main(String[] args) {
		System.out.println(StanfordParserService.parse("我爱北京天安门"));
		;
	}

	/**
	 * stanford ParseService 句法解析
	 */
	public static String parse(String str) {
		
		SentencesUtil su = new SentencesUtil();

		List<String> sentenceList = su.toSentenceList(str);

		if (sentenceList.size() > 0) {
			String s = sentenceList.get(0) ;
			
			if(s.length()>30){
				s = s.substring(0,20) ;
			}
			
			List<Term> parse = ToAnalysis.parse(s);

			List<CoreLabel> rawWords = new ArrayList<CoreLabel>();

			for (Term term : parse) {
				if (StringUtil.isBlank(term.getName()) || "w".equals(term.getNatureStr())) {
					continue;
				}
				CoreLabel cl = new CoreLabel();
				cl.setValue(term.getName());
				cl.setWord(term.getName());
				rawWords.add(cl);
			}

			Tree tree = LP.parse(rawWords);

			JSONArray array = new JSONArray();

			array.add(toJSON(tree, tree.taggedLabeledYield().iterator()));

			return array.toJSONString();
		}
		return "";
	}

	public static JSONObject toJSON(Tree tree, Iterator<CoreLabel> labels) throws JSONException {

		JSONArray children = new JSONArray();
		for (Tree child : tree.getChildrenAsList()) {
			children.add(toJSON(child, labels));
		}

		JSONObject obj = new JSONObject();

		if (tree.isLeaf()) {
			CoreLabel next = labels.next();

			String word = next.get(CoreAnnotations.TextAnnotation.class);
			String pos = next.get(CoreAnnotations.PartOfSpeechAnnotation.class);

			obj.put("word", word);
			obj.put("pos", pos);
			obj.put("ne", "O");
			obj.put("type", "TK");
		} else {
			obj.put("type", tree.label().value());
		}

		JSONObject job = new JSONObject();

		job.put("data", obj);

		job.put("children", children);

		return job;
	}

}
