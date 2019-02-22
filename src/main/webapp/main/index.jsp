<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#header {
	margin: 0;
	padding: 0;
	height: 100%;
	height: 150px;
	text-align: center;
	border: 1px solid orange;
	line-height: 80%
}

.nav {
	width: 25%;
	height: 650px;
	border: 1px solid orange;
	float: left;
}

#section {
	width: 74%;
	height: auto;
	border: 1px solid orange;
	float: left;
}

.footer {
	width: 100%;
	height: 50px;
	clear: both;
	text-align: center;
	border: 1px solid black;
}
</style>
</head>
<body>
	<div id="header">
		<h1>MANAGER MAIN</h1>
		<c:if test="${sessionScope.memberName != null}">
			<p>${sessionScope.memberName}님</p>          
		</c:if>
	</div>

	<div class="nav">
		<ul>
			<c:choose>
				<c:when test="${sessionScope.memberId == null}">
					<li onclick="location.href='/Manager/member/loginForm'">Sign in</li>
				</c:when>
				<c:when test="${sessionScope.memberId != null}">
					<li onclick="location.href='/Manager/emp/empList'">empList</li>
					<li	onclick="location.href='/Manager/member/detailUpdate?id=${memberId}'">detailUpdate</li>
					<li onclick="location.href='/Manager/codeMng/codeList'">codeList</li>
					<li onclick="location.href='/Manager/item/itemList'">itemList</li>
					<li onclick="location.href='/Manager/member/logout'">logout</li>
				</c:when>
			</c:choose>
		</ul>
	</div>

	<div id="section">
		
		<c:if test="${param.req == 'loginForm' }">
			<jsp:include page = "../member/loginForm.jsp"/>
		</c:if>
		
		<c:if test="${param.req == 'empList' }">
			<jsp:include page = "../emp/empList.jsp"/>
		</c:if>
		
		<c:if test="${param.req == 'signUpForm' }">
			<jsp:include page = "../member/signUpForm.jsp"/>
		</c:if>
		
		<c:if test="${param.req == 'detail' }">
			<jsp:include page = "../member/detail.jsp"/>
		</c:if>
		
		<c:if test="${param.req == 'detailUpdate' }">
			<jsp:include page = "../member/detailUpdate.jsp"/>
		</c:if>
		
		<c:if test="${param.req == 'list' }">
			<jsp:include page = "../codeMng/codeList.jsp"/>
		</c:if>
		
		<c:if test="${param.req == 'itemList' }">
			<jsp:include page="../item/itemList.jsp"/>
		</c:if>
	</div>

	<div class=footer>
		20190221
	</div>
</body>
</html>