package top.laijie.blogs.service.impl;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Criteria;
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
	
	@Override
	public void createCategories(Categories categories){
		super.save(categories);
	}
	
	@Override
	public Page<Categories> listCategories(int pageNo,Query query) {
		return this.getPage(pageNo, PAGE_SIZE, query);
	}
	
	@Override
	public Categories save(Categories categories){
		return super.save(categories);
	}
	
	protected  Class<Categories> getEntityClass(){
		return Categories.class;
	}

	@Override
	public void updateUserByObjId(Categories categories) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(categories.get_id()));
		Categories categories2 = mongoTemplate.findOne(query, getEntityClass());
		categories2.setVisible(categories.getVisible());
		mongoTemplate.save(categories2);
	}

	@Override
	public void updateCount(ObjectId categorieId) {
		Query query = new Query();  
        query.addCriteria(Criteria.where("_id").is(categorieId));  
        Categories cate = mongoTemplate.findOne(query,getEntityClass());  
        cate.setCount(cate.getCount()+1);
        mongoTemplate.save(cate);
	}

}
