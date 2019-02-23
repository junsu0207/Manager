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
							<option>========</option>
							<option value="C0001">전자제품</option>
							<option value="C0002">의류</option>		
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
		<tbody> </tbody>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", ".search", function(){
				searchItem();
			});
			$(document).on("click", "#itemCategory", function(){
				searchCategory();
			});
			$(document).on("click", "#cdno", function(){
				itemDetail();
			});
		});
		
		function searchCategory(){
			console.log($("#itemCategory option:selected").val());
			var temp = $("#itemCategory option:selected").val();
			if(temp == "C0001"){
				$("#item1").append("<option value='1'>notebook</option>");
			}else{
				$("#item1").append("<option value='2'>coat</option>");
			}
			
		}
		function searchItem(){
			var time = new Date().toLocaleTimeString();
			console.log(time);
			$('#itemTable > tbody:first').append    
			('<tr>'+
			'<td><a href=javascript: id=cdno class=cdno> test1 </a></td>'+
			'<td> test2 </td>'+
			'<td> test3 </td>'+
			'<td> test4 </td>'+
			'<td> test5 </td>'+
			'<td> test6 </td>'+
			'<td> test7 </td>'+
			'<td> test8 </td>'+
			'<td> test9 </td>'+
			'</tr>');         
		}
		function itemDetail(){
			var index = $("#cdno").index(this);
			var data = $("a:eq("+index+")").html();
			console.log(index);
		}
	</script>
</body>
</html>