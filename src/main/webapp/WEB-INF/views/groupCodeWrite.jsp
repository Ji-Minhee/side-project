<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	/* 글 등록 실행 */
	$(document).on('click', '#upload_btn', function(e) {
		e.preventDefault();
		groupCodeWrite();
	});
	
	/* 목록 버튼 */
	$("#list").on('click', function() {
		window.location.href = "/web/code/group/list";
	});
	
});

<%-- 새 그룹코드 등록 --%>
function groupCodeWrite() {
	$.ajax({
		type: "POST",
		url: "/rest/code/write",
		data: JSON.stringify({
			"groupCode" 	: $("#groupCode").val(),
			"groupCodeName" : $("#groupCodeName").val(),
			"description" 	: $("#description").val(),
			"useYn" 		: $("#useYn").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			alert("그룹코드 등록 완료 ^^");
		}
	});
}
<%--// 새 그룹코드 등록 --%>
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">공통코드 관리</h1>
	<h3>groupCode create</h3>
	
	<br>
	
	<table class="table table-sm">
		<tr>
			<th scope="col">그룹코드</th>
			<td><input type="text" id="groupCode"></td>
		</tr>
		<tr>
			<th scope="col">그룹코드명</th>
			<td><input type="text" id="groupCodeName"></td>
		</tr>
		<tr>
			<th scope="col">설명</th>
			<td><input type="text" id="description"></td>
		</tr>
		<tr>
			<th scope="col">사용여부</th>
			<td><input type="text" id="useYn"></td>
		</tr>
	</table>
	<br>
	
	<p class="row justify-content-center">
		<button type="button" class="btn btn-sm btn-primary" id="list">목록</button> &nbsp; 
		<button type="button" class="btn btn-sm btn-primary" id="upload_btn">등록</button>
	</p>
	
</div>	
</body>
</html>