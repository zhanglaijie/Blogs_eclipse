package top.laijie.blogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.domain.dto.FollowDto;
import top.laijie.blogs.keyword.SensitivewordFilter;
import top.laijie.blogs.mail.SendEmail;
import top.laijie.blogs.service.CategorieService;
import top.laijie.blogs.service.FollowService;
import top.laijie.blogs.service.PostsService;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.service.impl.PostsServiceImpl;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.CookieTool;
import top.laijie.blogs.tool.HTMLSpirit;
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
	 private PostsService postService;
	 @Resource
	 private UserServiceImpl userService;
	 @Resource
	 private FollowService followService;
	 @Resource
	 private CategorieService categorieService;
	 
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
	 public String createPostNavigation(ModelMap map){
		 User user = userService.getUserByEmail(UserUtils.getCurrentLoginName());
		 Query query = new Query(Criteria.where("uid").is(user.get_id()));
		 query.addCriteria(Criteria.where("visible").is(0));
		 Page<Categories> categorie = categorieService.listCategories(1, query);
		 map.addAttribute("categorie", categorie);
		return "author/post/add_post.jsp";
	 }
	 
	 @RequestMapping(value="/createPost.do",method={RequestMethod.GET,RequestMethod.POST})  
	 @ResponseBody
	 public void createPost(HttpServletRequest request,HttpServletResponse response){
		 response.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//content = request.getParameter("content");
		String cateId = request.getParameter("categorieId");
		ObjectId categorieId =null;
		if(cateId!=null&&!cateId.equals("")){
			 categorieId = new ObjectId(cateId);
			 categorieService.updateCount(categorieId);
		}
		String excerpt = request.getParameter("excerpt");
		String status = request.getParameter("status");
		Posts posts = new Posts();
		posts.setStatus(Integer.parseInt(status));
		posts.setTitle(repalce(title));
		posts.setContent(repalce(content));
		posts.setCategorieId(categorieId);
		
		User user = userService.getUserByEmail(UserUtils.getCurrentLoginName());
		if(excerpt!=null&&!excerpt.equals("")){
			posts.setExcerpt(repalce(excerpt));
		}else{
			String contentWithutHTML = HTMLSpirit.delHTMLTag(content);
			if(contentWithutHTML.length()>150){
				posts.setExcerpt(repalce(contentWithutHTML.substring(0, 150)));
			}else{
				posts.setExcerpt(repalce(contentWithutHTML));
			}
			
		}
		posts.setUid(user.get_id());
		posts.setPostdate(new Date());
		postService.createPost(posts);
		if(posts.getStatus()==1){
			 Query query = new Query();
			 query.addCriteria(Criteria.where("authorUid").is(user.get_id()));  
			 Page<Follow> followPage = followService.listFollow(1,1000,query);
			 for(Follow follow:followPage.getDatas()){
				 User user2 = userService.findByOBjId(follow.getFollowerUid());
				 String subject = new String("【壹博客】"+user.getNicename()+"发博《"+posts.getTitle()+"》");
				 StringBuffer buffer= new StringBuffer();
				 buffer.append("<p>亲爱的"+user2.getNicename()+":</p>");
				 buffer.append("<p>您关注的博客<a href='http://www.laijie.top/"+user.getBlogaddress()+"'>"+user.getBlogname()+"</a>有新文章《"+posts.getTitle()+"》更新,敬请查看</p>");
				 buffer.append("<p>"+posts.getExcerpt()+"</p>");
				 
				 SendEmail.send(user2.getEmail(),buffer.toString(),subject);
			 }
		}
		PrintWriter writer = null;
		try {
			postService.createPost(posts);
			writer = response.getWriter();
			writer.write("{\"status\":\"新建成功\"}");
		} catch (IOException e) {
			writer.write("{\"status\":\"新建失败\"}");
		}
	 }
	 
	 @RequestMapping(value="/modifyPost.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public String modifyPost(HttpServletRequest request,String _id,ModelMap map){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Posts posts = new Posts();
		posts = postService.findById(_id);
		posts.setTitle(repalce(title));
		posts.setContent(repalce(content));
		//posts.setAuthor(UserUtils.getCurrentLoginName());
		posts.setPostdate(new Date());
		postService.createPost(posts);
		map.addAttribute("post",posts);
		return "author/post/save_success.jsp";
	 }
	 /**
	  * 文章列表 主页
	  * @param request
	  * @param response
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/listPosts.do",method={RequestMethod.GET,RequestMethod.POST})  
	 public String listPost(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String pageNum = request.getParameter("pageNo");
		int pageNo = 1;
		if(StringUtils.isNotBlank(pageNum)){
			pageNo = Integer.parseInt(pageNum);
		}
		Query query = new Query();
		User user = userService.getUserByEmail(UserUtils.getCurrentLoginName());
		query.addCriteria(Criteria.where("uid").is(user.get_id())); 
		query.addCriteria(Criteria.where("status").is(1)); 
		query.with(new Sort(Sort.Direction.DESC, "postdate"));
		Page<Posts> postPage = postService.listPost(pageNo, query);
		logger.info(postPage.toString());
		//User user = userService.getUserByEmail(email);
		map.addAttribute("postPage",postPage);
		map.addAttribute("user",user);
		CookieTool.addCookie(response,"email",user.getEmail(), 3600);
		return "author/post/post_list.jsp";
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
		return "author/post/edit_post.jsp";
	 }
	 
	 /**
	  * 草稿箱
	  */
	 @RequestMapping("/listDrafts.do")
	 public String listDrafts(HttpServletRequest request,HttpServletResponse response,ModelMap map){
			String pageNum = request.getParameter("pageNo");
			int pageNo = 1;
			if(StringUtils.isNotBlank(pageNum)){
				pageNo = Integer.parseInt(pageNum);
			}
			Query query = new Query();
			User user = userService.getUserByEmail(UserUtils.getCurrentLoginName());
			query.addCriteria(Criteria.where("uid").is(user.get_id())); 
			query.addCriteria(Criteria.where("status").is(0)); 
			query.with(new Sort(Sort.Direction.DESC, "postdate"));
			Page<Posts> postPage = postService.listPost(pageNo, query);
			logger.info(postPage.toString());
			//User user = userService.getUserByEmail(email);
			map.addAttribute("postPage",postPage);
			map.addAttribute("user",user);
			CookieTool.addCookie(response,"email",user.getEmail(), 3600);
		 return "author/post/draft_list.jsp";
	 }
	 
	 //修改文章状态
	 @RequestMapping("/changeStatus")
	 public String changeStatus(int status,int pageNo,String _id){
		 postService.changeStatus(_id,status);
		 if(status==1){
			 return "redirect:/postsController/listDrafts.do?pageNo="+pageNo; 
		 }else {
			 return "redirect:/postsController/listPosts.do?pageNo="+pageNo; 
		 }
	 }

	 private String repalce(String string){
		 SensitivewordFilter filter = new SensitivewordFilter();
			return filter.replaceSensitiveWord(string,2,"*");
	 }

}
