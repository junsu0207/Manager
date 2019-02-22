<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>empLIST</title>
</head>
<body>
	<div class="firstList" style="align-content: center;">
	<h1>LIST</h1>
		<table border="1">
			<tr>
				<td>ENAME
				<td>COMM
				<td>HIREDATE
				<td>EMPNO
				<td>MGR
				<td>JOB
				<td>DEPTNO
				<td>SAL
			</tr>
			<c:forEach var="empDTO" items="${list }">
				<tr>
					<td>${empDTO.ENAME}
					<td>${empDTO.COMM}
					<td>${empDTO.HIREDATE}
					<td>${empDTO.EMPNO}
					<td>${empDTO.MGR}
					<td>${empDTO.JOB}
					<td>${empDTO.DEPTNO}
					<td>${empDTO.SAL}
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="button">
		<input type="button" value="back" onclick="location.href='/Manager/main/index'">
	</div>
</body>
</html>