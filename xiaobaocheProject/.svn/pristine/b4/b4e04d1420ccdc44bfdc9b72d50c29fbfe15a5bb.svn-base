package com.dworker.xwwechat.datas;

import com.dworker.datas.aware.IDataSource;
import com.dworker.gvy.lang.Gvms;
import com.dworker.xwwechat.IConsNews;

public abstract class NewsDataSource implements IDataSource, IConsNews{
	public <T> T get(Object params) {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> T shellFetch(String name, Object params){
		return Gvms.run(FETCH_SHELL_SCRIPT, name, params);
	}

	public <T> T shellCachedFetch(String name, Object params){
		return Gvms.runCached(FETCH_SHELL_SCRIPT, name, params);
	}
}
