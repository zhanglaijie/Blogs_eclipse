package top.laijie.blogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.PostsService;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.service.impl.PostsServiceImpl;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.UserUtils;
/**
 * 文章管理
 * @author laijie
 *
 */
@Controller  
@RequestMapping("/postsController") 
public class PostsController {
	 private static Logger logger = Logger.getLogger(UserController.class.getName());  
	 @Resource  
	private PostsServiceImpl postService;
	 @Resource
	 private UserServiceImpl userService;
	 @RequestMapping(value="/loadPosts.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public void loadPostById(){
		ObjectId _id = new ObjectId("56e24b51b2fcc518ac5e00fa"); 
		Posts posts = postService.loadPosts(_id); 
		logger.info(posts.toString());
	 }
	 /**
	  * 导航到新建文章
	  */
	 @RequestMapping(value="/createPostNavigation.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public String createPostNavigation(){
		return "back/add_post.jsp";
	 }
	 @RequestMapping(value="/createPost.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public void createPost(HttpServletRequest request,HttpServletResponse response){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		content = request.getParameter("content");
		Posts posts = new Posts();
		posts.setTitle(title);
		posts.setContent(content);
		posts.setAuthor(UserUtils.getCurrentLoginName());
		posts.setPostdate(new Date());
		postService.createPost(posts);
		PrintWriter writer = null;
		try {
			postService.createPost(posts);
			writer = response.getWriter();
			writer.write("{\"status\":\"success\"}");
		} catch (IOException e) {
			writer.write("{\"status\":\"success\"}");
		}
	 }
	 
	 @RequestMapping(value="/modifyPost.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public String modifyPost(HttpServletRequest request,String _id,ModelMap map){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Posts posts = new Posts();
		posts = postService.findById(_id);
		posts.setTitle(title);
		posts.setContent(content);
		posts.setAuthor(UserUtils.getCurrentLoginName());
		posts.setPostdate(new Date());
		postService.createPost(posts);
		map.addAttribute("post",posts);
		return "back/save_success.jsp";
	 }
	 
	 @RequestMapping(value="/listPosts.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public String listPost(HttpServletRequest request,ModelMap map){
		String pageNum = request.getParameter("pageNo");
		int pageNo = 1;
		if(StringUtils.isNotBlank(pageNum)){
			pageNo = Integer.parseInt(pageNum);
		}
		Query query = new Query();
		Page<Posts> postPage = postService.listPost(pageNo, query);
		logger.info(postPage.toString());
		String email = UserUtils.getCurrentLoginName();
		User user = userService.getUserByEmail(email);
		map.addAttribute("postPage",postPage);
		map.addAttribute("user",user);
		return "back/index.jsp";
	 }
	 @RequestMapping("/deletePost.do")
	 public String deletePost(String _id,String pageNo){
		postService.DeleteById(_id);
		return "redirect:/postsController/listPosts.do?pageNo="+pageNo;
	 }
	 @RequestMapping("/modifyPostNavigation.do")
	 public String modifyPost(String _id,ModelMap map){
		Posts post = postService.findById(_id);
		map.addAttribute("post",post);
		return "back/edit_post.jsp";
	 }
}
