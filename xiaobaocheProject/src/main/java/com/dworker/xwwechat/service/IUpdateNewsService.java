package com.dworker.xwwechat.service;

import java.util.Date;

import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.util.Context;

import com.dworker.xwwechat.IService;
import com.xwqp88.dao.IDaos;
/**
 * 
 * @author 路露
 * @time 2015-11-18
 * @decription 更新新闻逻辑接口实现
 * @name service_update_news.groovy
 *
 */
public class IUpdateNewsService implements IService<Integer> {
	Dao dao = null;
	String title,content,state,type,news_id;
	Chain chain = null;
	
	public Integer service(Context context) {
		dao = IDaos.getDao("dataSource");
		news_id =  context.getString("news_id","");
		title =  context.getString("title","");
		content = context.getString("content","");
		state = context.getString("state","0");
		type = context.getString("type","");
		
		Chain chain = Chain.make("title", title);
		chain.add("type", type).add("state",context.getString("state", "0"));
		chain.add("content", content);
		chain.add("in_date", new Date(System.currentTimeMillis()));
		
		try {
			Cnd cnd=Cnd.where("news_id", "=", news_id);
			dao.update("ti_wechat", chain , cnd );
			
		} catch (Exception e) {
			return -1;
		}
		return 0;
	}
}	