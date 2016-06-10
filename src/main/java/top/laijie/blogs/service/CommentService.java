package top.laijie.blogs.service;

import java.util.List;

import org.springframework.data.mongodb.core.query.Query;

import top.laijie.blogs.domain.Comments;
import top.laijie.blogs.tool.Page;

public interface CommentService {
	public void createCommit(Comments comment);
	public List<Comments> listComment();
	
	public Page<Comments> listComment(int pageNo, Query query);
}
