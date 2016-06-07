package top.laijie.blogs.service.impl;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Sensitiveword;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.SensitivewordService;
import top.laijie.blogs.tool.BasicService;
import top.laijie.blogs.tool.Page;

@Service("sensitivewordService")
public class SensitivewordServiceImp extends BasicService<Sensitiveword> implements SensitivewordService{

	private static final int PAGE_SIZE = 10;
	
	@Override
	public Sensitiveword getSensitiveword(String keyword) {
		Query query = new Query();  
        query.addCriteria(Criteria.where("word").is(keyword));  
        Sensitiveword sw = mongoTemplate.findOne(query,getEntityClass());  
        return sw;
	}  
	
	@Override
	public void createSensitiveword(Sensitiveword sensitiveword){
		super.save(sensitiveword);
	}
	
	@Override
	public Page<Sensitiveword> listSensitiveword(int pageNo,Query query) {
		return this.getPage(pageNo, PAGE_SIZE, query);
	}
	
	protected  Class<Sensitiveword> getEntityClass(){
		return Sensitiveword.class;
	}

	@Override
	public void deleteOne(ObjectId _id) {
		super.deleteByOBjId(_id);
	}
	
	@Override
	public List<Sensitiveword> list() {
		// TODO Auto-generated method stub
		return this.findAll();
	}
}
