import com.xwqp88.shop.core.chain.ShopTransChain;
import com.xwqp88.shop.util.IShops;

class chain_update_user extends ShopTransChain{
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		/**
		 * 更新当前登录用户的信息
		 */
		mergeWith("chain_upload_image");
		nextChain("chain_update_member");
	}

}