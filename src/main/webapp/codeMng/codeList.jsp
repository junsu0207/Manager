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
					<td><a href="javascript:" class="cdnoBtn" id="cdnoBtn" data="${codeMngDTO.cdno}">${codeMngDTO.cdno}</a></td>
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
				<td>코드번호 : <input type="text" class="resultCdno"></td>
			</tr>
			<tr>
				<td>코드레벨 : <input type="text" class="resultCdlvl"></td>
			</tr>
			<tr>
				<td>상위코드 : <input type="text" class="resultUpcd"></td>
			</tr>         
			<tr>
				<td>코드이름 : <input type="text" class="resultCdname"></td>   
			<tr>
				<td>사용여부 : <input type="checkbox" checked="checked" value="Y" class="resultUseyn">사용</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="button" value="추가">
					<input type="button" value="수정" class="updateBtn">        
					<input type="button" value="저장"></td>     
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click",".updateBtn",function(){
				codeUpdate();
			});
			$(document).on("click",".cdnoBtn",function(){
				var data = $(this).attr("data");
				console.log(data);
				dataView(data);              
			});
		});
	
		function dataView(ckcdno){
			$('html, body').scrollTop( $(document).height());
			/* var ckcdno = $(".cdBtn").text(); */
			var cdnoData = {"cdno":ckcdno};
			alert("cdno  == "+ckcdno);
			$.ajax({
				type : "POST",
				url : "/Manager/codeMng/codeDetail",
				data : cdnoData,
				dataType : "json",
				error : function(error){
					alert("서버가 응답하지 않음. \n다시시도");
				},
				success : function(data){
					console.log(data.result);
					var cdno = "";
					var cdlvl = "";
					var cdname = "";
					var upcd = "";
					$.each(data.result,function(key, value){
						cdno += value.cdno;
						cdlvl += value.cdlvl;
						cdname += value.cdname;
						upcd += value.upcd;
					});
					console.log(cdno);
					console.log(cdlvl);
					console.log(cdname);
					console.log(upcd);
					$(".resultCdno").val(cdno);
					$(".resultCdlvl").val(cdlvl);
					$(".resultCdname").val(cdname);
					$(".resultUpcd").val(upcd);                          
				}
			});
		}
		
		
		
		function codeUpdate(){
			$(".resultCdno").attr('disabled','disabled');
			var cdno = $(".resultCdno").val();
			var cdlvl = $(".resultCdlvl").val();
			var cdname = $(".resultCdname").val();
			var upcd = $(".resultUpcd").val();
			console.log(cdno+"/"+cdlvl+"/"+cdname+"/"+upcd);
		}
	</script>
	
	</body>
</html>