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
	
	/* 게시물 전체 리스트 */
	getPostList();
	
	
	/* 제목 클릭시 >> 게시글 상세보기 화면 이동 */
	$(document).on('click', '#listAll .title a', function(e){
		e.preventDefault();
		var id = $(this).data('pno');
			location.href = "/web/detail/" + id;
	});
	
	/* 등록 버튼 */
	$("#write").on('click', function() {
		window.location.href = "/web/create";
	});
	
});

<%-- 게시물 전체 리스트 조회 --%>
function getPostList() {
	$.ajax({
		type: "GET",
		url: "/rest/post/list",
		success: function(data) {
			console.log(data);
			if(data.statusCode == 9999) {
			} else {
				showPostList(data);
			}
		}
	});
}

function showPostList(data) {
	
	$("#listAll").html("");
	
	<%-- 리스트출력 (게시글 없을 때) --%>
	if(data.postList.length == 0) {
		var html = '<tr><td colspan="5"><div class="no-data"><p>조회내역이 없습니다.</p></div></td></tr>';
		$("#listAll").append(html);
	}
	
	<%-- 리스트출력 (게시글 있을 때) --%>
	var html = [];
	for (n in data.postList) {
		var item = data.postList[n];
		
		html.push('<tr>');
		html.push(	'<td class="no">'+item.pno+'</td>');
		html.push(	'<td class="title"><a href="#" data-pno="' + (item.pno||"") + '"</a>'+item.title+'</td>');
		html.push(	'<td class="writer">'+item.writer+'</td>');
		html.push(	'<td class="view_count">'+item.viewCount+'</td>');
		html.push(	'<td class="date">'+item.regDate.split(' ')[0]+'</td>');
		html.push('</tr>');
	}
	$("#listAll").append(html.join(''));
	
}
<%--// 게시물 전체 리스트 조회 --%>




</script>
</head>
<body>

<h1>게시판</h1>

<h3>total list</h3>

<div class="">
	<a href="javascript:void(0);" class="" id="write">등록</a>
</div>
<table>
	<thead>
		<tr>
			<th>No</th><th>title</th><th>writer</th><th>view_count</th><th>date</th>
		</tr>
	</thead>
	<tbody id="listAll">
	</tbody>
</table>

</body>
</html>