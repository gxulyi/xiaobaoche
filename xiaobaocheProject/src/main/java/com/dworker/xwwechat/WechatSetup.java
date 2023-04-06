package com.dworker.xwwechat;

import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.dworker.gvy.lang.GvmLoaders;
import com.dworker.gvy.lang.Gvms;
import com.dworker.lang.ILogs;

public class WechatSetup implements Setup {
	private Setup scriptSetup;

	public void init(NutConfig nc) {
		// TODO Auto-generated method stub
		Gvms.it().addClasPath(nc.getAppRoot() + "/runtime/*");
		Gvms.it().addClasPath(nc.getAppRoot() + "/runtime/auths/*");
		try {
			scriptSetup = GvmLoaders.it().as("setup");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (scriptSetup != null) {
			try {
				scriptSetup.init(nc);
			} catch (Exception e) {
				e.printStackTrace();
				ILogs.d("调用脚本初始化失败！", e);
			}
		}
	}

	public void destroy(NutConfig nc) {

		if (scriptSetup != null) {
			try {
				scriptSetup.destroy(nc);
			} catch (Exception e) {
				e.printStackTrace();
				ILogs.d("调用脚本销毁失败！", e);
			}
		}
	}
}
