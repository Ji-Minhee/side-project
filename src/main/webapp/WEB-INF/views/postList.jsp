<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	/* 게시물 전체 리스트 */
	//getPostList();
	
	/* 제목 클릭시 >> 게시글 상세보기 화면 이동 */
	$(document).on('click', '#goDetail', function(e){
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
<%-- function getPostList(page) {
	var url = "/rest/post/list";
	if(page) url += "?page=" + page;
	$.ajax({
		type: "GET",
		url: url,
		success: function(data) {
			console.log(data);
			showPostList(data);
		}
	});
}

function showPostList(data) {
	
	$("#listAll").html("");
	
	리스트출력 (게시글 없을 때)
	if(data.postList.length == 0) {
		var html = '<tr><td colspan="5"><div class="no-data"><p>조회내역이 없습니다.</p></div></td></tr>';
		$("#listAll").append(html);
	}
	
	리스트출력 (게시글 있을 때)
	var html = [];
	for (n in data.postList) {
		var item = data.postList[n];
		html.push('<tr>');
		html.push(	'<td class="no" scope="row">'+item.pno+'</td>');
		html.push(	'<td class="title"><a href="#" data-pno="' + (item.pno||"") + '"</a>'+item.title+'</td>');
		html.push(	'<td class="writer">'+item.writer+'</td>');
		html.push(	'<td class="view_count">'+item.viewCount+'</td>');
		html.push(	'<td class="date">'+item.regDate.split(' ')[0]+'</td>');
		html.push('</tr>');
	}
	$("#listAll").append(html.join(''));
	
} --%>
<%--// 게시물 전체 리스트 조회 --%>


<%-- paging event --%>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "/web/list";
	url += "?page=" + page;
	url += "&range=" + range;
	location.href = url;
	//getPostList(page, range);
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var page = page
	var range = range
	var url = "/web/list";
	url += "?page=" + page;
	url += "&range=" + range;
	location.href = url;
	//getPostList(page, range, rangeSize);
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "/web/list";
	url += "?page=" + page;
	url += "&range=" + range;
	location.href = url;
	//getPostList(page, range, rangeSize);
}
<%--// paging event --%>

</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">BOARD</h1>
	<h3>total list</h3>

	<br>
	<p class="float-right">
		<button type="button" class="btn btn-sm btn-primary" id="write">등록</button>
	</p>
	
	<table class="table table-sm text-center table-bordered">
		<thead>
			<tr>
				<th scope="col" class="col-md-1">No</th>
				<th scope="col" class="col-md-4">title</th>
				<th scope="col" class="col-md-2">writer</th>
				<th scope="col" class="col-md-1">view_count</th>
				<th scope="col" class="col-md-3">date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postList}" var="list">
				<tr>
					<td>${list.pno}</td>
					<td><a href="#" data-pno="${list.pno}" id="goDetail">${list.title}</a></td>
					<td>${list.writer}</td>
					<td>${list.viewCount}</td>
					<td>${list.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<!-- pagination -->
	<div id="paginationBox">
		<ul class="pagination justify-content-center">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"> << </a></li>
			</c:if>
	
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item ${pagination.page == idx ? 'active' : ''}"><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
	
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"> >> </a></li>
			</c:if>
		</ul>
	</div>
	<!--// pagination -->

</div>
<!--// Page Content -->

</body>
</html>