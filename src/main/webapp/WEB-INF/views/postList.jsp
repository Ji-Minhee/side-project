<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	
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
		<button type="button" class="btn btn-primary" id="write">등록</button>
	</p>
	
	<table class="table table-sm text-center table-hover">
		<thead>
			<tr>
				<th scope="col" class="col-md-1">No</th>
				<th scope="col" class="col-md-4">title</th>
				<th scope="col" class="col-md-2">writer</th>
				<th scope="col" class="col-md-1">view_count</th>
				<th scope="col" class="col-md-2">date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postList}" var="list">
				<c:set var="regDate" value="${list.regDate}"/>
				<tr>
					<td>${list.pno}</td>
					<td><a href="#" data-pno="${list.pno}" id="goDetail">${list.title}</a></td>
					<td>${list.writer}</td>
					<td>${list.viewCount}</td>
					<td>${fn:split(regDate, ' ')[0]}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<!-- pagination -->
	<div id="paginationBox">
		<ul class="pagination justify-content-center">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"> 〈〈 </a></li>
			</c:if>
	
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item ${pagination.page == idx ? 'active' : ''}"><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
	
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"> 〉〉 </a></li>
			</c:if>
		</ul>
	</div>
	<!--// pagination -->

</div>
<!--// Page Content -->

</body>
</html>