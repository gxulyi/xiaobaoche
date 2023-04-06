import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.dworker.lang.ILogs;
import com.xwqp88.mvc.IMvcs;

class chain_query extends IGroovyChain {

	public IChainOut out(final IChainContext context) {
		def map = IMvcs.reqMap();
		nextChain(null);
		context.set("result", IDatas.NEW(context.getString("query")).makeData(context.get("params")));
		return super.out(context);
	}
}