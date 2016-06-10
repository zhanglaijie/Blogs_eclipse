package top.laijie.blogs.service;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Query;

import top.laijie.blogs.domain.Posts;
import top.laijie.blogs.tool.Page;


public interface PostsService{
	
	public Posts loadPosts(ObjectId _id);

	public void createPost(Posts posts);

	public List<Posts> listPosts();
	public Page<Posts> listPost(int pageNo, Query query);

	public Posts findById(String _id);

	public void DeleteById(String _id);

	public void changeStatus(String _id, int status);

	public Posts findByOBjId(ObjectId _id);

	public void changereadNum(ObjectId _id, boolean b);

	public void changeCommentNum(ObjectId postId, boolean b);
}

