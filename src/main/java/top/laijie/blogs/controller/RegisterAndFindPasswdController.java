package top.laijie.blogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;  
import java.util.logging.Logger;
  
import javax.annotation.Resource;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.springframework.stereotype.Controller;  
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;  

import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.MD5Util;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.ServiceException;
  
  
@Controller  
@RequestMapping("/user")
public class RegisterAndFindPasswdController {  
	private static Logger logger = Logger.getLogger(RegisterAndFindPasswdController.class.getName());    
    @Resource  
    private UserServiceImpl service;  
      
    @RequestMapping(value="/register",method={RequestMethod.GET,RequestMethod.POST})  
    public ModelAndView  register(HttpServletRequest request,HttpServletResponse response,User user) throws ParseException{  
        String action = request.getParameter("action");  
        System.out.println("-----r----"+action);  
        ModelAndView mav=new ModelAndView();  
  
        if("register".equals(action)) {  
            //注册  
            String email = request.getParameter("email");  
            service.processregister(user);//发邮箱激活  
            mav.addObject("text","注册成功");
            //拼接邮件服务器地址
            String url[] = user.getEmail().split("@");
           StringBuffer burl =new StringBuffer();
           burl.append("http://mail.").append(url[1]);
            mav.addObject("mailurl",burl );
            mav.setViewName("register/register_success.jsp");  
        }   
        else if("activate".equals(action)) {  
            //激活  
            String email = request.getParameter("email");//获取email  
            String validateCode = request.getParameter("validateCode");//激活码  
              
            try {  
                service.processActivate(email , validateCode);//调用激活方法  
                User user1 = service.getUserByEmail(email);
                request.setAttribute("user" ,user1);
                mav.setViewName("register/prefect_info.jsp");  
            } catch (ServiceException e) {  
                request.setAttribute("message" , e.getMessage());  
                mav.setViewName("register/activate_failure.jsp");  
            }  
              
        }  
        return mav;  
    }  
     // 验证邮箱
    @RequestMapping(value="/register/checkemail.do",method={RequestMethod.GET,RequestMethod.POST})  
    public void  checkemail(HttpServletRequest request,HttpServletResponse response){  
    	User user = null;
    	String email = request.getParameter("email");
    	//System.out.println("---"+email);
    	user = service.getUserByEmail(email);
    	PrintWriter writer = null;
		try {
			writer = response.getWriter();
			if(user!=null){
				writer.write("{\"status\":\"failure\"}");
	    	}else{
	    		writer.write("{\"status\":\"success\"}");
	    		
	    	}
			
		} catch (IOException e) {
			writer.write("{\"status\":\"success\"}");
		}
    }
    //验证邮件地址/register/checkblogaddress
    @RequestMapping(value="/register/checkblogaddress.do",method={RequestMethod.GET,RequestMethod.POST})  
    public void  checkblogaddress(HttpServletRequest request,HttpServletResponse response){  
    	User user = null;
    	String blogaddress = request.getParameter("blogaddress");
    	//System.out.println("---"+email);
    	user = service.getUserByblogaddress(blogaddress);
    	PrintWriter writer = null;
		try {
			writer = response.getWriter();
			if(user!=null){
				writer.write("{\"status\":\"failure\"}");
	    	}else{
	    		writer.write("{\"status\":\"success\"}");
	    		
	    	}
			
		} catch (IOException e) {
			writer.write("{\"status\":\"success\"}");
		}
    }
    //
    @RequestMapping("/tofindPasswdByEmail.do")
    public String tofindPasswdByEmail(ModelMap map,HttpServletRequest request,HttpServletResponse response){  
    	logger.info("---");
    	User user = null;
    	String backemail = request.getParameter("backemail");
    	user = service.getUserByEmail(backemail);
    	if(user!=null){
    		service.processFindPassword(user);//发邮箱激活
    		String url[] = user.getEmail().split("@");
            StringBuffer burl =new StringBuffer();
            burl.append("http://mail.").append(url[1]);
            map.addAttribute("mailurl",burl );
        return "register/tofindpasswd_page.jsp";
    	}else{
    		map.addAttribute("message", "该邮件未注册请登陆或注册");
    		 return "register/activate_failure.jsp";
    	}
    }  
    
    @RequestMapping("/findPasswdByEmail.do")
    public String findPasswdByEmail(ModelMap map,HttpServletRequest request,HttpServletResponse response){  
    	User user = null;
    	String email = request.getParameter("email");
    	String validateCode = request.getParameter("validateCode");//激活码  
    	user = service.getUserByEmailAndValidate(email,validateCode);
    	if(user==null){
    		map.addAttribute("message", "404----该链接失效,请重新操作!");
   		 	return "register/activate_failure.jsp";
    	}else{
    		logger.info(user.toString());
    		map.addAttribute("user", user);
      		return "register/findpasswd_page.jsp";
    	}
    }
    @RequestMapping("/savePasswd.do")
    public String savePasswd(ModelMap map,HttpServletRequest request,HttpServletResponse response){  
    	User user = null;
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	logger.info("---");
    	user = service.getUserByEmail(email);
    	if(user==null){
    		map.addAttribute("message", "404----该链接失效,请重新操作!");
   		 	return "register/activate_failure.jsp";
    	}else{
    		logger.info(user.toString());
    		user.setPassword(MD5Util.encode2hex(password));
    		service.save(user);
    		map.addAttribute("message", "密码修改成功,请登陆");
      		return "register/activate_success.jsp";
    	}
    }
}  