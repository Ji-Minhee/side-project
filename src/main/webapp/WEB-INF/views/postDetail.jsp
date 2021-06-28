<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
var postId = ${pno};
$(document).ready(function(){
	
	/* 게시물 상세 보기 */
	getPostDetail();
	
	/* 목록 버튼 */
	$("#list").on('click', function() {
		window.location.href = "/web/list";
	});
	
	/* 수정 버튼 */
	$("#update").on('click', function() {
		window.location.href = "/web/update/" + postId;
	});
	
});

<%-- 게시물 상세 조회 --%>
function getPostDetail() {
	$.ajax({
		type: "GET",
		url: "/rest/post/detail/" + postId,
		success: function(data) {
			console.log(data);
			if(data.statusCode == 9999) {
			} else {
				showPostDetail(data);
			}
		}
	});
}

function showPostDetail(data) {
	console.log(data.post);
	var item = data.post;
	$("#dtl_no").text(postId);
	$("#dtl_title").text(item.title);
	$("#dtl_writer").text(item.writer);
	$("#dtl_content").text(item.content);
	$("#dtl_regdate").text(item.regDate);
	$("#dtl_updatedate").text(item.updateDate||"--");
}
<%--// 게시물 상세 조회 --%>
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">게시판</h1>
	<h3>post detail</h3>
	
	<br>
	
<table>
	<tr>
		<th colspan = "2">No</th>
		<td colspan = "2" id="dtl_no"></td>
	</tr>
	<tr>
		<th colspan = "2">title</th>
		<td colspan = "2" id="dtl_title"></td>
	</tr>
	<tr>
		<th colspan = "2">writer</th>
		<td colspan = "2" id="dtl_writer"></td>
	</tr>
	<tr>
		<th colspan = "2">content</th>
		<td colspan = "2" id="dtl_content"></td>
	</tr>
	<tr>
		<th>작성일</th><td id="dtl_regdate"></td>
		<th>수정일</th><td id="dtl_updatedate"></td>
	</tr>
</table>

<br>
<p class="">
	<button type="button" class="btn btn-sm btn-primary" id="list">목록</button>
	<button type="button" class="btn btn-sm btn-primary" id="update">수정</button>
</p>

</div>
</body>
</html>