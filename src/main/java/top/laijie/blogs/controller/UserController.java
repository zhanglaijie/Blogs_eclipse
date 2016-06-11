package top.laijie.blogs.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.bson.json.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.domain.dto.FollowDto;
import top.laijie.blogs.service.FollowService;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.StaticProperties;
import top.laijie.blogs.tool.UserUtils;

@Controller  
@RequestMapping("/userController") 
public class UserController {  
	private static Logger logger = Logger.getLogger(UserController.class.getName());     
    @Autowired  
    UserService userService;   
    
    @Autowired
    FollowService followService;
    /** 
     * 指向登录页面 
     */  
    @RequestMapping(value = "/login.do")  
    public String getLoginPage( @RequestParam(value = "error" , required = false) boolean error,  
            ModelMap model) {  
	  
	        logger.info("Received request to show login page");  
  
        if (error == true) {  
            // Assign an error message  
            model.put("error",  
                    "登陆失败");  //未验证或密码错误
        } else {  
            model.put("error", "");  
        }  
        return "/login.jsp";  
  
    }  
    /**
     * 管理页面
     * @return
     */
    @RequestMapping("/admin")
    public String admin(){  
    	System.out.println("---");
    //	Page<User> page =  userService.getPage(1,5,new User());
    //	System.out.println(page.getDatas().size());
        return "/front/laijie.jsp";
    }     
    @RequestMapping("/save")  
    public String saveUser(User user){  
           
    	userService.saveOne(user); 
           
        logger.info("save:"+user);   
        return "/back/index.jsp";
    }  
    @RequestMapping("/backIndex.do")  
    public String back(User user){  
         
        return "/back/index.jsp";
    }  
    /**
     * 指向个人信息明细   
     * @param user
     * @return
     */
    @RequestMapping("/find")  
    public String findUser(User user){  
           
        user = userService.findUserByName(user.getNicename());  
       ((UserServiceImpl) userService).test();
        logger.info("find:"+user);  
           
        return "/back/index.jsp";
    }    
    @RequestMapping("/update")  
    public String updateUser(User user){  
           
           
        userService.updateUserByEmail(user.getEmail());  
        
        logger.info("find:"+user);  
        return "/back/index.jsp";  
    }  
    @RequestMapping("/qingru")  
    public void qiru(User user,HttpServletRequest request,HttpServletResponse response) throws IOException{  
           
        String a = request.getParameter("id"); 
        logger.info("find:"+a); 
       // userService.updateUserByEmail(user.getEmail());  
        PrintWriter writer = response.getWriter();
        StringBuffer buffer = new StringBuffer();
        //buffer.append())
       writer.write("{\"id\":1}");
    }  
    /** 
     * 跳转到commonpage页面 
     *  
     * @return 
     */  
    @RequestMapping(value = "/common", method = RequestMethod.GET)  
    public String getCommonPage() {  
        logger.info("Received request to show common page");  
        logger.info(UserUtils.getCurrentLoginName());
        return "/authority/commonpage.jsp";  
    }  
  
    /** 
     * 跳转到adminpage页面 
     *  
     * @return 
     */  
    @RequestMapping(value = "/admin", method = RequestMethod.GET)  
    public String getAadminPage() {  
        logger.info("Received request to show admin page");  
        return "/authority/adminpage.jsp";  
  
    }  

    /** 
     * 指定无访问额权限页面 
     *  
     * @return 
     */  
    @RequestMapping(value = "/denied", method = RequestMethod.GET)  
    public String getDeniedPage(ModelMap map) {  
    	map.put("message", "您没有权限访问该页面，请重新登陆~~~");
    	return "/error/error_page.jsp";
    }  
    /**
     * About_me
     */
    @RequestMapping("/about_me.do")
    public String about_me(ModelMap map){
    	String email = UserUtils.getCurrentLoginName();
    	User user = userService.getUserByEmail(email);
    	if(StringUtils.isBlank(user.getAlbum())){
    		user.setAlbum(StaticProperties.DEFAULT_ALBUM);
    	}
    	map.addAttribute("user",user);
		return "/author/me/aboutme.jsp";
    }
    /**
     * 完善资料
     * @return 
     */
    @RequestMapping("/prefect_info.do")
    public String prefect_info(HttpServletRequest request,ModelMap map){
    	String email = request.getParameter("email");
    	String nicename = request.getParameter("nicename");
    	String username = request.getParameter("username");
    	String blogsubname = request.getParameter("blogsubname");
    	User user = userService.getUserByEmail(email);
    	user.setUsername(username);
    	user.setNicename(nicename);
    	user.setBlogsubname(blogsubname);
    	userService.saveOne(user);
    	
    	return "/login.jsp";
    }
    
    @RequestMapping("/account_settings.do")
    public String account_settings(){
    	return "/back/account_Settings.jsp";
    }
    
    @RequestMapping("/modifyInfo.do")
    public String modifyInfo(User user){
    	String loginName = UserUtils.getCurrentLoginName();
    	User user2 = userService.getUserByEmail(loginName);
    	user2.setBlogname(user.getBlogname());
    	user2.setNicename(user.getNicename());
    	user2.setBlogsubname(user.getBlogsubname());
    	user2.setDescription(user.getDescription());
    	userService.saveOne(user2);

    	return "redirect:/userController/about_me.do";
    }
    
    //to博客签名
	 @RequestMapping("/toblogsign")
	 public String toBlogSingn(ModelMap map){
		 String email = UserUtils.getCurrentLoginName();
		 User user = userService.getUserByEmail(email);
		 map.put("sign", user.getDescription());
		 return "author/post/blogsign.jsp";
	 }
	 @RequestMapping("/editblogsign")
	 public String editblogsign(ModelMap map,String description){
		 String email = UserUtils.getCurrentLoginName();
		 User user = userService.getUserByEmail(email);
		 user.setDescription(description);
		 userService.saveOne(user);
		 map.put("sign", user.getDescription());
		 return "author/post/blogsign.jsp";
	 }
	 
	 @RequestMapping("/myfollowed")
	 public String myfollowed(ModelMap map){
		 String email = UserUtils.getCurrentLoginName();
		 User user = userService.getUserByEmail(email);
		 Query query = new Query();
		 query.addCriteria(Criteria.where("followerUid").is(user.get_id()));  
		 Page<Follow> followPage = followService.listFollow(1,1000,query);
		 Page<FollowDto> dtoPage = new Page<>();
		 List<FollowDto> dtolist = new ArrayList<>();
		 for(Follow follow:followPage.getDatas()){
			 FollowDto dto = FollowDto.followtoDto(follow);
			 User user2 = userService.findByOBjId(follow.getAuthorUid());
				dto.setUser(user2);
				dtolist.add(dto);
		 }
		  map.addAttribute("dtolist", dtolist);
		  
		 return "author/me/myfollowed.jsp";
	 }
	 
	 @RequestMapping("/followedme")
	 public String followedme(ModelMap map){
		 String email = UserUtils.getCurrentLoginName();
		 User user = userService.getUserByEmail(email);
		 Query query = new Query();
		 query.addCriteria(Criteria.where("authorUid").is(user.get_id()));  
		 Page<Follow> followPage = followService.listFollow(1,1000,query);
		 List<FollowDto> dtolist = new ArrayList<>();
		 for(Follow follow:followPage.getDatas()){
			 FollowDto dto = FollowDto.followtoDto(follow);
			 User user2 = userService.findByOBjId(follow.getFollowerUid());
				dto.setUser(user2);
				dtolist.add(dto);
		 }
		  map.addAttribute("dtolist", dtolist);
		  
		 return "author/me/myfollowed.jsp";
	 }
}  