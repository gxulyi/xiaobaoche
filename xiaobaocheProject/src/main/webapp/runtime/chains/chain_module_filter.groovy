import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.dworker.lang.ILogs;
import com.xwqp88.mvc.IMvcs;

class module_filter extends IGroovyChain {

	public IChainOut out(final IChainContext context) {
		nextChain(null);
		def map = context.getMap();
		if(map.api == "companies"){
			map.api = "service_data_company";
		} else if(map.api == "adv"){
			map.api = "service_adv";
		}
		context.set("result", map.api);
		return super.out(context);
	}
}