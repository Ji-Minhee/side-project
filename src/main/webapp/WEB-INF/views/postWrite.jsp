<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
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

<h1>게시판</h1>

<h3>post create</h3>

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
		<td><input type="text" id="content"></td>
	</tr>
</table>

<div>
	<a href="javascript:void(0);" class="" id="list">목록</a>
	<a href="javascript:void(0);" class="" id="upload_btn">저장</a>
</div>
			
</body>
</html>