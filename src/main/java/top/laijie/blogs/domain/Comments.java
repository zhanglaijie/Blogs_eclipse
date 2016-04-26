package top.laijie.blogs.domain;

import java.io.Serializable;

import top.laijie.blogs.tool.Basic;

public class Comments extends Basic implements Serializable{
	private User user;
	private String Article;
	private String content;
}
