package org.nlpchina.web.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@Ok("json")
	@AdaptBy(type = UploadAdaptor.class, args = { "${app.root}/WEB-INF/tmp" })
	public Map<String, String> resourceUploader(@Param("file") TempFile[] file) {
		UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute("userInfo");
		Map<String, String> result = new HashMap<String, String>();
		
		if (userInfo == null || userInfo.getUserType() < 1) {
			throw new RuntimeException("Not enough permissions");
		}

		long timeValue = System.currentTimeMillis();
		for (TempFile tempFile : file) {
			try {
				String filname=tempFile.getMeta().getFileLocalName();
				writeFile(tempFile, "webapp/upload/" + userInfo.getId() + "/", (timeValue + 1) + "_" + filname);
				result.put("filelist", "http://www.nlpcn.org/"+"download/" + userInfo.getId() + "/"+(timeValue + 1) + "_" + filname+"/");
			} catch (IOException e) {
				throw new RuntimeException("update error!");
			}
		}
		
		return result;
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
	
	@At("/download/?/?/")
	public void download(String userId,String filename, String suffix,HttpServletRequest request, HttpServletResponse response) throws Exception{
		File file = new File("webapp\\upload\\"+userId+"\\"+filename);//
	    InputStream fis = new BufferedInputStream(new FileInputStream(file));
	    byte[] buffer = new byte[fis.available()];
	    fis.read(buffer);
	    fis.close();
	    response.reset();
	    // 先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
	    response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.replaceAll(" ", "").getBytes("utf-8"),"iso8859-1"));
	    response.addHeader("Content-Length", "" + file.length());
	    OutputStream os = new BufferedOutputStream(response.getOutputStream());
	    response.setContentType("application/octet-stream");
	    os.write(buffer);// 输出文件
	    os.flush();
	    os.close();
	}
	
}
