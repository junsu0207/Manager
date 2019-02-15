<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입상세</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action="/Manager/member/detailWrite" method="post" name="detailForm">
		<c:forEach var="memberDetailDTO" items="${list }">
			<input type="hidden" name="id" id="id" value="${id }">
			<table align="center">
				<tr>
					<td colspan="2" align="center"> 상세정보
				</tr>
				<tr>
					<td> 성명 : 
					<td><input type="text" name="delivName" id="delivName" value="${memberDetailDTO.delivName}">
				</tr>
				<tr>
					<td> 관계 :
					<td><select id="relation" name="relation" style="width:100%;" >
						<option value="C0021">본인</option>
						<option value="C0022">부모님</option>
						<option value="C0023">동생</option>
						<option value="C0024">지인</option>
					</select>
				</tr>
				<tr>
					<td> 우편번호 : 
					<td><input type="text" name="zipCode" id="zipCode" value="${memberDetailDTO.addrcd}">
				</tr>
				<tr>
					<td> 주소 :	
					<td><input type="text" name="address" id="address" value="${memberDetailDTO.addrname}">
				</tr>
				<tr>
					<td> 휴대전화번호 : 
					<td><input type="text" name="phone" id="phone" value="${memberDetailDTO.mobileTelNo}">
				</tr>
				<tr>
					<td> 집전화번호 :	
					<td><input type="text" name="homeTel" id="homeTel" value="${memberDetailDTO.homeTelNo}">
				</tr>
				<tr>
					<td> 사용여부 : 
					<td><input type="checkbox" id="useyn" name="useyn" checked="checked" value="Y">
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="update" onclick="checkWrite()">
													<input type="button" value="cancel" onclick="location.href='/Manager/main/index'">
				</tr>
			</table>
		</c:forEach>
	</form>
	
	<script type="text/javascript">
	alert(${id}});
		function checkWrite(){
			var phone = $("#phone").val();
			var homeTel = $("#homeTel").val();
			if(document.detailForm.delivName.value == ""){
				alert("이름입력!");
				$("#delivName").focus();
			}else if(document.detailForm.zipCode.value == ""){
				alert("우편번호입력!");
				$("#zipCode").focus();
			}else if(document.detailForm.address.value == ""){
				alert("주소입력!");
				$("#address").focus();
			}else if(document.detailForm.phone.value == "" && document.detailForm.homeTel.value == ""){
				alert("폰,집전화 둘중하나 입력");
			}else{
				document.detailForm.submit();
			}
		}
	</script>
</body>
</html>