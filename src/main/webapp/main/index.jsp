<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN</title>
</head>
<body>
	<h1>MAIN</h1>
	<div class="menu">
		<ul>
			<li onclick="location.href='/Manager/emp/empList'">list</li>
			<li onclick="location.href='/Manager/member/loginForm'">Sign in</li>
			<li onclick="location.href='/Manager/member/detail?id=${id}'">detailUpdate</li>
		</ul>
	</div>
</body>

</html>