import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.nutz.mvc.Mvcs;

import com.dworker.fs.IUploads;
import com.dworker.fs.IUploads.UploadRunner;
import com.dworker.lang.ILogs;
import com.dworker.web.chain.observer.ITransObserver;
import com.xwqp88.mvc.IMvcs;
import com.xwqp88.mvc.view.IViews;
import com.dworker.web.services.BaseService

class service_update extends BaseService implements UploadRunner{
	String url = "", code = "";
	@Override
	protected void init() {
		// TODO Auto-generated method stub
		super.init();
		IUploads.it().parse().on(this);
		data = ["error": code == null? 0: Integer.parseInt(code), "url": url];
		orginalView = json();
	}

	public void run(IUploads upload, List<FileItem> fields,
			List<FileItem> files){
		ILogs.d("开始解析上传文件");
		ILogs.df("解析文件个数：%d，字段个数：%d", files == null? 0: files.size(), fields == null? 0: fields.size());
		String itId = "";
		files.each {
			if (it.getSize() > 0) {
				itId = UUID.randomUUID().toString();
				url = "/data/upload/random/" + itId + upload.getSuffix(it);
				String path = Mvcs.getNutConfig().getAppRoot() + url;
				try {
					upload.safeWrite(it, new File(path));
					code = "0";
				} catch (Exception e) {
					e.printStackTrace();
					code = "-1";
				}
			}
		}
	}
}