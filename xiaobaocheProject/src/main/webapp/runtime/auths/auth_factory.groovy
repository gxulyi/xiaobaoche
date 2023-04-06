import com.dworker.auth.BaseAuth;
import com.dworker.auth.BaseAuthAction;
import com.dworker.auth.IAuth;
import com.dworker.auth.IAuthException;
import com.dworker.auth.IAuths;
import com.dworker.chains.IChains;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.factory.IFactory
import com.dworker.gvy.lang.GvmLoaders;
import com.dworker.gvy.lang.Gvms;

class auth_factory implements IFactory<IAuth> {

	public IAuth make(Object params) {
		if (params != null) {
			if (params instanceof String) {
				return Gvms.run((String)params, null);
			} else if (params instanceof Map) {
				return Gvms.run(params.name, params.params);
			}
		}
		return new BaseAuth(){
					public <T> T excute(BaseAuthAction action) throws IAuthException {
						if (action == null) {
							throw IAuths.c(0);
						}
						return null;
					}
				};
	}
}
