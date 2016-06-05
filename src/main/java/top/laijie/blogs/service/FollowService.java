package top.laijie.blogs.service;

import org.springframework.data.mongodb.core.query.Query;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.tool.Page;

public interface FollowService {
	public void createFollow(Follow follow);
	
	Page<Follow> listFollow(int pageNo,Query query);
}
