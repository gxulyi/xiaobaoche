import java.lang.Thread.UncaughtExceptionHandler;

import org.nutz.json.Json;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.dworker.chains.IChains;
import com.dworker.datas.IDatas;
import com.dworker.factory.IFactorys;
import com.dworker.gvy.lang.GvmLoaders;
import com.dworker.gvy.lang.GvmLog;
import com.dworker.gvy.lang.Gvms;
import com.dworker.lang.ILogs;
import com.dworker.web.websocket.Server;

class setup implements Setup {

	public void init(NutConfig nc) {
		IChains.ENABLE_GVM_LOAD = true;
		GvmLog.GVM_DEBUG_ENABLE = false;
		System.setProperty("file.encoding", "UTF-8");
		Gvms.it().addClasPath(nc.getAppRoot() + "/runtime/chains/*");
		Gvms.it().addClasPath(nc.getAppRoot() + "/runtime/datas/*");
		Gvms.it().addClasPath(nc.getAppRoot() + "/runtime/lang/*");
		Gvms.it().addClasPath(nc.getAppRoot() + "/runtime/factory/*");
	}

	public void destroy(NutConfig nc) {
		
	}
}