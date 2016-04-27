package top.laijie.blogs.service.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.logging.Logger;

import org.springframework.data.mongodb.core.query.Criteria;  
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;  

import top.laijie.blogs.controller.RegisterAndFindPasswdController;
import top.laijie.blogs.domain.Categories;
import top.laijie.blogs.domain.User;
import top.laijie.blogs.mail.SendEmail;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.tool.BasicService;
import top.laijie.blogs.tool.Des3;
import top.laijie.blogs.tool.MD5Util;
import top.laijie.blogs.tool.PropUtils;
import top.laijie.blogs.tool.ServiceException;
  
	@Service   
	public class UserServiceImpl extends BasicService<User> implements UserService  {     
		private static Logger logger = Logger.getLogger(UserServiceImpl.class.getName());
		private static String DOMIAN = PropUtils.readPropertiesFile("mail.properties","domain");
		/** 
	     *  
	     * @param name 
	     * @return  
	     */  
	    public User findUserByName(String nicename){  
	           
	        return mongoTemplate.findOne(new Query(Criteria.where("nicename").is(nicename)), User.class, USER_COLLECTION);  
	           
	    } 
	    
	    public void test(){
	    	System.out.println("--");
	    }

		public void updateUserByName(String nicename) {
			Query query = new Query();  
	        query.addCriteria(Criteria.where("nicename").is(nicename));  
	        User user = mongoTemplate.findOne(query, User.class,USER_COLLECTION);  
	        user.setStatus(4);  
	        mongoTemplate.save(user, USER_COLLECTION);

		}

		public void updateUserByEmail(String email) {
			Query query = new Query();  
	        query.addCriteria(Criteria.where("email").is(email));  
	        User user = mongoTemplate.findOne(query, User.class,USER_COLLECTION);  
	        user.setStatus(1);  
	        mongoTemplate.save(user, USER_COLLECTION);

		}
		
		public User getUserByEmail(String email) {
			Query query = new Query();  
	        query.addCriteria(Criteria.where("email").is(email));  
	        User user = mongoTemplate.findOne(query, User.class,USER_COLLECTION);  
	        return user;
		} 

		public User getUserBySomething(Query query) {
	        User user = mongoTemplate.findOne(query, User.class,USER_COLLECTION);  
	        return user;
		} 

		
		public User getUserByblogaddress(String blogaddress) {
			Query query = new Query();  
	        query.addCriteria(Criteria.where("blogaddress").is(blogaddress));  
	        User user = mongoTemplate.findOne(query, User.class,USER_COLLECTION);  
	        return user;
		}   
		  /** 
	     * 处理注册 
	     */  
	    public void processregister(User user){  
	    	
	        user.setRegisterTime(new Date());  
	        user.setStatus(0);  
	        ///如果处于安全，可以将激活码处理的更复杂点，这里我稍做简单处理  
		    user.setValidateCode(Des3.encode(user.getEmail()));
		    user.setPassword(MD5Util.encode2hex(user.getPassword()));
	        //user.setValidateCode(MD5Util.encode2hex(user.getEmail()));   
	        this.save(user);
	        ///邮件的内容  
	        StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");  
	        sb.append("<a href=\"http://"+DOMIAN+"/user/register?action=activate&email=");  
	        sb.append(user.getEmail());   
	        sb.append("&validateCode=");   
	        sb.append(user.getValidateCode());  
	        sb.append("\">http://"+DOMIAN+"/user/register?action=activate&email=");   
	        sb.append(user.getEmail());  
	        sb.append("&validateCode=");  
	        sb.append(user.getValidateCode());  
	        sb.append("</a>");  
	          
	        //发送邮件  
	        SendEmail.send(user.getEmail(), sb.toString(),"账号激活邮件");  
	        System.out.println("发送邮件");  
	          
	    }  
	    
		public void processFindPassword(User user) {
			/*user.setRegisterTime(new Date());  
	        user.setStatus(0);  
	        ///如果处于安全，可以将激活码处理的更复杂点，这里我稍做简单处理  
	        //user.setValidateCode(MD5Tool.MD5Encrypt(email));  
	        user.setValidateCode(MD5Util.encode2hex(user.getEmail()));  
	        this.save(user); */
	        ///邮件的内容  
	        StringBuffer sb=new StringBuffer("点击下面链接找回账号</br>");  
	        sb.append("<a href=\"http://"+DOMIAN+"/user/findPasswdByEmail.do?action=activate&email=");  
	        sb.append(user.getEmail());   
	        sb.append("&validateCode=");   
	        sb.append(user.getValidateCode());  
	        sb.append("\">http://"+DOMIAN+"/user/findPasswdByEmail.do?action=activate&email=");   
	        sb.append(user.getEmail());  
	        sb.append("&validateCode=");  
	        sb.append(user.getValidateCode());  
	        sb.append("</a>");    
	        //发送邮件  
	        SendEmail.send(user.getEmail(), sb.toString(),"密码找回邮件");  
	        System.out.println("发送邮件");
		}  
	    /** 
	     * 处理激活 
	     * @throws ParseException  
	     */  
	      ///传递激活码和email过来  
	    public void processActivate(String email , String validateCode)throws ServiceException, ParseException{    
	         //数据访问层，通过email获取用户信息  
	    	User user = mongoTemplate.findOne(new Query(Criteria.where("email").is(email)), User.class, USER_COLLECTION);  
	        //验证用户是否存在   
	        if(user!=null) {    
	            //验证用户激活状态    
	            if(user.getStatus()==0) {   
	                ///没激活  
	                Date currentTime = new Date();//获取当前时间    
	                //验证链接是否过期   
	                currentTime.before(user.getRegisterTime());  
	                if(currentTime.before(user.getLastActivateTime())) {    
	                    //验证激活码是否正确    
	                    if(validateCode.equals(user.getValidateCode())) {    
	                        //激活成功， //并更新用户的激活状态，为已激活   
	                        logger.info("status="+user.getStatus());  
	                        user.setStatus(1);//把状态改为激活  
	                        logger.info("status="+user.getStatus()); 
	                        this.updateUserByEmail(email);  
	                    } else {    
	                       throw new ServiceException("激活码不正确");    
	                    }    
	                } else { throw new ServiceException("激活码已过期！");    
	                }    
	            } else {  
	               throw new ServiceException("404---该链接失效");    
	            }    
	        } else {  
	            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");    
	        }      
	    }

		public User getUserByEmailAndValidate(String email, String validateCode) {
			Query query = new Query();  
	        query.addCriteria(Criteria.where("email").is(email));  
	        query.addCriteria(Criteria.where("validateCode").is(validateCode));
	        User user = mongoTemplate.findOne(query, User.class);  
	        return user;
		}
		
		protected  Class<User> getEntityClass(){
			return User.class;
		}

		public User findByNameAndPwd(String email, String password) {
			Query query = new Query();  
	        query.addCriteria(Criteria.where("email").is(email));  
	        query.addCriteria(Criteria.where("password").is(password));
	        User user = mongoTemplate.findOne(query, User.class);  
	        return user;
		}
	}

