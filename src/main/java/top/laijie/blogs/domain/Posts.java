package top.laijie.blogs.domain;

import java.io.Serializable;
import java.util.Date;

import top.laijie.blogs.tool.Basic;

public class Posts extends Basic implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1415437642114087749L;
	private String title;
	private String content;
	/**
	 * 摘录
	 */
	private String excerpt;
	/**
	 * 0-发布
	 * 1-草稿
	 * 2-回收站
	 */
	private int status=0;
	private String type;
	private String author;
	private Date postdate;
	private Date modifieddate;
	private String tags;
	private int comment_count;
	private int read_count;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getExcerpt() {
		return excerpt;
	}
	public void setExcerpt(String excerpt) {
		this.excerpt = excerpt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public Date getModifieddate() {
		return modifieddate;
	}
	public void setModifieddate(Date modifieddate) {
		this.modifieddate = modifieddate;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public Posts() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Posts [title=" + title + ", content=" + content + ", excerpt="
				+ excerpt + ", status=" + status + ", type=" + type
				+ ", author=" + author + ", postdate=" + postdate
				+ ", modifieddate=" + modifieddate + ", tags=" + tags
				+ ", comment_count=" + comment_count + ", read_count="
				+ read_count + "]";
	}
	public Posts(String title, String content, String excerpt, int status,
			String type, String author, Date postdate, Date modifieddate,
			String tags, int comment_count, int read_count) {
		super();
		this.title = title;
		this.content = content;
		this.excerpt = excerpt;
		this.status = status;
		this.type = type;
		this.author = author;
		this.postdate = postdate;
		this.modifieddate = modifieddate;
		this.tags = tags;
		this.comment_count = comment_count;
		this.read_count = read_count;
	}
}
	
