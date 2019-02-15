<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
html,body,div,ul,li,a,span{margin:0; padding:0; outline:0;}
a{text-decoration:none; color:black;}
#header{width:100%; height:40px; border-bottom:1px solid black;}
#header ul{width:100%; height:40px; line-height:40px;}
#header li{width:10%; height:30px; display:inline-block; text-align:center;}

#top{width:100%; height:200px; text-align:center; line-height:200px;}
#top a{font-size:30px;}
</style>
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
					<li onclick="location.href='/Manager/member/logout'">logout</li>
			 	</c:when>
			</c:choose>
		</ul>
	</div>
</body>
</html>