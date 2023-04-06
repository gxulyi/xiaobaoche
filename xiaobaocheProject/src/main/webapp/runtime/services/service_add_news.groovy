import org.nutz.lang.Strings;
import org.nutz.lang.util.Context
import org.nutz.lang.util.SimpleContext

import com.dworker.web.services.BaseService
import com.dworker.xwwechat.IService
import com.dworker.xwwechat.service.IAddNewsService
import com.xwqp88.mvc.IMvcs
import com.xwqp88.util.NumberUtil

class service_add_news extends BaseService {
	def id, msg;
	@Override
	protected void init() {
		// TODO Auto-generated method stub
		super.init();
		def params = IMvcs.reqMap();
		println params;
		 id = params.ids;
		if(Strings.isBlank(id)){
			id = NumberUtil.randomChar(15);
		}
		IService service = new IAddNewsService();
		Context ctx = new SimpleContext();
		params.put("ids", id);
		ctx.putAll(params);
		int rec = service.service(ctx);
		if (rec == -1) {
			msg = "增加失败！";
		}	
		println "增加接口"+id;
		data = ["id": id, "errorMsg": msg];
		orginalView = json();
	}
}