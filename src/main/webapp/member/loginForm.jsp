<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
</head>
<body>
	<form action="/Manager/member/write" method="post" name="writeForm">
			<table align="center">
				<tr>
					<td>아 이 디 : <input type="text" name="id" id="id" placeholder="아이디를입력하세요">
				</tr>
				<tr>
					<td>비밀번호 : <input type="password" name="password" id="password" placeholder="비밀번호를입력하세요">
				</tr>
				<tr>
					<td colspan="1" align="center"><input type="button" value="Login" onclick="checkWrite()">
					<input type="button" value="Sign Up" onclick="location.href='/Manager/member/signUpForm'">
				</tr>
			</table>
	</form>
	
	<script type="text/javascript">
		function checkWrite(){
			if(document.writeForm.id.value == ""){
				alert("id입력!");
				document.writeForm.id.focus();
			}else if(document.writeForm.password.value == ""){
				alert("password입력!");
				document.writeForm.password.focus();
			}else{
				document.writeForm.submit();
			}
		}
	</script>
</body>
</html>