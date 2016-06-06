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
}
