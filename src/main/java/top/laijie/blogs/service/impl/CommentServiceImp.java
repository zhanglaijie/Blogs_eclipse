package top.laijie.blogs.service.impl;

import java.util.List;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import top.laijie.blogs.domain.Comments;
import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.service.CommentService;
import top.laijie.blogs.tool.BasicService;
import top.laijie.blogs.tool.Page;

@Service
public class CommentServiceImp extends BasicService<Comments> implements CommentService{

	private static final int PAGE_SIZE = 100;

	@Override
	public void createCommit(Comments comment) {
		this.save(comment);
	}

	@Override
	public List<Comments> listComment() {
		return this.findAll();
	}
	
	protected  Class<Comments> getEntityClass(){
		return Comments.class;
	}

	@Override
	public Page<Comments> listComment(int pageNo, Query query) {
		return this.getPage(pageNo, PAGE_SIZE, query);
	}
}
