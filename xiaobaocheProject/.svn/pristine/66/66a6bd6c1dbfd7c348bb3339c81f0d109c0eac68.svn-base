import org.nutz.mvc.View;
import org.nutz.mvc.view.UTF8JsonView;

import com.dworker.auth.IAuthException;
import com.dworker.auth.IAuthInvalidResolve;
import com.dworker.factory.IFactory;
import com.xwqp88.shop.core.services.BaseService;

class auth_resolve_factory implements IFactory<IAuthInvalidResolve> {
	public IAuthInvalidResolve make(Object params) {
		
		return new IAuthInvalidResolve(){
	         public <T> T resolve(final IAuthException exception) {
				 String s = exception.code + " " + exception.getMessage();
				 
				 BaseService service = new BaseService(){
					 public View service() {
						 if (exception.code == 11) {
							 orginalView = UTF8JsonView.COMPACT;
							 data = ["auth": "213"];
						}
						 return super.service();
					 }
				 };
				 
				 return service;
			 }
		};
	}
}
