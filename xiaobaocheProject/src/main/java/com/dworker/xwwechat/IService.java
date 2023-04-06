package com.dworker.xwwechat;

import org.nutz.lang.util.Context;

public interface IService<T> {
	public T service(Context context);
	
}
