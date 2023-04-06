import com.dworker.web.chain.observer.ITransObserver;
import com.xwqp88.mvc.IMvcs;
import com.xwqp88.mvc.view.IViews;
import com.dworker.web.services.BaseService;

class service_upload extends BaseService{
	@Override
	protected void init() {
		// TODO Auto-generated method stub
		super.init();
		new ITransObserver().observer("chain_upload_image", true);
		orginalView = json();
	}
}