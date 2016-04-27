package top.laijie.blogs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.GenerateUtil;
import top.laijie.blogs.tool.PropUtils;
import top.laijie.blogs.tool.UploadUtils;
import top.laijie.blogs.tool.UserUtils;
import top.laijie.blogs.tool.constant.Configuration;

@Controller  
@RequestMapping("/uploadFileController") 
public class UploadFileController {
	private static Logger logger = Logger.getLogger(UploadFileController.class.getName());     
    @Autowired  
    UserServiceImpl userService;
    
    @RequestMapping(value="ajaxupload.do")
    public void ajaxUploadFile(HttpServletRequest request,HttpServletResponse response){
    	response.setContentType("text/html");
    	String loginName = UserUtils.getCurrentLoginName();
    	String filename = "";
     	User user = userService.getUserByEmail(loginName);
     	String tempPath = UploadUtils.genPath(Configuration.STATIC_ALBUM);
		String filePath = PropUtils.readPropertiesFile("upload.properties","uploadurl");
		if(!(filePath.endsWith("/") || filePath.endsWith("\\")) ){
			filePath += "/";
		}
		filePath +=tempPath;
		Path path = Paths.get(filePath);
		//创建文件夹   
         if(Files.notExists(path)){  
             try {
				Files.createDirectories(path);
			} catch (IOException e) {
				logger.error(e);
			}  
         }
        //消息提示
        String message = "";
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
             //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8"); 
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                return;
            }
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                    String name = item.getName();
                    String value = item.getString("UTF-8");
                    String suffix = "";
	               	 if(StringUtils.isNotBlank(name)&&name.contains(".")){
	               		 suffix = name.substring(name.lastIndexOf("."));
	               	 }
	               	/* if((!suffix.toUpperCase().equals((".JPEG")))&&(!suffix.toUpperCase().equals((".GIF")))&&(!suffix.toUpperCase().equals((".JPG")))&&(!suffix.toUpperCase().equals((".PNG")))
	               			 &&(!suffix.toUpperCase().equals((".BMP")))){
	               		return resp.putStatus(YzmmResultStatus.IMAGE_VALID_FORMAT);
	               	 }*/
	               	 String timestamp=String.valueOf(System.currentTimeMillis());
	            	 filename = timestamp.concat(GenerateUtil.getRandomStr(4)).concat(suffix);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(filePath + File.separator + filename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer, 0, len);
                    }
                    user.setAlbum(tempPath+filename);
                    userService.save(user);
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                    message = "文件上传成功！";
                }
            
        }catch (Exception e) {
            message= "文件上传失败！";
            logger.error(e);
        }
        request.setAttribute("message",message);
	try {
		PrintWriter writer = response.getWriter();
		writer.print(true);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    }
}
