<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action="/Manager/member/signUpWrite" method="post" name="signUpForm">
			<table align="center">
				<tr>
					<td>아 이 디 : <input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
					<input type="button" value="중복확인" id="checkId" name="checkId">
				</tr>
				<tr>
					<td>#비밀번호는 5자리 이상 10자리 이하여야 합니다.
				</tr>
				<tr>
					<td>비밀번호 : <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요">
				</tr>
				<tr>
					<td>비밀번호확인 : <input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호를 입력하세요">
				</tr>
				<tr>
					<td>성  명 : <input type="text" name="name" id="name" placeholder="성명을 입력하세요">
				</tr>
				<tr>
					<td align="center"><input type="button" value="Create" onclick="checkWrite()">
				</tr>
			</table>
	</form>
	
	<script type="text/javascript">
		var temp = false;
		$(document).ready(function(){
			$("#checkId").unbind("click").click(function(e){
				e.preventDefault();
				userIdCheck();
			});
			
		});
		function userIdCheck(){
			var id = $("#id").val();
			var userData = {"ID":id}
			if(id.length < 1){
				alert("아이디 입력!");
			}else{
				{
					$.ajax({
						type : "POST",
						url : "/Manager/member/checkId",
						data : userData,
						dataType : "json",
						error : function(error){
							alert("서버가 응답하지 않음.\n다시 시도");
						},
						success : function(result){
						 	if(result == false){
								alert("사용가능");
								temp = true;
							}else if(result == true){
								alert("사용안됨");
							}else{
								alert("에러발생");
							}
						}
					});
				}
			}
		}
		
		
		function checkWrite(){
			var pwdCk1 = $("#password").val();
			var pwdCk2 = $("#passwordCheck").val();
			if(document.signUpForm.id.value == ""){
				alert("id입력!");
				$("#id").focus();
				return false;
			}else if(document.signUpForm.password.value == ""){
				alert("password입력!");
				$("#password").focus();
				return false;
			}else if(document.signUpForm.passwordCheck.value == ""){
				alert("password확인입력!");
				$("#passwordCheck").focus();
				return false;
			}else if(document.signUpForm.name.value == ""){
				alert("성함입력!");
				$("#name").focus();
				return false;
			}else if(pwdCk1 != pwdCk2){
				alert("비밀번호가 같지 않음");
				document.signUpForm.password.focus();
				$("#password").focus();
				return false;
			}else if(pwdCk1.length < 5 || pwdCk1.length > 10){
				alert("비밀번호 길이 확인");
				$("#password").focus();
				return false;
			}else if(!temp){
				alert("아이디 중복체크");
				return false;
			}else{
				document.signUpForm.submit();
			}
			
		}
		
	</script>
</body>
</html>