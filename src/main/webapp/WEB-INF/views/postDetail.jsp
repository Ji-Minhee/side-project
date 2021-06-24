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
	console.log(data.postList[0]);
	var item = data.postList[0];
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

<h1>게시판</h1>

<h3>post detail</h3>

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

<div class="">
	<a href="javascript:void(0);" class="" id="list">목록</a>
	<a href="javascript:void(0);" class="" id="update">수정</a>
</div>

</body>
</html>