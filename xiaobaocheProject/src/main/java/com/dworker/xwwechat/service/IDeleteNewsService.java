package com.dworker.xwwechat.service;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.Strings;
import org.nutz.lang.util.Context;

import com.dworker.xwwechat.IService;
import com.xwqp88.dao.IDaos;
/**
 * 
 * @author Lilong
 * @time 2015-11-17
 * @decription 新闻资讯删除的逻辑接口实现
 * @name service_delete_news.groovy
 *
 */
public class IDeleteNewsService implements IService<Integer> {
	Dao dao = null;

	public Integer service(Context context) {
		dao = IDaos.getDao("dataSource");
		String ids = context.getString("ids", "");
		if (!Strings.isBlank(ids)) {
			try {
				return dao.clear("ti_wechat",
						Cnd.where("news_id", "in", ids.split(",")));
			} catch (Exception e) {
				return -1;
			}
		}
		return 0;
	}

}
