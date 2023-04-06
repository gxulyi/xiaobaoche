import com.dworker.datas.IDatas;
import com.xwqp88.shop.util.IShops;

def fetchDatas = {
	dataSource, params ->
	def record;
	IDatas datas = IDatas.NEW().setDataSource(dataSource);
	def rec = datas.makeData(params);
	if(rec.total > 0){
		record = rec.rows.get(0);
	}
	record;
}