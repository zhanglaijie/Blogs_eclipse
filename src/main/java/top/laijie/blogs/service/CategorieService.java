package top.laijie.blogs.service;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.Query;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.tool.Page;


public interface CategorieService {
	public void createCategories(Categories categories);

	Page<Categories> listCategories(int pageNo, Query query);

	public Categories save(Categories categories);

	public void deleteByOBjId(ObjectId _id);

	public void updateUserByObjId(Categories categories);

	public void updateCount(ObjectId categorieId);

	Page<Categories> listCategories(int pageNo, int pageSize, Query query);
}
