<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<table id="itemTable" border="1">
		<thead>
			<tr>
				<td colspan="9">    
					카테고리 : <select id="itemCategory" name="category">
								<c:forEach var="category" items="${categoryCode }">
									<option value="${category.cdno}">${category.cdname}</option>	
								</c:forEach>
							</select>
					1차 분류 : <select id="firstCategory">
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
		</thead>
		<tbody id="resultTable"></tbody>
	</table>
	<div class="detailResult">
		<table>
			
		</table>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", ".search", function(){
				searchItem();
			});
			$(document).on("change", "#itemCategory", function(){
				searchCategory();
			});
			$(document).on("click", "#cdno", function(){
				var index = $(".cdno").index(this);
				var data = $("a:eq("+index+")").html();
				console.log(index);
				itemDetail(data);
			});
		});
		
		function searchCategory(){
			console.log($("#itemCategory option:selected").val());
			var temp = $("#itemCategory option:selected").val();
			var categoryData = {"code" : temp};
			$.ajax({
				type : "post",
				url : "/Manager/item/firstCategory",
				dataType : "json",
				data : categoryData,
				error : function(error){
					console.log("서버응답없음");
				},
				success : function(data){
					console.log(data.result);
					$("#firstCategory").empty();
					$.each(data.result, function(index, result){
						$("#firstCategory").append("<option value="+result.cdno+">"+result.cdname+"</option>");
					});
				}
			});
			
			
		}
		function searchItem(){
			if($("#firstCategory option:selected").val() == null){
				alert("카테고리선택");
			}else{
				console.log($("#itemCategory option:selected").val());
				console.log($("#firstCategory option:selected").val());
				var itemcd = $("#firstCategory option:selected").val();
				console.log("itemcd === " + itemcd);
				var itemclscd = {"itemclscd" : itemcd};
				$.ajax({
					type : "post",
					url : "/Manager/item/viewList",
					dataType : "json",
					data : itemclscd,
					error : function(error){
						console.log("서버 응답 없음");
					},
					success : function(data){
						console.log("list 접근 성공 test");                              
						console.log(data.result);
						$("#itemTable > tbody > tr").empty(); 
						$.each(data.result, function(index, result){          
							$('#itemTable > tbody').append    
							('<tr>'+
							'<td><a href=javascript: id="cdno" class="cdno"> '+result.itemcd+' </a></td>'+
							'<td> '+result.itemName+' </td>'+
							'<td> '+result.madenmcd+' </td>'+
							'<td> '+result.madename+' </td>'+
							'<td> '+result.itemunitcd+' </td>'+
							'<td> '+result.unitcdname+' </td>'+
							'<td> '+result.stockamt+' </td>'+
							'<td> '+result.stockyn+' </td>'+
							'<td> '+result.useyn+' </td>'+     
							'</tr>');   
						});
						                    
					}
				});
				
			}
			 
		}
		
		function itemDetail(ckcd){
			var itemcd = {"itemcd" : ckcd};
			console.log("전달받은 아이템 코드 == " + ckcd);
			$.ajax({
				type : "post",
				url : "/Manager/item/detailList",
				data : itemcd,
				dataType : "json",
				error : function(error){
					console.log("서버 응답 없음");
				},
				success : function(data){
					console.log("상세보기 컨트롤러 접속 성공");
					console.log(data);
					
				/* 	$("#itemTable > tbody > tr").empty(); 
					$.each(data.result, function(index, result){          
						$('#itemTable > tbody').append    
						('<tr>'+
						'<td><a href=javascript: id="cdno" class="cdno"> '+result.itemcd+' </a></td>'+
						'<td> '+result.itemName+' </td>'+
						'<td> '+result.madenmcd+' </td>'+
						'<td> '+result.madename+' </td>'+
						'<td> '+result.itemunitcd+' </td>'+
						'<td> '+result.unitcdname+' </td>'+
						'<td> '+result.stockamt+' </td>'+
						'<td> '+result.stockyn+' </td>'+
						'<td> '+result.useyn+' </td>'+     
						'</tr>');   
					}); */
				}
				
			});
		}
	</script>
</body>
</html>