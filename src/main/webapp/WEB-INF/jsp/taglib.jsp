<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page isELIgnored="false" %>
<%@page import="java.util.*"%>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<fmt:setLocale value="zh_CN"/>
<link rel="stylesheet" href="${ctx}/validator/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/validator/dist/css/bootstrapValidator.css"/>

