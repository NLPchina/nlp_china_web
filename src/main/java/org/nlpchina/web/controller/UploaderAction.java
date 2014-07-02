package org.nlpchina.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.nlpchina.web.domain.UserInfo;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.upload.TempFile;
import org.nutz.mvc.upload.UploadAdaptor;

@IocBean
public class UploaderAction {

	@At("/admin/resource/uploader")
	@Ok("raw")
	@AdaptBy(type = UploadAdaptor.class, args = { "${app.root}/WEB-INF/tmp" })
	public void resourceUploader(@Param("file") TempFile[] file) {
		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		if (userInfo == null || userInfo.getUserType() < 1) {
			throw new RuntimeException("Not enough permissions");
		}

		long timeValue = System.currentTimeMillis();
		for (TempFile tempFile : file) {
			try {
				writeFile(tempFile, "webapp/upload/" + userInfo.getId() + "/", (timeValue + 1) + "_" + tempFile.getMeta().getFileLocalName());
			} catch (IOException e) {
				throw new RuntimeException("update error!");
			}
		}
	}

	/**
	 * 文件写入
	 * 
	 * @param tempFile
	 * @param string
	 * @throws IOException
	 */
	private void writeFile(TempFile tempFile, String path, String fileName) throws IOException {
		byte[] bytes = new byte[10240];
		FileInputStream fis = new FileInputStream(tempFile.getFile());

		File dir = new File(path);
		dir.mkdirs();
		File out = new File(dir, fileName);
		FileOutputStream fos = new FileOutputStream(out);
		try {
			int len = 0;
			while ((len = fis.read(bytes)) != -1) {
				fos.write(bytes, 0, len);
			}
		} finally {
			if (fos != null) {
				fos.flush();
				fos.close();
			}
			if (fis != null) {
				fis.close();
			}
		}

	}
}
