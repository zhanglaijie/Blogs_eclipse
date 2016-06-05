package top.laijie.blogs.controller;

import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.FollowService;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.UserUtils;

@Controller  
@RequestMapping("/follow") 
public class FollowController {
	private static Logger logger = Logger.getLogger(UserController.class.getName());
	
	@Autowired
	private FollowService followService;
	
	@RequestMapping("/create")
	public String createFollow(HttpServletRequest request,ModelMap map){
		Follow fo = new Follow();
		fo.setCreateDate(new Date());
		fo.setStatus(0);
		/*ObjectId followerUid = new ObjectId("222");
		fo.setFollowerUid(followerUid);
		ObjectId authorUid = new ObjectId("111");
		fo.setAuthorUid(authorUid);*/
		followService.createFollow(fo);
		return null;
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
