<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/common/modalAlert.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	console.log(data.post);
	var item = data.post;
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
			//alert("글 수정 완료 ^^");
		}
	});
}
<%--// 게시물 수정 --%>
</script>
</head>
<body>


<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">BOARD</h1>
	<h3>post update</h3>
	
	<br>
	
<table class="table table-sm table-bordered">
	<tr>
		<th class="text-center col-md-2">No</th>
		<td id="dtl_no"></td>
	</tr>
	<tr>
		<th class="text-center">title</th>
		<td class="col-xs-4"><input type="text" class="form-control" id="upd_title" name="title"></td>
	</tr>
	<tr>
		<th class="text-center">writer</th>
		<td id="dtl_writer"></td>
	</tr>
	<tr>
		<th class="text-center">content</th>
		<td class="col-xs-4"><textarea class="form-control" id="upd_content" name="content" rows="5"></textarea></td>
	</tr>
</table>

<br>
<p class="row justify-content-center">
	<button type="button" class="btn btn-primary" id="list">목록</button> &nbsp; 
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop" id="update_btn">수정</button>
</p>

</div>
</body>
</html>