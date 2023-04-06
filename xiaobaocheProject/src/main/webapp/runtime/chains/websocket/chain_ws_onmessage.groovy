import com.dworker.web.websocket.Server;
import com.dworker.web.websocket.WsHelper;
import com.dworker.web.websocket.chain.WsChain;

class chain_ws_onmessage extends WsChain {
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		//Server.compileStatic = false;
		println 12312321312;
		result = WsHelper.otherMsg("123");
	}
}