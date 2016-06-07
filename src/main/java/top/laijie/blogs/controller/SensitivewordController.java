package top.laijie.blogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.laijie.blogs.domain.Sensitiveword;
import top.laijie.blogs.service.SensitivewordService;
import top.laijie.blogs.tool.Page;

@Controller
@RequestMapping("/admin/sensitive")
public class SensitivewordController {
	
	@Resource
	private SensitivewordService sensitivewordService;
	
	@RequestMapping("/listNavigation")
	public String createNavigation(Model model,HttpServletRequest request){
		String pageNum = request.getParameter("pageNo");
		int pageNo = 1;
		if(StringUtils.isNotBlank(pageNum)){
			pageNo = Integer.parseInt(pageNum);
		}
		Query query = new Query();
		String keyword = request.getParameter("keyword");
		if(keyword!=null&&!keyword.equals(""))
		query.addCriteria(new Criteria("word").regex(".*?"+keyword+".*"));
		query.with(new Sort(Sort.Direction.DESC, "createTime"));
		Page<Sensitiveword> pageSw = sensitivewordService.listSensitiveword(pageNo, query);
		model.addAttribute("pageSw", pageSw);
		return "admin/sensitive/list.jsp";
	}
	
	@RequestMapping("create")
	@ResponseBody
	public void create(HttpServletResponse response,String keyword){
		Sensitiveword sw = sensitivewordService.getSensitiveword(keyword);
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			if(sw!=null){
				writer.write("{\"status\":\"该敏感词已存在~~~\"}");
	    	}else{
	    		Sensitiveword sensitiveword = new Sensitiveword();
	    		sensitiveword.setCreateTime(new Date());
	    		sensitiveword.setWord(keyword);
	    		sensitivewordService.createSensitiveword(sensitiveword);
	    		writer.write("{\"status\":\"success\"}");
	    		
	    	}
			
		} catch (IOException e) {
			writer.write("{\"status\":\"success\"}");
		}
	}
	
	@RequestMapping("delete")
	public String delete(String id){
		ObjectId _id = new ObjectId(id);
		sensitivewordService.deleteOne(_id );
		return "redirect:/admin/sensitive/listNavigation";
	}
}



