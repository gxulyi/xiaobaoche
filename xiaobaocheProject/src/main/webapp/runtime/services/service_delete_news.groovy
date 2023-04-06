import org.nutz.lang.util.Context
import org.nutz.lang.util.SimpleContext

import com.dworker.web.services.BaseService
import com.dworker.xwwechat.IService
import com.dworker.xwwechat.service.IDeleteNewsService
import com.xwqp88.mvc.IMvcs


class service_delete_news extends BaseService{
	def id, msg;
	@Override
	protected void init() {
		// TODO Auto-generated method stub
		super.init();
		def params = IMvcs.reqMap()
		id = params.ids
		IService service = new IDeleteNewsService();
		Context ctx = new SimpleContext();
		ctx.putAll(params);
		int rec = service.service(ctx);
		if (rec == -1) {
			msg = "删除失败！";
		}
		data = ["id": id, "errorMsg": msg];
		orginalView = json();
	}
}