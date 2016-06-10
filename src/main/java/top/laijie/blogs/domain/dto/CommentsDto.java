package top.laijie.blogs.domain.dto;

import java.io.Serializable;
import java.util.Date;

import org.bson.types.ObjectId;

import top.laijie.blogs.domain.Comments;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.tool.Basic;

public class CommentsDto extends Basic implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6423873700159310617L;
	private ObjectId userId;
	private ObjectId postId;
	private String content;
	private String replycontent;
	//1-可见 0-屏蔽
	private int status;
	private Date createDate;
	private Date replyDate;
	
	private User user;
	public ObjectId getUserId() {
		return userId;
	}
	public void setUserId(ObjectId userId) {
		this.userId = userId;
	}
	public ObjectId getPostId() {
		return postId;
	}
	public void setPostId(ObjectId postId) {
		this.postId = postId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	public CommentsDto(ObjectId userId, ObjectId postId, String content, String replycontent, int status,
			Date createDate, Date replyDate, User user) {
		super();
		this.userId = userId;
		this.postId = postId;
		this.content = content;
		this.replycontent = replycontent;
		this.status = status;
		this.createDate = createDate;
		this.replyDate = replyDate;
		this.user = user;
	}
	public static CommentsDto CommentsToDto(Comments comment) {
		CommentsDto dto = new CommentsDto();
		dto.set_id(comment.get_id());
		dto.setPostId(comment.getPostId());
		dto.setUserId(comment.getUserId());
		dto.setContent(comment.getContent());
		dto.setReplycontent(comment.getReplycontent());
		dto.setStatus(comment.getStatus());
		dto.setCreateDate(comment.getCreateDate());
		dto.setReplyDate(comment.getReplyDate());
		return dto;
	}
	
	public CommentsDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CommentsDto [userId=" + userId + ", postId=" + postId + ", content=" + content + ", replycontent="
				+ replycontent + ", status=" + status + ", createDate=" + createDate + ", replyDate=" + replyDate
				+ ", user=" + user + "]";
	}
	
}
