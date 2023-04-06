import com.dworker.auth.BaseAuth;
import com.dworker.auth.BaseAuthAction;
import com.dworker.auth.IAuthException;
import com.dworker.auth.IAuths;

def authmaker = {
	params ->
	def auth = new BaseAuth(){
		public <T> T excute(BaseAuthAction action) throws IAuthException {
			checkAction(action);
			return ["name": "123"];
		}
	};
	
	auth;
}