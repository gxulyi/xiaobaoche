package com.dworker.xwwechat.mvc.view;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.view.RawView;

import com.dworker.datas.IDatas;
import com.dworker.gvy.lang.Gvms;
import com.dworker.xwwechat.IConsNews;

public class AttachImageView extends RawView {
	protected String attatchRootId;
	protected String module;
	protected Object attachData;
	protected Object attachDefault;
	protected IDatas datas = null;
	
	public static AttachImageView attach(){
		return new AttachImageView("image/jpeg");
	}
	
	public static AttachImageView attach(String root){
		return new AttachImageView("image/jpeg").setAttatchRootId(root);
	}

	public AttachImageView(String contentType) {
		super(contentType);
		// TODO Auto-generated constructor stub
	}

	protected void prepare() {
		if (!Strings.isBlank(attatchRootId)) {
			datas = IDatas.NEW("data_attach");
			Map<String, Object> attach = Gvms.runCached(
					IConsNews.FETCH_SHELL_SCRIPT, "data_attach", NutMap.NEW().setv("attach_root_id", attatchRootId));
			if (attach != null) {
				String filePath = (String) attach.get("file_path");
				if (!Strings.isBlank(filePath)) {
					File file = new File(Mvcs.getNutConfig().getAppRoot(),
							filePath);
					attachData = file.exists() ? file : null;
				}
			}
		}
	}

	@Override
	public void render(HttpServletRequest req, HttpServletResponse resp,
			Object obj) throws Throwable {
		if (Strings.isBlank(attatchRootId)) {
			attatchRootId = obj != null ? String.valueOf(obj) : null;
		}
		prepare();
		attachData = attachData == null ? attachDefault : attachData;
		if (attachData != null) {
			super.render(req, resp, attachData);
		}
	}

	public AttachImageView setDefault(String d) {
		if (!Strings.isBlank(d)) {
			File file = new File(Mvcs.getNutConfig().getAppRoot(), d);
			attachDefault = file.exists() && file.isFile() ? file : null;
		}
		return this;
	}

	public AttachImageView setAttatchRootId(String attatchRootId) {
		this.attatchRootId = attatchRootId;
		return this;
	}
}
