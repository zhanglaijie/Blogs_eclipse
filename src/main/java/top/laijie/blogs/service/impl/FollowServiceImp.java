package top.laijie.blogs.service.impl;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.service.FollowService;
import top.laijie.blogs.tool.BasicService;
import top.laijie.blogs.tool.Page;

@Service
public class FollowServiceImp extends BasicService<Follow> implements FollowService{

	private static final int PAGE_SIZE = 10;

	@Override
	public void createFollow(Follow follow) {
		super.save(follow);
	}

	@Override
	public Page<Follow> listFollow(int pageNo, Query query) {
		return this.getPage(pageNo, PAGE_SIZE, query);
	}
	
	@Override
	public Follow find(Query query){
		return this.findOne(query);
	}

	protected  Class<Follow> getEntityClass(){
		return Follow.class;
	}
}
