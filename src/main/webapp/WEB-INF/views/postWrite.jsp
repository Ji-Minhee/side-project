<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			"title" : $("#title").val(),
			"writer" : $("#writer").val(),
			"content" : $("#content").val()
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
	<h1 class="mt-4">게시판</h1>
	<h3>post create</h3>
	
	<br>
	
<table>
	<tr>
		<th>title</th>
		<td><input type="text" id="title"></td>
	</tr>
	<tr>
		<th>writer</th>
		<td><input type="text" id="writer"></td>
	</tr>
	<tr>
		<th>content</th>
		<td><textarea id="content" name="content" rows="5"></textarea></td>
	</tr>
</table>

<br>
<p class="">
	<button type="button" class="btn btn-sm btn-primary" id="list">목록</button>
	<button type="button" class="btn btn-sm btn-primary" id="upload_btn">저장</button>
</p>


</div>
</body>
</html>