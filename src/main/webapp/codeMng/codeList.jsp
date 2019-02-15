<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeMngList</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div>
		<table border="1" align="center">    
			<tr>
				<td>코드번호</td>
				<td>코드레벨</td>
				<td>상위코드</td>
				<td>코드이름</td>
				<td>코드레벨</td>
			</tr>
			<c:forEach var="codeMngDTO" items="${list }">
				<tr>
					<td><a href="#" id="cdno">${codeMngDTO.cdno}</a></td>
					<td>${codeMngDTO.cdlvl}</td>
					<td>${codeMngDTO.upcd}</td>
					<td>${codeMngDTO.cdname}</td>
					<td>${codeMngDTO.useyn}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="dataResult">
		<table border="1" align="center">
			<tr>
				<td style="text-align: center;">코드내용</td>   
			</tr>   
			<tr>
				<td>코드번호 : <input type="text" id="cdno1"></td>
			</tr>
			<tr>
				<td>코드레벨 : <input type="text"></td>
			</tr>
			<tr>
				<td>상위코드 : <input type="text"></td>
			</tr>         
			<tr>
				<td>코드이름 : <input type="text"></td>
			<tr>
				<td>사용여부 : <input type="checkbox" checked="checked" value="Y">사용</td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click","#cdno",function(){
				dataView();
			})
		});
		function dataView(){

			$("dataResult").scrollTop($("#dataResult")[0].scrollHeight);
			alert("test");
		}
	</script>
</body>
</html>