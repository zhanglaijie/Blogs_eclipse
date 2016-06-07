package top.laijie.blogs.controller;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.UserUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	 @Autowired  
	 private UserService userService;   
	 
	@RequestMapping("/main")
	public String adminIndex(Model model){
		return "admin/main.jsp";
	}
	
	@RequestMapping("/top")
	public String top(Model model){
		return "admin/top.jsp";
	}
	@RequestMapping("/userList")
	public String left(Model model){
		List<User> userList = userService.listUser();
		for (int i = userList.size() - 1; i >= 0; i--) {
			String str = userList.get(i).getEmail();
			if (str.equals(UserUtils.getCurrentLoginName())) {
				userList.remove(userList.get(i));
			}
			}
		model.addAttribute("userList", userList);
		return "admin/userList.jsp";
	}
	
	@RequestMapping("/deleteUser")
	public String deleteUser(Model model,String id){
		ObjectId _id = new ObjectId(id);
		userService.DeleteOne(_id );
		return "redirect:/admin/userList";
	}
	
	@RequestMapping("/changeStatus")
	public String changeStatus(Model model,int status,String id){
		ObjectId _id = new ObjectId(id);
		User user = new User();
		user.set_id(_id);
		user.setStatus(status);
		userService.updateUserByObjId(user);
		return "redirect:/admin/userList";
	}
	@RequestMapping("/index")
	public String index(Model model){
		String username = UserUtils.getCurrentLoginName();
		User user  = userService.getUserByEmail(username);
		model.addAttribute("nickname",user.getNicename());
		return "admin/index2.jsp";
	}
	
	
}
