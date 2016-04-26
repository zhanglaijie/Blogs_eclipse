package top.laijie.blogs.service.impl;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.CategorieService;
import top.laijie.blogs.tool.BasicService;
import top.laijie.blogs.tool.Page;


@Service
public class CategorieServiceImp extends BasicService<Categories> implements CategorieService{
	
	
	private static final int PAGE_SIZE = 10;
	public void createCategories(Categories categories){
		super.save(categories);
	}
	
	public Page<Categories> listCategories(int pageNo,Query query) {
		return this.getPage(pageNo, PAGE_SIZE, query);
	}
	protected  Class<Categories> getEntityClass(){
		return Categories.class;
	}
}
