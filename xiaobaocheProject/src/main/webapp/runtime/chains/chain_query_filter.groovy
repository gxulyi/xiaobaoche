import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.dworker.lang.ILogs;
import com.xwqp88.mvc.IMvcs;

class query_filter extends IGroovyChain {

	public IChainOut out(final IChainContext context) {
		def map = IMvcs.reqMap();
		nextChain(null);
		
		if (map != null) {
			String query = context.getString("query");
			def params = new HashMap<?, ?>();
			map.each {
				params.put(it.key, it.value);
			}
			context.set("params", params);
			nextChain("chain_query");
		}
		return super.out(context);
	}
}