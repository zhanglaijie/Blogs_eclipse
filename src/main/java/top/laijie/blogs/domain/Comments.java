package top.laijie.blogs.domain;

import java.io.Serializable;
import java.util.Date;

import org.bson.types.ObjectId;

import top.laijie.blogs.tool.Basic;

public class Comments extends Basic implements Serializable{
	private ObjectId userId;
	private ObjectId postId;
	private String content;
	private String replycontent;
	//1-可见 0-屏蔽
	private int status;
	private Date createDate;
	private Date replyDate;
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
	public Comments(ObjectId userId, ObjectId postId, String content, String replycontent, int status, Date createDate,
			Date replyDate) {
		super();
		this.userId = userId;
		this.postId = postId;
		this.content = content;
		this.replycontent = replycontent;
		this.status = status;
		this.createDate = createDate;
		this.replyDate = replyDate;
	}
	public Comments() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Comments [userId=" + userId + ", postId=" + postId + ", content=" + content + ", replycontent="
				+ replycontent + ", status=" + status + ", createDate=" + createDate + ", replyDate=" + replyDate + "]";
	}
	
}
