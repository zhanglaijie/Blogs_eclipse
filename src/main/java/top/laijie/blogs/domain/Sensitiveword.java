package top.laijie.blogs.domain;

import java.io.Serializable;
import java.util.Date;

import top.laijie.blogs.tool.Basic;

public class Sensitiveword extends Basic implements Serializable{
	private String word;
	private Date createTime;
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Sensitiveword [word=" + word + ", createTime=" + createTime + "]";
	}
	public Sensitiveword(String word, Date createTime) {
		super();
		this.word = word;
		this.createTime = createTime;
	}
	public Sensitiveword() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
