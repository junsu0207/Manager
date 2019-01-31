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
				location.href="/Manager/member/detail?"+${id};
			}else{
				location.href="/Manager/member/signUpFrom";
			}
		}
	</script>
</body>
