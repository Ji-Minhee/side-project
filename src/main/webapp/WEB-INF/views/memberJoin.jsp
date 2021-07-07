<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/common/modalAlert.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	/* 회원 등록 */
	$(document).on('click', '#upload_btn', function(e) {
		e.preventDefault();
		
		/* validation check */
		var userId 		= $("#mbUserId").val();
		var password 	= $("#mbPw").val();
		var name 		= $("#mbName").val();
		var cellphone 	= $("#mbCellphone").val();
		var email 		= $("#mbEmail").val();
		var birth 		= $("#mbBirth").val();
		$(".error-text").hide();
		if (!userId) 	{$(".text1").show();$("#mbUserId").focus();return;}
		if (!password) 	{$(".text2").show();$("#mbPw").focus();return;}
		if (!name) 		{$(".text3").show();$("#mbName").focus();return;}
		if (!cellphone) {$(".text4").show();$("#mbCellphone").focus();return;}
		if (!email) 	{$(".text5").show();$("#mbEmail").focus();return;}
		if (!birth) 	{$(".text6").show();$("#mbBirth").focus();return;}
		
		memberJoin();
	});
	
	/* 목록 버튼 */
	$("#list").on('click', function() {
		window.location.href = "/web/member/list";
	});
	
});

<%-- 회원 등록 --%>
function memberJoin() {
	$.ajax({
		type: "POST",
		url: "/rest/member/join",
		data: JSON.stringify({
			"mbUserId" 		: $("#mbUserId").val(),
			"mbPw" 			: $("#mbPw").val(),
			"mbName" 		: $("#mbName").val(),
			"mbCellphone" 	: $("#mbCellphone").val(),
			"mbEmail" 		: $("#mbEmail").val(),
			"mbBirth" 		: $("#mbBirth").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			alert("등록 완료 ^^");
		}
	});
}
<%--// 회원 등록 --%>
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">회원 관리</h1>
	<h3>member join</h3>
	
	<br>
	
	<table class="table " style="width: 600px; margin-left: auto; margin-right: auto;">
		<tr>
			<th class="text-center col-md-3">ID</th>
			<td class="col-xs-4">
				<input type="text" class="form-control" id="mbUserId">
				<i class="bi bi-exclamation-circle error-text text1" style="color: red; display: none;"> ID를 입력하세요</i>
			</td>
		</tr>
		<tr>
			<th class="text-center">비밀번호</th>
			<td class="col-xs-4">
				<input type="password" class="form-control" id="mbPw">
				<i class="bi bi-exclamation-circle error-text text2" style="color: red; display: none;"> 비밀번호를 입력하세요</i>
			</td>
		</tr>
		<tr>
			<th class="text-center">이름</th>
			<td class="col-xs-4">
				<input type="text" class="form-control" id="mbName">
				<i class="bi bi-exclamation-circle error-text text3" style="color: red; display: none;"> 이름을 입력하세요</i>
			</td>
		</tr>
		<tr>
			<th class="text-center">휴대폰번호</th>
			<td class="col-xs-4">
				<input type="text" class="form-control" id="mbCellphone">
				<i class="bi bi-exclamation-circle error-text text4" style="color: red; display: none;"> 휴대폰번호를 입력하세요</i>
			</td>
		</tr>
		<tr>
			<th class="text-center">이메일</th>
			<td class="col-xs-4">
				<input type="text" class="form-control" id="mbEmail">
				<i class="bi bi-exclamation-circle error-text text5" style="color: red; display: none;"> 이메일을 입력하세요</i>
			</td>
		</tr>
		<tr>
			<th class="text-center">생년월일</th>
			<td class="col-xs-4">
				<input type="text" class="form-control" id="mbBirth">
				<i class="bi bi-exclamation-circle error-text text6" style="color: red; display: none;"> 생년월일 입력하세요</i>
			</td>
		</tr>
	</table>
	
	<br>
	<p class="row justify-content-center">
		<button type="button" class="btn btn-primary" id="list">목록</button> &nbsp; 
		<button type="button" class="btn btn-primary" id="upload_btn">저장</button>
	</p>
	
</div>
</body>
</html>