package top.laijie.blogs.domain.dto;

import java.io.Serializable;
import java.util.Date;

import org.bson.types.ObjectId;

import top.laijie.blogs.domain.Follow;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.tool.Basic;
/**
 * 关注表
 * @author laijie.zhang
 *
 */
public class FollowDto extends Basic implements Serializable{
	//作者Id
	private ObjectId authorUid;
	private ObjectId followerUid;
	//0-no 1-yes
	private int status;
	private Date createDate;
	
	private User user;
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
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "FollowDto [authorUid=" + authorUid + ", followerUid=" + followerUid + ", status=" + status
				+ ", createDate=" + createDate + ", user=" + user + "]";
	}
	public FollowDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FollowDto(ObjectId authorUid, ObjectId followerUid, int status, Date createDate, User user) {
		super();
		this.authorUid = authorUid;
		this.followerUid = followerUid;
		this.status = status;
		this.createDate = createDate;
		this.user = user;
	}
	
	public static FollowDto followtoDto(Follow follow){
		FollowDto dto = new FollowDto();
		dto.set_id(follow.get_id());
		dto.setAuthorUid(follow.getFollowerUid());
		dto.setFollowerUid(follow.getFollowerUid());
		dto.setCreateDate(follow.getCreateDate());
		dto.setStatus(follow.getStatus());
		return dto;
	}
}
