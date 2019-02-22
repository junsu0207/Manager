<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<table id="itemTable" border="1">
		<tr>
			<td colspan="9">    
				카테고리 : <select id="itemCategory" name="category">
							<option>전자제품</option>
							<option>의류</option>		
						</select>
				1차분류 : <select id="item1">
						</select>
				<input type="button" value="조회" id="search" class="search" style="text-align:right;">
			</td>              
		</tr>
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>제조사코드</td>
			<td>제조사명</td>
			<td>단위코드</td>
			<td>단위명</td>
			<td>재고수량</td>
			<td>재고여부</td>
			<td>사용여부</td>
		</tr>
		<tbody></tbody>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", ".search", function(){
				searchItem();
			});
		});
		
		function searchItem(){
			var time = new Date().toLocaleTimeString();
			$('#itemTable > tbody:first').append('<tr><td> test </td></tr>');
		}
	
	</script>
</body>
</html>