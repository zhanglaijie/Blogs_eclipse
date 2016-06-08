package top.laijie.blogs.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.bson.types.ObjectId;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.impl.CategorieServiceImp;
import top.laijie.blogs.service.impl.UserServiceImpl;
import top.laijie.blogs.tool.Page;
import top.laijie.blogs.tool.UserUtils;

@Controller
@RequestMapping("/categorieController")
public class CategorieController {
	private static Logger logger = Logger.getLogger(IndexPageController.class.getName());
	@Resource  
	private CategorieServiceImp categorieServiceImp;
	@Autowired  
    UserServiceImpl userService;   
	@RequestMapping("/create_categorie.do")
	public String add_categorie(HttpServletRequest request){
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		int visible = Integer.valueOf(request.getParameter("visible"));
		String userName = UserUtils.getCurrentLoginName();
		User user = userService.getUserByEmail(userName);
		Categories categories = new Categories();
		categories.setUid(user.get_id());
		categories.setTitle(title);
		categories.setVisible(visible);
		categories.setDescription(description);
		categorieServiceImp.save(categories);
		logger.info(categories);
	    return "redirect:/categorieController/list_categorie.do";
	}
	
	/*@RequestMapping("/to_edit_categorie")
	public String to_edit_categorie(HttpServletRequest request,String id,RedirectAttributesModelMap modelMap){
		String pageNo = request.getParameter("pageNo");
		ObjectId _id =new ObjectId(id);
		Categories  categories = categorieServiceImp.findByOBjId(_id);
		modelMap.addFlashAttribute("categorie.title",categories.getTitle());
		return "redirect:/categorieController/list_categorie.do?pageNo="
		+pageNo+"&title="+categories.getTitle()+"&visible="+categories.getVisible()
		+"&description="+categories.getDescription();
		
	}*/
	
	@RequestMapping("delete_categorie")
	public String delete_categorie(String id){
		ObjectId _id = new ObjectId(id);
		categorieServiceImp.deleteByOBjId(_id);
		return "redirect:/categorieController/list_categorie.do";
	}
	/**
	 * 显示分类
	 */
	@RequestMapping("/list_categorie.do")
	public String list_categorie(Model model,HttpServletRequest request,HttpServletResponse response){
		String pageNum = request.getParameter("pageNo");
		int pageNo = 1;
		if(StringUtils.isNotBlank(pageNum)){
			pageNo = Integer.parseInt(pageNum);
		}
		Categories cs = new Categories();
		String userName = UserUtils.getCurrentLoginName();
		User user = userService.getUserByEmail(userName);
		cs.setUid(user.get_id());
		Query query = new Query(Criteria.where("uid").is(user.get_id()));
		Page<Categories> page = categorieServiceImp.listCategories(pageNo, query);
		model.addAttribute("page", page);
		return "/author/categorie/categorie_list.jsp";
	}	
}
