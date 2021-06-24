<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var postId = ${pno};
$(document).ready(function(){
	
	/* 게시물 상세 보기 */
	getPostDetail();
	
	/* 글 수정 실행 */
	$(document).on('click', '#update_btn', function(e) {
		e.preventDefault();
		postUpdate();
	});
	
	/* 목록 버튼 */
	$("#list").on('click', function() {
		window.location.href = "/web/list";
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
	console.log(data.postList[0]);
	var item = data.postList[0];
	$("#dtl_no").text(item.pno);
	$("#upd_title").val(item.title);
	$("#dtl_writer").text(item.writer);
	$("#upd_content").val(item.content);
}
<%--// 게시물 상세 조회 --%>

<%-- 게시물 수정 --%>
function postUpdate() {
	$.ajax({
		type: "POST",
		url: "/rest/post/update/" + postId,
		data: JSON.stringify({
			"title" : $("#upd_title").val(),
			"content" : $("#upd_content").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			alert("글 수정 완료 ^^");
		}
	});
}
<%--// 게시물 수정 --%>
</script>
</head>
<body>

<h1>게시판</h1>

<h3>post update</h3>

<table>
	<tr>
		<th>No</th>
		<td id="dtl_no"></td>
	</tr>
	<tr>
		<th>title</th>
		<td><input type="text" id="upd_title" name="title"></td>
	</tr>
	<tr>
		<th>writer</th>
		<td id="dtl_writer"></td>
	</tr>
	<tr>
		<th>content</th>
		<td><input type="text" id="upd_content" name="content"></td>
	</tr>
</table>

<div class="">
	<a href="javascript:void(0);" class="" id="list">목록</a>
	<a href="javascript:void(0);" class="" id="update_btn">수정</a>
</div>

</body>
</html>