package top.laijie.blogs.service.impl;


import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.PostsService;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.tool.BasicService;
import top.laijie.blogs.tool.Page;


@Service 
public class PostsServiceImpl extends BasicService<Posts> implements PostsService{
	
	 private static final int PAGE_SIZE = 10;
	 
	@Override
	public Posts loadPosts(ObjectId _id){
		  return mongoTemplate.findOne(new Query(Criteria.where("_id").is(_id)), Posts.class);
	 }
	@Override
	public void createPost(Posts posts) {
		this.save(posts);
		
	}
	@Override
	public List<Posts> listPosts() {
		// TODO Auto-generated method stub
		return this.findAll();
	}
	@Override
	public Page<Posts> listPost(int pageNo,Query query) {
		return this.getPage(pageNo, PAGE_SIZE, query);
	}
	
	protected  Class<Posts> getEntityClass(){
		return Posts.class;
	}
	@Override
	public void changeStatus(String _id, int status) {
		Query query = new Query();  
        query.addCriteria(Criteria.where("_id").is(_id));  
        Posts post = mongoTemplate.findOne(query,getEntityClass());  
        post.setStatus(status);
        mongoTemplate.save(post);
	}
	public void changereadNum(ObjectId _id, boolean b) {
		if(b){
			Query query = new Query();  
	        query.addCriteria(Criteria.where("_id").is(_id));  
	        Posts post = mongoTemplate.findOne(query,getEntityClass());  
	        post.setRead_count(post.getRead_count()+1);
	        mongoTemplate.save(post);
		}
	}
}
