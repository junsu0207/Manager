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
	<table id="itemTable" border="1" style="padding-bottom:300px;">
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
		<form action="" name="viewForm">
			<input type="hidden" name="useyn" class="useyn" id="useyn">
			<input type="hidden" name="cdno" class="cdno" id="cdno">
		</form>
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
				console.log("index data ==="+data);
				itemDetail(data);
			});
			$(document).on("click", ".updateBtn", function(){
				updateItem();
			});
			$(document).on("click", ".inputBtn", function(){
				inputItem();
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
						$(".cdno").val(result.cdno);
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
							'<td><a href=javascript: id="cdno" class="cdno">'+result.itemcd+'</a></td>'+
							'<td>'+result.itemName+'</td>'+
							'<td>'+result.madenmcd+'</td>'+
							'<td>'+result.madename+'</td>'+
							'<td>'+result.itemunitcd+'</td>'+
							'<td>'+result.unitcdname+'</td>'+
							'<td>'+result.stockamt+'</td>'+
							'<td>'+result.stockyn+'</td>'+
							'<td>'+result.useyn+'</td>'+     
							'</tr>');   
						});
					}
				});
			}
		}
		
		
		function itemDetail(ckcd){
			var itemcd = {"itemcd" : ckcd};
			console.log("전달받은 아이템 코드 == " + ckcd);
			console.log("아이템 코드 키값 전달 == " + itemcd.itemcd);
			$.ajax({
				type : "post",
				url : "/Manager/item/itemView",
				data : itemcd,
				dataType : "json",
				error : function(error){
					console.log("서버 응답 없음");
				},
				success : function(data){
					console.log("상세보기 컨트롤러 접속 성공");
					console.log("useyn === "+ data.result.useyn);
					$(".itemTable").empty();
					var resultTable = "";
					resultTable += "<table border=1 align='center' class='itemTable' style='width : 100%;'>";
					resultTable += "<tr>";
					resultTable += "<td>코드내용</td>";
					resultTable += "</tr>";
					resultTable += "<tr>";
					resultTable += "<td>상품코드 : <input type='text' name='itemcd' class='itemcd' value="+data.result.itemcd+"></td>";
					resultTable += "</tr>";
					resultTable += "<tr>";
					resultTable += "<td>상 품 명 : <input type='text' name='itemName' value="+data.result.itemName+"></td>";
					resultTable += "</tr>";
					resultTable += "<tr>";
					resultTable += "<td>제 조 사 : <select name='madename'class='madename'><option value="+data.result.madenmcd+">"+data.result.madename+"</option></select>";
					resultTable += "단 위 명 : <select name='unitcdname' class='unitcdname'><option value="+data.result.itemunitcd+">"+data.result.unitcdname+"</option></select></td>";
					resultTable += "</tr>";
					resultTable += "<tr>";
					resultTable += "<td>사용여부 : <input type='checkbox' name='useynCheck' id='useynCheck' value="+data.result.useyn+"></td>";
					resultTable += "</tr>";
					resultTable += "<tr>";
					resultTable += "<td style='text-align: center;'>";
					resultTable += "<input type='button' value='추가' class='inputBtn'>";
					resultTable += "<input type='button' value='수정' class='updateBtn'>";
					resultTable += "<input type='button' value='저장' class='submitBtn'></td>";
					resultTable += "</tr>";
					resultTable += "</table>";
					$(".detailResult form").append(resultTable);
					if(data.result.useyn == "Y"){
						$("input:checkbox[name='useynCheck']").prop("checked", true);
					}else{
						$("input:checkbox[name='useynCheck']").prop("checked", false);
					}
				}
			});
		}
		function updateItem(){
			console.log("updateItem test");
			$("input:text[name='itemcd']").attr('disabled','disabled');
			$(".madename option").remove();
			$(".unitcdname option").remove();
			if(!$("#useynCheck").prop("checked")){
				$(".useyn").val('N');
			}else{
				$(".useyn").val('Y');
			}
			console.log("useyn check === " + $(".useyn").val());
			$.ajax({
				type : "post",
				url : "/Manager/item/selectList",
				dataType : "json",
				error : function(error){
					console.log("서버 응답 없음");
				},
				success : function(data){
					console.log("selectList 성공");
					$.each(data.result, function(index, result){          
						$('.madename').append($('<option>',{
							value : result.madenmcd,
							text : result.madename
						}));
						$('.unitcdname').append($('<option>',{
							value : result.itemunitcd,
							text : result.unitcdname    
						}));
					});
				}
			});
			
		}
		
		function inputItem(){
			console.log("inputItem test");
			$(".itemcd").attr("disabled","disabled");
			$(".itemTable").find("input[type='text']").val('');
		}
		
		
	</script>
</body>
</html>