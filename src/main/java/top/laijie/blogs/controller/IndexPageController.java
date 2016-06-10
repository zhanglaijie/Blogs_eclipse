package top.laijie.blogs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.CategorieService;
import top.laijie.blogs.service.impl.PostsServiceImpl;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.Page;
/**
 * 匹配个人主页功能
 * @author laijie
 *
 */
@Controller
@RequestMapping("")
public class IndexPageController {
	 private static Logger logger = Logger.getLogger(IndexPageController.class.getName());  
	 
	 @Autowired  
	 private UserServiceImpl userService;   
	 
	 @Autowired  
	 private PostsServiceImpl postService;
	 
	 @Autowired
	 private CategorieService categorieService;
	 
	 @RequestMapping(value="/{name}", method = {RequestMethod.GET})
	public String getDetail(@PathVariable("name") String name,ModelMap map,HttpServletRequest request){
		Query query = new Query();  
        query.addCriteria(Criteria.where("blogaddress").is(name));  
	    User user = userService.findOne(query);
	    if(user!=null){
	 		//Query query2 = new Query();
	 		 Query query2 = new Query(Criteria.where("uid").is(user.get_id()));
	 		query2.with(new Sort(Sort.Direction.DESC, "postdate"));
	 		query2.addCriteria(Criteria.where("status").is(1)); 
	 		Query query3 = new Query(Criteria.where("visible").is(0));
	 		 query3.addCriteria(Criteria.where("uid").is(user.get_id()));
	 		 Page<Categories> catelist = categorieService.listCategories(1, query3);
	 		 map.addAttribute("cateList",catelist.getDatas());
	    	 map.addAttribute("user", user);
	 	    return "/front/index.jsp";
	    }else{
	    	map.addAttribute("message", "该页面不存在");
	    	return "/register/activate_failure.jsp";
	    }
	 
	}
	 //文章列表
	 @RequestMapping("/post/{name}")
	 public String postList(@PathVariable("name") String name,ModelMap map,HttpServletRequest request){
		 String pageNum = request.getParameter("pageNo");
			int pageNo = 1;
			if(StringUtils.isNotBlank(pageNum)){
				pageNo = Integer.parseInt(pageNum);
			}
			Query query = new Query();  
			query.addCriteria(Criteria.where("blogaddress").is(name));  
		    User user = userService.findOne(query);
	 		 Query query2 = new Query(Criteria.where("uid").is(user.get_id()));
	 		query2.with(new Sort(Sort.Direction.DESC, "postdate"));
	 		query2.addCriteria(Criteria.where("status").is(1)); 
	 		Page<Posts> postList = postService.listPost(pageNo , query2);
	    	 map.addAttribute("name", name);
	    	 map.addAttribute("postPage", postList);
		 return "/front/post/post_list.jsp";
	 }
	 
	 //文章详情
	 @RequestMapping("*/p/detail.htm")
	 public String postDetail(String id,ModelMap map){
	 	//System.out.println(id);
		 ObjectId _id = new ObjectId(id);
	 	 Posts post = postService.findByOBjId(_id);
	 	 map.put("post", post);
		 return "/front/post.jsp";
	 }
}
