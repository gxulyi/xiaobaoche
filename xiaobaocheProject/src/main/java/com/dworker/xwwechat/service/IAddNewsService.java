package com.dworker.xwwechat.service;

import java.util.Date;

import org.nutz.dao.Chain;
import org.nutz.dao.Dao;
import org.nutz.lang.util.Context;

import com.dworker.xwwechat.IService;
import com.xwqp88.dao.IDaos;
import com.xwqp88.util.NumberUtil;
/**
 * 
 * @author 路露
 * @time 2015-11-18
 * @decription 添加新闻逻辑接口实现
 * @name service_add_news.groovy
 *
 */
public class IAddNewsService implements IService<Integer> {
	Dao dao = null;
	String title,content,state,type,ids;
	Chain chain = null;
	public Integer service(Context context) {
		System.out.print(context);
		dao = IDaos.getDao("dataSource");
		ids = context.getString("ids");
		title =  context.getString("title","");
		content = context.getString("content","");
		state = context.getString("state","0");
		type = context.getString("type","");
		
		Chain chain = Chain.make("news_id", ids);
		chain.add("title", title).add("state",context.getString("state", "0"));
		chain.add("content", content).add("type", type);
		chain.add("in_date", new Date(System.currentTimeMillis()));
	
		try {
			dao.insert("ti_wechat", chain);
			
		} catch (Exception e) {
			return -1;
		
		}
		context.set("news_id", ids);
		return 0;
	}
}	