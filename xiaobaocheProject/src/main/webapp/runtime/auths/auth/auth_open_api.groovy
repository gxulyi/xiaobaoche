import com.dworker.auth.BaseAuth;
import com.dworker.auth.BaseAuthAction;
import com.dworker.auth.IAuthException;
import com.dworker.auth.IAuths;

def authmaker = {
	params ->
	def auth = new BaseAuth(){
		
		public <T> T excute(BaseAuthAction action) throws IAuthException {
			
			if ("check" == action.getAction()) {
				String module = action.getContext().getString("module", "undefined");
				return "services" == module || "datas" == module;
			}
			return false;
		}
		
		public boolean contains(String name) {
			return "auth_open_api" == name;
		}
	};
	
	return auth;
}