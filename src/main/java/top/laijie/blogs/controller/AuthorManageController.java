package top.laijie.blogs.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.tool.UserUtils;

@Controller
@RequestMapping("/author")
public class AuthorManageController {
	
	 @Resource
	 private UserService userService;
	
	@RequestMapping("/index")
	public String index(ModelMap map){
		String email = UserUtils.getCurrentLoginName();
		User user = userService.getUserByEmail(email);
		map.put("nickname", user.getNicename());
		map.put("blogaddress", user.getBlogaddress());
		return "author/index.jsp";
	} 
	
	@RequestMapping("/A_menus")
	public String A_menus(){
		return "author/A_menus.jsp";
	} 
}
