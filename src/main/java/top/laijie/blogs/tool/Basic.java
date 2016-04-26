package top.laijie.blogs.tool;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;

public class Basic {
	
	
	//private String id;
	@Id
	protected ObjectId _id;

	public ObjectId get_id() {
		return _id;
	}

	public void set_id(ObjectId _id) {
		this._id = _id;
	}
	
	
}
