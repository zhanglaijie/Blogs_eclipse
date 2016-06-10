package top.laijie.blogs.tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class LoginUrlEntryPoint implements AuthenticationEntryPoint{

	 private static final Log log = LogFactory.getLog(LoginUrlEntryPoint.class);

	 

	 @Override
	 public void commence(HttpServletRequest request,HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
	
		  String targetUrl = null;
		  String url = request.getRequestURI();
		  // 取得登陆前的url
		  String refererUrl = request.getHeader("Referer");  
		  // TODO 增加处理逻辑
		  targetUrl = refererUrl;
		  response.sendRedirect(targetUrl);

	 }

	}