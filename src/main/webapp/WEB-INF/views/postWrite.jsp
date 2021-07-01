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
		postWrite();
	});
	
	/* 목록 버튼 */
	$("#list").on('click', function() {
		window.location.href = "/web/list";
	});
	
});

<%-- 새 글 등록 --%>
function postWrite() {
	$.ajax({
		type: "POST",
		url: "/rest/post/write",
		data: JSON.stringify({
			"title" 	: $("#title").val(),
			"writer" 	: $("#writer").val(),
			"content" 	: $("#content").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			alert("글 등록 완료 ^^");
		}
	});
}
<%--// 새 글 등록 --%>
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">BOARD</h1>
	<h3>post create</h3>
	
	<br>
	
<table class="table table-sm table-bordered">
	<tr>
		<th class="text-center col-md-2">title</th>
		<td class="col-xs-4"><input type="text" class="form-control" id="title"></td>
	</tr>
	<tr>
		<th class="text-center">writer</th>
		<td class="col-xs-4"><input type="text" class="form-control" id="writer"></td>
	</tr>
	<tr>
		<th class="text-center">content</th>
		<td class="col-xs-4"><textarea class="form-control" id="content" name="content" rows="5"></textarea></td>
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