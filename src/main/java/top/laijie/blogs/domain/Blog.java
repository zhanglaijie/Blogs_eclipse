package top.laijie.blogs.domain;

import org.bson.types.ObjectId;

public class Blog {
	private ObjectId id;
 	private String blogname;
    private String blogaddress;
    private String blogsubname;
    private String blogDescription;
	public String getBlogname() {
		return blogname;
	}
	public void setBlogname(String blogname) {
		this.blogname = blogname;
	}
	public String getBlogaddress() {
		return blogaddress;
	}
	public void setBlogaddress(String blogaddress) {
		this.blogaddress = blogaddress;
	}
	public String getBlogsubname() {
		return blogsubname;
	}
	public void setBlogsubname(String blogsubname) {
		this.blogsubname = blogsubname;
	}
	public String getBlogDescription() {
		return blogDescription;
	}
	public void setBlogDescription(String blogDescription) {
		this.blogDescription = blogDescription;
	}
	@Override
	public String toString() {
		return "Blog [blogname=" + blogname + ", blogaddress=" + blogaddress + ", blogsubname=" + blogsubname
				+ ", blogDescription=" + blogDescription + "]";
	}
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Blog(String blogname, String blogaddress, String blogsubname, String blogDescription) {
		super();
		this.blogname = blogname;
		this.blogaddress = blogaddress;
		this.blogsubname = blogsubname;
		this.blogDescription = blogDescription;
	}
    
}
