<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeMngList</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
					<td><a href="javascript:" class="cdnoBtn" id="cdnoBtn_${codeMngDTO.cdno }">${codeMngDTO.cdno}</a></td>
					<td>${codeMngDTO.cdlvl}</td>
					<td>${codeMngDTO.upcd}</td>
					<td>${codeMngDTO.cdname}</td>
					<td>${codeMngDTO.useyn}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="dataResult">
		<form action="" method="post" name="codeMngWrite" id="codeMngWrite">
			<table id="codeTable" border="1" align="center">
				<tr>
					<td style="text-align: center;">코드내용</td>
				</tr>
				<tr>
					<td>코드번호 : <input type="text" class="resultCdno" id="resultCdno" name="cdno"></td>
				</tr>
				<tr>
					<td>코드레벨 : <input type="text" class="resultCdlvl" id="resultCdlvl" name="cdlvl"></td>
				</tr>
				<tr>
					<td>상위코드 : <input type="text" class="resultUpcd" id="resultUpcd" name="upcd"></td>
				</tr>
				<tr>
					<td>코드이름 : <input type="text" class="resultCdname" id="resultCdname" name="cdname"></td>
				<tr>
					<td>사용여부 : <input type="checkbox" checked="checked"
						class="resultUseyn" id="resultUseyn" name="resultUseyn">사용
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
					<input type="button" value="추가" class="inputBtn"> 
					<input type="button" value="수정" class="updateBtn">
					<input type="button" value="저장" class="submitBtn">
					</td>
				</tr>
			</table>
			<input type="hidden" name="insuser" value="${sessionScope.memberName }">
			<input type="hidden" id="hTemp" name="useyn">
		</form>
	</div>
	
	<script type="text/javascript">
		
		var bool;
		$(document).ready(function(){
			$(document).on("click",".updateBtn",function(){
				codeUpdate();
			});
			$(document).on("click",".cdnoBtn",function(){
				
				$('html, body').scrollTop( $(document).height());
				/* var code = $(this).attr("id");
				var code2 = code.lastIndexOf("_");
				var codeReal = code.substring(code2+1); */
				var index = $(".cdnoBtn").index(this);
				console.log("index === " + index);
				var data = $("a:eq("+index+")").html();
				console.log(data);       
				dataView(data);              
			});
			$(document).on("click",".inputBtn",function(){ 
				codeInput();            
			});
			$(document).on("click",".submitBtn",function(){
				console.log($('#resultUseyn').val());
				saveData();
			});
		});
		
		function dataView(ckcdno){
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
		
		function codeInput(){
			bool = true;
			console.log("추가버튼!");
			//$(".resultCdno").text("코드자동생성");
			$(".resultCdno").attr('disabled','disabled');    
			$("#codeTable").find("input[type='text']").val('');
			/*$('.resultCdno').val('');
			$('.resultCdlvl').val('');
			$('.resultCdname').val('');
			$('.resultUpcd').val(''); */
		}
		
		function codeUpdate(){
			bool = false;
			var cdno = $(".resultCdno").val();
			var cdlvl = $(".resultCdlvl").val();
			var cdname = $(".resultCdname").val();
			var upcd = $(".resultUpcd").val();
			var useyn = $(".resultUseyn").val();
			console.log(cdno+"/"+cdlvl+"/"+cdname+"/"+upcd+"/"+useyn);
			if(cdno == ""){
				alert("수정할 코드 선택!");
			}else{
				$(".resultCdno").attr('disabled','disabled');    
			}
		}
		
		function saveData(){
			if(!$('[name=resultUseyn]').prop('checked')){
				$('#hTemp').val('N');
			}else{
				$('#hTemp').val('Y');
			}
			var form = "";
			console.log(bool);
			if(bool == false){
				$(".resultCdno").attr('disabled',false);
				form = $("#codeMngWrite").serialize();
				console.log("updateForm == "+form);
				$.ajax({
					type : "POST",
					url : "/Manager/codeMng/codeUpdate",
					dataType : "json",
					data : form,
					error : function(error){
						console.log("서버 응답 없음");
						alert("db접근실패");
					},
					success : function(data){
						alert(data.msg);
						console.log(data.result);
						location.reload();
					}
				});
			}else if(bool == true){
				form = $("#codeMngWrite").serialize(); 
				console.log("inputFrom === " +form);
				$.ajax({
					type : "post",
					url : "/Manager/codeMng/codeInput",
					dataType : "json",
					data : form,
					error : function(error){
						console.log("서버 응답 없음");
						alert("db접근실패");
					},
					success : function(data){
						alert(data.msg);
						console.log(data.result);
						location.reload();
					}
				});
			}else{
				alert("추가, 수정 선택 후 저장");
			}
		}
	</script>
	
	</body>
</html>