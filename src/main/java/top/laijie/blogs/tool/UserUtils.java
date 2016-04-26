/**
 * 
 */
package top.laijie.blogs.tool;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import top.laijie.blogs.domain.User;
import top.laijie.blogs.service.UserService;
import top.laijie.blogs.service.impl.UserServiceImpl;
/**
 * 获取用户工具类
 * @author laijie
 */
public class UserUtils {
	@Autowired
	UserService service;
	
    public static String getCurrentLoginName()
    {
        String loginName = null;
        SecurityContext context = SecurityContextHolder.getContext();
        Authentication auth = context.getAuthentication();
        if(null != auth){
            loginName = auth.getName();
        }
        
        return  loginName;
    }
    
    /**
     * 获取当前系统登录的用户
     * @return  当前系统登录用户
     */
   /* public static User getCurrentUser()
    {
        User currentUser = null;
        String loginname = getCurrentLoginName();
        if(loginname!=null&&!loginname.equals(""))
        {
        	UserServiceImpl impl = new UserServiceImpl();
        	currentUser = impl.getUserByEmail(loginname);
        }
        
        return currentUser;
    }*/
    
}
