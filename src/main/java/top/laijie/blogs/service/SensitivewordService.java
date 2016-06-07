package top.laijie.blogs.service;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Query;

import top.laijie.blogs.domain.Sensitiveword;
import top.laijie.blogs.tool.Page;

public interface SensitivewordService{

	void createSensitiveword(Sensitiveword sensitiveword);

	Page<Sensitiveword> listSensitiveword(int pageNo, Query query);

	Sensitiveword getSensitiveword(String keyword);

	void deleteOne(ObjectId _id);

	List<Sensitiveword> list();
	
}
