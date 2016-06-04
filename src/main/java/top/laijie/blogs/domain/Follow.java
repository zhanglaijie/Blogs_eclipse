package top.laijie.blogs.domain;

import java.io.Serializable;
import java.util.Date;

import org.bson.types.ObjectId;

import top.laijie.blogs.tool.Basic;
/**
 * 关注表
 * @author laijie.zhang
 *
 */
public class Follow extends Basic implements Serializable{
	private ObjectId authorUid;
	private ObjectId followerUid;
	private Date createDate;
	private int status=1;
	public ObjectId getAuthorUid() {
		return authorUid;
	}
	public void setAuthorUid(ObjectId authorUid) {
		this.authorUid = authorUid;
	}
	public ObjectId getFollowerUid() {
		return followerUid;
	}
	public void setFollowerUid(ObjectId followerUid) {
		this.followerUid = followerUid;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Follow [authorUid=" + authorUid + ", followerUid=" + followerUid + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}
	
	public Follow() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Follow(ObjectId authorUid, ObjectId followerUid, Date createDate, int status) {
		super();
		this.authorUid = authorUid;
		this.followerUid = followerUid;
		this.createDate = createDate;
		this.status = status;
	}
	
}
