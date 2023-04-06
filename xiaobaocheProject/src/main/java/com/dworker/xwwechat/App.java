package com.dworker.xwwechat;

import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.JsonIocProvider;
import org.nutz.mvc.view.HttpStatusView;

import com.dworker.web.filter.FrontFilter;
import com.dworker.web.filter.RequestChainFilter;
import com.dworker.web.filter.RuntimeFilter;
import com.xwqp88.lang.IConsXw;

@Modules(scanPackage = true)
@Encoding(output = IConsXw.XW_DF_ENCODING, input = IConsXw.XW_DF_ENCODING)
@IocBy(type = JsonIocProvider.class, args = { "/conf" })
@SetupBy(WechatSetup.class)
@Filters({ @By(type = RequestChainFilter.class),
		@By(type = RuntimeFilter.class), @By(type = FrontFilter.class) })
public class App {
	@At("/*")
	public View front() {
		return HttpStatusView.HTTP_404;
	}
}
