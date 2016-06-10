package top.laijie.blogs.service.impl;

import java.io.IOException;  
import java.util.Collection;  
import java.util.Map;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.Authentication;  
import org.springframework.security.core.GrantedAuthority;  
import org.springframework.security.core.authority.GrantedAuthorityImpl;  
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;  
import org.springframework.util.Assert;  
  
/** 
 * 权限登录成功句柄 
 * 该类为平台成功跳转到多个入口提供依据 
 * @author ryuu-kk 
 * 
 */  
public class MySimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {  
  
    /** 
     * url参数 
     */  
    private Map<String, String> map;  
    /** 
     * 多role选择,默认取得权限表第一个权限 
     */  
    private boolean isFirst = true;  
    @Override  
    public void onAuthenticationSuccess(HttpServletRequest request,  
            HttpServletResponse response, Authentication authentication)  
            throws IOException, ServletException {  
        //Assert.notNull(map, "AuthInterceptMap is null!");  
        String url = "";  
        Collection<GrantedAuthority> authCollection = authentication.getAuthorities();  
  
        if (authCollection.isEmpty()) {  
            return;  
        }  
        for (GrantedAuthority auth : authCollection) {  
          if(auth.getAuthority().equals("ROLE_USER")){
        	  String ru = (String)request.getSession().getAttribute("ru");  
              request.getSession().removeAttribute("ru");  
              if(StringUtils.isNotEmpty(ru)){  
            	  url=ru;
                  //request.getRequestDispatcher(ru).forward(request, response);  
              }else{  
                 url="/author/index";  
              }  
          }else{
        	  url="/admin/index";
          }
        }  
        response.sendRedirect(url);  
    }  
      
    /** 
     * 权限跳转依据 
     * @param map 参数 
     *  key:url 
     *  value:role 
     */  
    public void setAuthDispatcherMap(Map<String, String> map) {  
        this.map = map;  
    }  
  
    /** 
     * 多种角色方案 
     * 设置是否只取得第一个role 
     * @param isFirst true:多种角色只取第一个，false:取得最后一个 
     */  
    public void setMultipleAuth(boolean isFirst) {  
        this.isFirst = isFirst;  
    }  
}  