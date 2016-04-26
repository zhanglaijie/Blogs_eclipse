package top.laijie.blogs.tool;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import top.laijie.blogs.domain.User;

@Service
public class BasicService<T> {

	public static String USER_COLLECTION = "user";

	@Autowired
	public MongoTemplate mongoTemplate;

		/**
		 * 通过条件查询,查询分页结果
		 * 
		 * @param pageNo
		 * @param pageSize
		 * @param query
		 * @return
		 */
		public Page<T> getPage(int pageNo, int pageSize,Query query) {
			long totalCount = this.mongoTemplate.count(query,this.getEntityClass());
			Page<T> page = new Page<T>(pageNo, pageSize, totalCount);
			int skipnum = (pageNo-1)*pageSize;
			query.skip(skipnum);// skip相当于从那条记录开始
			query.limit(pageSize);// 从skip开始,取多少条记录
			List<T> datas = (List<T>) mongoTemplate.find(query,this.getEntityClass());
			page.setDatas(datas);
			return page;
		}

		/**
		 * 通过条件查询实体(集合)
		 * 
		 * @param query
		 */
		public List<T> find(Query query,T t) {
			return (List<T>) mongoTemplate.find(query, ((Basic)t).getClass());
		}

		/**
		 * 通过一定的条件查询一个实体
		 * 
		 * @param query
		 * @return
		 */
		public T findOne(Query query) {
			return mongoTemplate.findOne(query, this.getEntityClass());
		}
		
		
		/**
		 * 查询出所有数据
		 * 
		 * @return
		 */
		public List<T> findAll() {
			return this.mongoTemplate.findAll(this.getEntityClass());
		}

		/**
		 * 查询并且修改记录
		 * 
		 * @param query
		 * @param update
		 * @return
		 */
		public T findAndModify(Query query, Update update) {

			return this.mongoTemplate.findAndModify(query, update, this.getEntityClass());
		}

		/**
		 * 按条件查询,并且删除记录
		 * 
		 * @param query
		 * @return
		 */
		public T findAndRemove(Query query) {
			return this.mongoTemplate.findAndRemove(query, this.getEntityClass());
		}

		/**
		 * 通过条件查询更新数据
		 * 
		 * @param query
		 * @param update
		 * @return
		 */
		public void updateFirst(Query query, Update update) {
			mongoTemplate.updateFirst(query, update, this.getEntityClass());
		}

		/**
		 * 保存一个对象到mongodb
		 * 
		 * @param bean
		 * @return
		 */
		public T save(T bean) {
			mongoTemplate.save(bean);
			return bean;
		}

		/**
		 * 通过ID获取记录
		 * 
		 * @param id
		 * @return
		 */
		public T findById(String id) {
			return mongoTemplate.findById(id, this.getEntityClass());
		}
		public T findByOBjId(ObjectId _id){
			return mongoTemplate.findById(_id, this.getEntityClass());
		}
		public void DeleteById(String _id){
			Query query = new Query();
	        query.addCriteria(Criteria.where("_id").is(_id));  
			mongoTemplate.remove(query , this.getEntityClass());
		}
		/**
		 * 通过ID获取记录,并且指定了集合名(表的意思)
		 * 
		 * @param id
		 * @param collectionName
		 *            集合名
		 * @return
		 */
		public T findById(String id, String collectionName) {
			return mongoTemplate.findById(id, this.getEntityClass(), collectionName);
		}

		/**
		 * 获取需要操作的实体类class
		 * 
		 * @return
		 */
		protected  Class<T> getEntityClass(){
			return (Class<T>) Object.class;
		}
		/**
		 * 获取一条数据
		 */
		
}
