package top.laijie.blogs.tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.RedirectUrlBuilder;

public class LoginUrlEntryPoint extends LoginUrlAuthenticationEntryPoint{

	 private static final Log log = LogFactory.getLog(LoginUrlEntryPoint.class);

	 public void commence(HttpServletRequest request,  
	            HttpServletResponse response, AuthenticationException authException)  
	            throws IOException, ServletException {  
	        String returnUrl = buildHttpReturnUrlForRequest(request);  
	        request.getSession().setAttribute("ru", returnUrl);  
	        super.commence(request, response, authException);  
	    }  
	  
	    protected String buildHttpReturnUrlForRequest(HttpServletRequest request)  
	            throws IOException, ServletException {  
	  
	  
	        RedirectUrlBuilder urlBuilder = new RedirectUrlBuilder();  
	        urlBuilder.setScheme("http");  
	        urlBuilder.setServerName(request.getServerName());  
	        urlBuilder.setPort(request.getServerPort());  
	        urlBuilder.setContextPath(request.getContextPath());  
	        urlBuilder.setServletPath(request.getServletPath());  
	        urlBuilder.setPathInfo(request.getPathInfo());  
	        urlBuilder.setQuery(request.getQueryString());  
	  
	        return urlBuilder.getUrl();  
	    }  

	}