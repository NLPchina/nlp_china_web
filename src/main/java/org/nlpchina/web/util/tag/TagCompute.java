package org.nlpchina.web.util.tag;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;
import java.util.Map.Entry;

import love.cq.util.CollectionUtil;
import love.cq.util.IOUtil;
import love.cq.util.MapCount;

import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;
import org.ansj.domain.Term;
import org.ansj.library.InitDictionary;
import org.ansj.library.UserDefineLibrary;
import org.ansj.splitWord.analysis.ToAnalysis;
import org.ansj.util.MyStaticValue;
import org.nlpchina.web.util.FileFinder;
import org.nlpchina.web.util.StaticValue;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

public class TagCompute {
	public static final Word2VEC w2v = new Word2VEC();

	private static final List<String> TAGS = new ArrayList<String>();
	
	private static final Map<String,String[]> tagMap = Maps.newHashMap() ;
	static {
		try {
			w2v.loadGoogleModel(FileFinder.find("corpus.bin").getAbsolutePath());
			
			BufferedReader reader = IOUtil.getReader(FileFinder.find("360tag_all.txt").getAbsolutePath(), "utf-8") ;
			
			String temp = null ;
			
			while((temp=reader.readLine())!=null){
				String[] split = temp.split("\\s+") ;
				
				tagMap.put(split[0],split);
			}

//			HashMap<String, float[]> wordMap = w2v.getWordMap();

//			String key = null;
//			for (Entry<String, float[]> entry : wordMap.entrySet()) {
//
//				key = entry.getKey();
//
//				if (key.length() < 1) {
//					continue;
//				}

//				List<Term> parse = ToAnalysis.parse(key);
//
//				if (parse.size() > 1) {
//					continue;
//				}
//
//				if (!UserDefineLibrary.contains(key) && !InitDictionary.isInSystemDic(key)) {
//					continue;
//				}
//
//				if ("nr".equals(parse.get(0).getNatrue().natureStr) || "num".equals(parse.get(0).getNatrue().natureStr) || "m".equals(parse.get(0).getNatrue().natureStr)
//						|| "c".equals(parse.get(0).getNatrue().natureStr)|| "d".equals(parse.get(0).getNatrue().natureStr)
//						|| "vi".equals(parse.get(0).getNatrue().natureStr)){
//					continue;
//				}
//
//				TAGS.add(entry.getKey());
//			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		List<String> lists = new ArrayList<String>();

//		String content = ("　　据中央纪委监察部网站消息，青岛远洋运输有限公司原副总经理宋军，因受贿罪、贪污罪、妨害作证罪被依法判处刑罚，日前，青岛市纪委根据《中国共产党纪律处分条例》等有关规定，决定给予宋军开除党籍处分。　　以下为相关报道：青岛国企原副总贪污600多万美元受审 在北京购27套房   　　京华时报[微博]2011年10月17日报道：年拥有经济学博士头衔的青岛远洋运输有限公司(下称青远公司)副总经理宋军，2009年7月在北京的家中被抓，涉贪落马。　　宋军涉嫌贪污、受贿、妨害作证三宗罪被提起公诉，其中贪污款高达600余万美元。检方指控，宋军用这些钱在北京、天津等地大肆买房，仅在北京就购房27套，其中石景山万达广场就购买25套房产。　　10月9日，青岛市中级人民法院再次开庭审理了此案。　　国企副总突然落马　　宋军现年48岁，汉族，天津人。案发前，宋军任青远公司副总经理，兼任青岛汇泉船务公司、青岛远洋国际船舶贸易公司董事长，是中远系统(中国远洋(2.99, -0.05, -1.64%)运输(集团)总公司)最年轻的副厅级干部之一。　　工作之余，宋军还在南开大学国际经济研究所修了经济学博士，其专业方向为国际并购与融资，2004年被授予博士学位。　　据了解，宋军于2001年调任青远公司担任副总，此前他是中远集团总公司纪委书记。来到青远公司后，宋军成为第一副总，分管陆上产业，包括除航运以外的船员、船舶修理、房地产开发等21家附属公司。　　正在宋军事业风生水起之际，2009年5月15日，青岛市四方区检察院以涉嫌贪污罪决定对他刑事拘留。两个月后，宋军在北京海淀区的家中被警方抓获，一名被寄予厚望正值事业上升期的年轻干部，就此落马。　　被控涉贪等三宗罪　　贪污罪　　起诉书称，2006年10月至2008年6月，宋军利用担任青远副总等职务便利，和一名台商邓某共同投资买卖租赁船舶，贪污公款高达606.5万美元。　　受贿罪　　宋军被控在合伙购买船舶期间，向邓某索要净利润的20%用于处理关系。邓某同意后，将100万美元汇入宋军指定的账户。　　宋军案侦办时间长达一年半，去年11月，青岛市检察院以涉嫌贪污、受贿、妨害作证三宗罪对宋军提起公诉。　　妨害作证罪　　检方指出，2008年至2009年6月，宋军为避免贪污、受贿被发现，与邓某等人串通，致使对方在接受检察机关询问、讯问期间，按照与他事先商议的内容，隐瞒事实真相，向检方提供虚假证言，给检方立案侦查宋军的贪污犯罪制造障碍。　　两次开庭自称无罪　　据检方指控，2007年4月至9月，宋军分4次将贪污款中的605万美元取出，随后和江苏商人陈某兑换成人民币，用于炒股、买房、买车、装修等。截至案发前，宋军在北京、天津、青岛购买房产多达37套，仅位于北京石景山区的万达广场就置业25套。　　今年4月，此案在青岛市中院开庭审理。10月9日，青岛市中院继续开庭审理此案。法庭上，宋军表示不认罪，辩护律师宣东也为他做了无罪辩护。　　控辩焦点　　权钱房牵出的罗生门　　对于检方的每一项指控，宋军都能自圆其说。他的各种各样的“朋友”，在检方的指控中出演了各种各样的“角色”。而据宋军说，他每一步行动都是应朋友之邀、帮公司做事。控辩双方对于此案的三个争议焦点也浮出水面。　　贪贿　　帮公家卖船？　　为自己贪财？　　控辩交锋　　检方认为，宋军在任期间，同意并操作汇泉公司与邓某合作，共同投资买卖、租赁3艘货船，而后将这些投资款、卖船利润、保证金等共计1180余万美元私自存放在邓某的一个香港汇理银行的公司账户中。　　宋军及其辩护律师称，汇泉公司支付的只是租船保证金，作为名义股东没有收益分配权，宋军无法贪污公司账户上的美元。　　宋军说，2006年初，邓某提出想和他任董事长的汇泉公司共同投资，在巴拿马组建公司，从事船只买卖，而后再将船出租给汇泉公司使用。　　宋军称，他咨询专业人士意见时被告知，因有政策规定，原则上不允许境内企业向境外未建立外汇关系的国家和地区设立公司，特殊情况需要得到商务部的审批。　　而邓某说，汇泉公司可做名义股东。随后，宋军签字同意合作，按规定汇泉占50%的名义股东，不参股，没有经营管理权，不获得股东利益。　　汇泉公司转给邓某120万美元作为租赁保证金。加上这笔钱邓某给付了船只的首付款260万美元，宋军作为名义股东汇泉公司的董事长在担保协议上签了字。2008年，船只行市看涨，邓某将自己手里的三艘船卖掉，并按照协议给付汇泉公司违约金等款项。　　兑换　　帮朋友借款？　　为贪款变现？　　控辩交锋　　检方认为，这些钱都是宋军贪污的美元，由陈某帮其兑换成人民币，指控其贪污的600余万美元，扣除欠款，正好是陈某兑换给宋军的2380万人民币。　　宋军及其辩护律师认为，这笔钱是帮陈某借来的美元，目的是让陈某购买青岛远洋大厦的部分产业。作为回报，陈某两次购买了青远大厦的房产。　　江苏商人陈某，原是江苏丹阳市委要员的秘书，和青远公司有过应酬往来，因此结识了青远副总宋军。　　2006年，陈某辞职经商。他的证言显示，2006年底，他想投资江苏淮安某县级市的一个项目，但对方要求外资，于是他想问问宋军，能否帮忙借点美元。　　当时，宋军分管的青岛远洋大厦也在寻求资金。宋军供述说，自己想让陈某投点资，于是答应帮他借美元。　　宋军说，基于这种想法，他找到邓某，请他借点美元给陈某救急，并约定利息为4%。2007年4月底，宋军转给陈某290万美元。随后，他又多次给陈某转钱，约定利息都是4%。陈某也给邓某写了借条。　　买房　　帮熟人理财？　　为自己置业？　　控辩交锋　　检方调查，这些房产开始都是在宋军的母亲和弟弟名下。实际就是用宋军的贪污款购买的。直到2009年1月，才陆续转移到陈某名下。李某和陈某的理财协议是补写的，目的是让宋军逃避法律制裁。　　宋军及其辩护律师认为，这些房产是李某帮助陈某理财时，借用母亲和弟弟的名义购买。只是答应事后给他们一些收益。　　据指控，宋军涉贪的巨款大部分被其用作购买房产，涉案共37套房产。而宋军说，这些房产并非都是他的产业，是帮朋友陈某理财。　　宋军说，陈某下海经商后，看中了自己在投资理财领域的能力，想请自己帮助理财。但是作为国企副总，自己不便出面，就介绍了好友李某。双方见面后，陈某决定请李某帮忙投资。　　2007年4月底，李某收到第一笔理财款为2240万人民币，并将这笔钱投资炒股，但收益平平。宋军建议李某投资房地产，于是李某用这笔钱在青岛和天津各购买了一套住房，在北京顺义区购买了一套别墅。后来，李某的账户上又陆续进了2380万人民币。李某在笔录中称，他还是用这些钱买了房子，其中在天津购房3套，在顺义区又购买别墅1套，在石景山的万达广场则购房25套。(京华时报记者 刘杰)。");
//
//		List<Keyword> computeArticleTfidf = new KeyWordComputer(5).computeArticleTfidf(content);
//		System.out.println(computeArticleTfidf);
		long start = System.currentTimeMillis();
		// for (Term term : parse) {
		// lists.add(term.getName()) ;
		// }
//		for (Keyword keyword : computeArticleTfidf) {
//			lists.add(keyword.getName());
//		}
		
		System.out.println(w2v.distance(Lists.newArrayList("苹果","手机")));
		
		Scanner sc = new Scanner(System.in)  ;
//		while(true){
			System.out.print("输入:");
//			String next = sc.nextLine() ;
			
			List<Term> parse = ToAnalysis.parse("苹果  三星 黑莓") ;
			
			lists = Lists.newArrayList() ;
			
			for (Term term : parse) {
				lists.add(term.getName()) ;
			}
			tags(lists) ;

			System.out.println("------------------------------------------------------------------------------------");
			
			parse = ToAnalysis.parse("吃 苹果 香蕉 橘子") ;
			
			lists = Lists.newArrayList() ;
			
			for (Term term : parse) {
				lists.add(term.getName()) ;
			}
			tags(lists) ;
			System.out.println("------------------------------------------------------------------------------------");
//		}

//		//抽取关键词
//		tags(Lists.newArrayList("苹果","三星")) ;
//		
//		tags(Lists.newArrayList("苹果","西瓜")) ;
//		
//		tags(Lists.newArrayList("高层","楼房","板楼")) ;
//
//		tags(Lists.newArrayList("高层","领导")) ;
//
//		tags(Lists.newArrayList("制服","警服","衣服")) ;
//
//		tags(Lists.newArrayList("制服","控制") );

		
	}

	private static void tags(List<String> lists) {
		//利用word2vec找到所有的词
		Set<WordEntry> distance = w2v.distance(lists) ;
		System.out.println(lists);
		System.out.println(distance);
		
		
		//利用几个词语找到最大共现
		
		MapCount<String> mc = new MapCount<>() ;
		for (WordEntry wordEntry : distance) {
			String[] strings = tagMap.get(wordEntry.name) ;
			if(strings==null){
				continue ;
			}
			for (String string : strings) {
				mc.add(string) ;
			}
		}
		List<Entry<String, Integer>> subList = CollectionUtil.sortMapByValue(mc.get(), 1).subList(0, 5) ;
	}

}
