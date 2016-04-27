package top.laijie.blogs.tool;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

import top.laijie.blogs.tool.constant.Configuration;


public class UploadUtils {
	
	public static void delete(String url){
		if(StringUtils.isBlank(url)){
			return ;
		}
		String http = Configuration.STATIC_RESOURSE_HTTP_URL;
		String filePath = null;
		if(url.startsWith(http)){
			filePath = url.replaceFirst(http, Configuration.STATIC_RESOURSE_DISK_PATH);
		}
		if(StringUtils.isBlank(filePath)){
			return;
		}
		Path p = Paths.get(filePath);
		try {
			Files.deleteIfExists(p);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * SystemVar.STATIC_HOST_PATH+SystemVar.STATIC_UPLOAD_FILE+[parent]+filePath
	 * @param url
	 * @param parentFile
	 * @return
	 */
	public static String tempToUpload(String url,String... parent){
		StringBuffer parentFile = new StringBuffer(Configuration.STATIC_UPLOAD_FILE);
		if(StringUtils.isBlank(url)){
			return null;
		}
		if(null!=parent && parent.length >0){
			for (String str : parent) {
				parentFile.append("/").append(str);
			}
		}
		String http = Configuration.STATIC_RESOURSE_HTTP_URL.concat("/").concat(Configuration.STATIC_TEMP_FILE);
		String filePath = null;
		if(url.startsWith(http)){
			filePath = url.replaceFirst(http, "");
		}
		if(null==filePath){
			return url;
		}
		Path p = Paths.get(Configuration.STATIC_RESOURSE_DISK_PATH+Configuration.STATIC_TEMP_FILE+filePath);
		if(Files.notExists(p)){
			return url;
		}
		Path up = Paths.get(Configuration.STATIC_RESOURSE_DISK_PATH+parentFile.toString()+filePath);
		if(Files.notExists(up.getParent())){
			try {
				Files.createDirectories(up.getParent());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			Files.move(p,up,StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Configuration.STATIC_RESOURSE_HTTP_URL.concat("/").concat(parentFile.toString()).concat(filePath);
	}
	
	/**
	 * 磁盘相对目录
	 * @param pid
	 * @return
	 */
	public static String genTempPath(String id,String parentDir){
		StringBuilder pidSb = new StringBuilder(13);
		if(null!=id){
			if(StringUtils.isNumeric(id)){
				pidSb.append(StringUtils.leftPad(id.toString(), 9,"0"));
				pidSb.insert(7, File.separatorChar).insert(5, File.separatorChar).insert(3, File.separatorChar);
			}else{
				pidSb.append(id);
			}
			pidSb.append(File.separator);
		}
		//
		Date date=new Date(); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMM"+File.separator+"dd"+File.separator);
		String dateStr= sdf.format(date);
		//
		StringBuilder sb=new StringBuilder(30);
		sb.append(parentDir);
		sb.append(File.separator);
		sb.append(dateStr);
		sb.append(pidSb.toString());
		return sb.toString();
	}
	
	/**
	 * 磁盘相对目录
	 * @param pid
	 * @return
	 */
	public static String genPath(String parentDir){
		StringBuilder pidSb = new StringBuilder(13);
		Date date=new Date(); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMM"+File.separator+"dd"+File.separator);
		String dateStr= sdf.format(date);
		//
		StringBuilder sb=new StringBuilder(30);
		sb.append(File.separator);
		sb.append(parentDir);
		sb.append(File.separator);
		sb.append(dateStr);
		sb.append(pidSb.toString());
		return sb.toString();
	}
	/**
	 * 头像磁盘相对目录
	 * @param pid
	 * @return
	 */
	public static String genPhotoPath(Long id,String parentDir){
		StringBuilder pidSb = new StringBuilder(13);
		pidSb.append(StringUtils.leftPad(id.toString(), 9,"0"));
		pidSb.insert(7, File.separatorChar).insert(5, File.separatorChar).insert(3, File.separatorChar);
		//
//		Date date=new Date(); 
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMM"+File.separator+"dd"+File.separator);
//		String dateStr= sdf.format(date);
		//
		StringBuilder sb=new StringBuilder(30);
		sb.append(parentDir);
		sb.append(File.separator);
//		sb.append(dateStr);
		sb.append(pidSb.toString());
		sb.append(File.separator);
		//System.out.println(pidSb.length()+"~"+sb.length());//长度测算 
		return sb.toString();
	}
	
}
