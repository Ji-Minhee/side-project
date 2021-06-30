<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	
	/* 등록 버튼 */
	$("#write").on('click', function() {
		window.location.href = "/web/code/group/create";
	});
	
});
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">공통코드 관리</h1>
	<h3>groupCode list</h3>
	
	<br>
	
	<p class="float-right">
		<button type="button" class="btn btn-sm btn-primary" id="write">등록</button>
	</p>
	
	<table class="table table-sm text-center">
		<thead>
			<tr>
				<th scope="col">그룹코드</th>
				<th scope="col">그룹코드명</th>
				<th scope="col">설명</th>
				<th scope="col">사용여부</th>
				<th scope="col">등록일</th>
				<th scope="col">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${groupList}" var="list">
				<tr>
					<td>${list.groupCode}</td>
					<td>${list.groupCodeName}</td>
					<td>${list.description}</td>
					<td>${list.useYn}</td>
					<td>${list.regDate}</td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	
	
</div>	
</body>
</html>