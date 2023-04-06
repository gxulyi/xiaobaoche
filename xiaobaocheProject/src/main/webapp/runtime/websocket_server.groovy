import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;

import com.dworker.chains.IChains;
import com.dworker.chains.core.IChainContext;
import com.dworker.gvy.lang.GvmLoaders;
import com.dworker.lang.ILogs;
import com.dworker.web.websocket.Server;
import com.dworker.web.websocket.ServerProxy;
import com.dworker.web.websocket.WsContext;
import com.dworker.web.websocket.WsHelper;
import com.dworker.web.websocket.ant.WsMsg;

class websocket_server extends ServerProxy {
	@Override
	public void onOpen(WebSocket conn, ClientHandshake handshake) {
	}

	@Override
	public void onClose(WebSocket conn, int code, String reason, boolean remote) {
		/*WsHelper.config().wsLocalContext.get().setSocket(null);
		 ILogs.d(conn);
		 conn.close();
		 WsContext context = WsHelper.get(conn);
		 context.setSocket(conn);*/
	}

	@Override
	public void onMessage(WebSocket conn, String message) {
		Server.compileStatic = true;
		IChainContext context = IChains.NEW().run(GvmLoaders.it().as("chain_ws_onmessage"));
		Object obj = context.get("result");
		WsContext ctx = WsHelper.get(conn);
		if (obj == null) {
			obj = WsHelper.msg();
		} else {
			if (obj instanceof WsMsg) {
				obj.setSessionId(ctx.getSessionId());
			}
		}
		String t = Json.toJson(obj, JsonFormat.compact());
		conn.send(t);
	}

	@Override
	public void onError(WebSocket conn, Exception ex) {
		ex.printStackTrace();
	}
}