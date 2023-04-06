package com.dworker.xwwechat.service;

import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.Strings;
import org.nutz.lang.util.Context;

import com.dworker.xwwechat.IService;
import com.xwqp88.dao.IDaos;

/**
 * 
 * @author 梁毅
 * @time 2015-11-18
 * @decription 新闻资讯发布状态修改的逻辑接口实现
 * @name service_public_news.groovy
 *
 */
public class IPublicNewsService implements IService<Integer> {
	Dao dao = null;
	String ids, state;

	public Integer service(Context context) {

		dao = IDaos.getDao("dataSource");
		ids = context.getString("ids", "");

		if (!Strings.isBlank("ids")) {
			try {
				Cnd cnd = Cnd.where("news_id", "in", ids.split(","));
				Chain chain = Chain.make("news_id", ids);
				chain.add("state", context.getString("state", "0"));
				dao.update("ti_wechat", chain, cnd);

			} catch (Exception e) {
				return -1;
			}
		}
		return 0;
	}

}
