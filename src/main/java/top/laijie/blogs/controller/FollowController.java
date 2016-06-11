package top.laijie.blogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.FollowService;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.UserUtils;

@Controller  
@RequestMapping("/follow") 
public class FollowController {
	private static Logger logger = Logger.getLogger(UserController.class.getName());
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/create")
	@ResponseBody
	public void createFollow(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		response.setCharacterEncoding("utf-8");
		String aid = request.getParameter("authorId");
		 String email = UserUtils.getCurrentLoginName();
		 PrintWriter writer = null;
		try {
			writer = response.getWriter();
			 if(email.equals("anonymousUser")){
				 	writer.write("{\"status\":\"请先登陆，登陆后即可关注~~~\"}");
			 	 }else{
			 		 
			 		User user = userService.getUserByEmail(email);
			 		Follow fo = new Follow();
					fo.setCreateDate(new Date());
					fo.setStatus(1);
					fo.setFollowerUid(user.get_id());
					ObjectId authorUid = new ObjectId(aid);
					fo.setAuthorUid(authorUid);
					followService.createFollow(fo);
					writer.write("{\"status\":\"success\"}");
			 	 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			writer.close();
		}

	}
	
	@RequestMapping("/list")
	public String listFollow(Model model){
		Follow fo = new Follow();
		
		Query query = new Query();
		Page<Follow> page = followService.listFollow(1, query);
		//model.addAttribute("page", page);
		return "/back/categorie_list.jsp";
	}	
}
