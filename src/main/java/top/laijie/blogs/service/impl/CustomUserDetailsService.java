package top.laijie.blogs.service.impl;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import top.laijie.blogs.domain.User;
import top.laijie.blogs.tool.BasicService;

/**
* 一个自定义的service用来和数据库进行操作. 即以后我们要通过数据库保存权限.则需要我们继承UserDetailsService
* 
* @author laijie
* 
*/
public class CustomUserDetailsService extends BasicService<User> implements UserDetailsService {

	protected static Logger logger = Logger.getLogger("service");


	public UserDetails loadUserByUsername(String email){
		//用户名暂时用邮箱代替
		UserDetails userdetail = null;  
		Boolean status = true;
		try{
		Query query = new Query();  
        query.addCriteria(Criteria.where("email").is(email));  
        User user = mongoTemplate.findOne(query, User.class,USER_COLLECTION);  
		if(user.getStatus()==0){
			status =false;
		}
        userdetail = new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword()
				.toLowerCase(), true, true, true,status,
				getAuthorities(user.getAuth()));
		}catch (Exception e){
			logger.error("Error in retrieving user");
			throw new UsernameNotFoundException("Error in retrieving user");
		}
	return userdetail;
}

	/**
	 * 获得访问角色权限
	 * 
	 * @param access
	 * @return
	 */
	public Collection<GrantedAuthority> getAuthorities(Integer access) {

		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);

		// 所有的用户默认拥有ROLE_USER权限
		logger.debug("Grant ROLE_USER to this user");
		authList.add(new GrantedAuthorityImpl("ROLE_USER"));

		// 如果参数access为1.则拥有ROLE_ADMIN权限
		if (access.compareTo(1) == 0) {
			logger.debug("Grant ROLE_ADMIN to this user");
			authList.add(new GrantedAuthorityImpl("ROLE_ADMIN"));
		}

		return authList;
	}
}


