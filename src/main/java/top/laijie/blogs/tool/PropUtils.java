package top.laijie.blogs.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

import top.laijie.blogs.controller.IndexPageController;

public class PropUtils {
	private static Logger logger = Logger.getLogger(IndexPageController.class.getName());
	//读取properties文件
	 public static String readPropertiesFile(String filename,String attr)  
	    {  
	        Properties properties = new Properties();  
	        try  
	        {  
	            InputStream inputStream = PropUtils.class.getClassLoader().getResourceAsStream(filename);

	            properties.load(inputStream);  
	            inputStream.close(); //关闭流  
	        }  
	        catch (IOException e)  
	        {  
	        	 
	        	logger.error(e, e); 
	        }  
	        return properties.getProperty(attr);  
	    }  
	 
	 public static void writePropertiesFile(String filePath, String key, String value) {  
	        //获取绝对路径  
	        filePath = PropUtils.class.getResource("/" + filePath).toString();  
	        //截掉路径的”file:/“前缀  
	        filePath = filePath.substring(6);  
	        Properties prop = new Properties();  
	        try {  
	            File file = new File(filePath);  
	            if (!file.exists())  
	                file.createNewFile();  
	            InputStream fis = new FileInputStream(file);  
	            prop.load(fis);  
	            //一定要在修改值之前关闭fis  
	            fis.close();  
	            OutputStream fos = new FileOutputStream(filePath);  
	            prop.setProperty(key, value);  
	            //保存，并加入注释  
	           prop.store(fos, "Update '" + key + "' value");  
	            fos.close();  
	        } catch (IOException e) {  
	           logger.error(e,e); 
	        }  
	    }  
}

