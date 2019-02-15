<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h1>MAIN</h1>   
	<div class="header">
		<ul>
			<c:choose>
				<c:when test="${sessionScope.memberId == null}">
					<li onclick="location.href='/Manager/member/loginForm'">Sign in</li>
				</c:when>
				<c:when test="${sessionScope.memberId != null}">
					<li onclick="location.href='/Manager/emp/empList'">list</li>	
					<li onclick="location.href='/Manager/member/detailUpdate?id=${memberId}'">detailUpdate</li>
					<li onclick="location.href='/Manager/codeMng/codeList'">codeList</li>      
					<li onclick="location.href='/Manager/member/logout'">logout</li>
			 	</c:when>
			</c:choose>
		</ul>
	</div>
</body>
</html>