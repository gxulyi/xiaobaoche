package com.dworker.xwwechat.chain;

import org.nutz.dao.Dao;

import com.dworker.web.chain.TransChain;
import com.xwqp88.dao.IDaos;
import com.dworker.xwwechat.IConsNews;

public class NewsTransChain extends TransChain implements IConsNews {
	protected Dao transDao = IDaos.getDao(XW_DF_DS);
}
