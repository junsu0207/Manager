<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="resultTable">
		
	</div>
	<input type="button" value="생성" class="input">
</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", ".input", function(){
				console.log("테이블 생성 합니다.");
				var resultTable = "";
				resultTable += "<table border=1 align='center'>";
				resultTable += "<tr>";
				resultTable += "<td>코드내용</td>";
				resultTable += "</tr>";
				resultTable += "<tr>";
				resultTable += "<td>코드내용 : <input type='text'></td>";
				resultTable += "</tr>";
				resultTable += "<tr>";
				resultTable += "<td>상 품 명 : <input type='text'></td>";
				resultTable += "</tr>";
				resultTable += "<tr>";
				resultTable += "<td>제 조 사 : <select></select>단위명 : <select></select></td>";
				resultTable += "</tr>";
				resultTable += "<tr>";
				resultTable += "<td>사용여부 : <input type='checkbox'></td>";
				resultTable += "</tr>";
				resultTable += "<tr>";
				resultTable += "<td style='text-align: center;'><input type='button' value='추가'>";
				resultTable += "<input type='button' value='수정'>";
				resultTable += "<input type='button' value='저장'></td>";
				resultTable += "</tr>";
				resultTable += "</table>";
				$(".resultTable").append(resultTable);
			
			});
		});
	</script>
</html>