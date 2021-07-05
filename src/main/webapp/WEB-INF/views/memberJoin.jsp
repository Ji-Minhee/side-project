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
	
	<table class="table text-center" style="width: 600px; margin-left: auto; margin-right: auto;">
		<tr>
			<th class="text-center col-md-3">ID</th>
			<td class="col-xs-4"><input type="text" class="form-control" id="mbUserId"></td>
		</tr>
		<tr>
			<th class="text-center">비밀번호</th>
			<td class="col-xs-4"><input type="password" class="form-control" id="mbPw"></td>
		</tr>
		<tr>
			<th class="text-center">이름</th>
			<td class="col-xs-4"><input type="text" class="form-control" id="mbName"></td>
		</tr>
		<tr>
			<th class="text-center">휴대폰번호</th>
			<td class="col-xs-4"><input type="text" class="form-control" id="mbCellphone"></td>
		</tr>
		<tr>
			<th class="text-center">이메일</th>
			<td class="col-xs-4"><input type="text" class="form-control" id="mbEmail"></td>
		</tr>
		<tr>
			<th class="text-center">생년월일</th>
			<td class="col-xs-4"><input type="text" class="form-control" id="mbBirth"></td>
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