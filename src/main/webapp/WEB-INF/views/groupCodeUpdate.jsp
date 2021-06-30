<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	
	/* 목록 버튼 */
	$("#list").on('click', function() {
		window.location.href = "/web/code/group/list";
	});
	
});
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">공통코드 관리</h1>
	<h3>groupCode update</h3>
	
	<br>
	
	<table class="table table-sm">
		<thead>
			<tr>
				<th scope="col">그룹코드</th>
				<th scope="col">그룹코드명</th>
				<th scope="col">설명</th>
				<th scope="col">사용여부</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<br>
	
	<p class="row justify-content-center">
		<button type="button" class="btn btn-sm btn-primary" id="list">목록</button> &nbsp; 
		<button type="button" class="btn btn-sm btn-primary" id="update_btn">수정</button>
	</p>
	
</div>	
</body>
</html>