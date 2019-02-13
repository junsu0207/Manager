<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		window.onload=function(){
			if(${result} >  0){
				alert("가입성공 상세화면이동");
				location.href="/Manager/member/detail?id=${id}";
			}else{
				alert("가입실패");
				location.href="/Manager/member/signUpFrom";
			}
		}
	</script>
</body>
