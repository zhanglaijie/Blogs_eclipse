package top.laijie.blogs.service;

import org.springframework.data.mongodb.core.query.Query;

import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.tool.Page;


public interface CategorieService {
	public void createCategories(Categories categories);

	Page<Categories> listCategories(int pageNo, Query query);
}
