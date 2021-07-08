<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/common/modalAlert.jsp" %>
<%@ include file="/WEB-INF/views/memberPopup.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.hidden-col { display: none; }
</style>
<script type="text/javascript">
var id = null;
$(document).ready(function(){
	
	
	/* 등록 버튼 */
	$("#write").on('click', function() {
		window.location.href = "/web/member/join";
	});
	
	/* 회원테이블 row 클릭 시 */
	$("#memberList tr").click(function(){
		id = $(this).data('id');
		
		/* 회원 상세 팝업 */
		setPop();
	});
	
});
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">회원 관리</h1>
	<h3>member list</h3>

	<br>
	<p class="float-right">
		<button type="button" class="btn btn-primary" id="write">등록</button>
	</p>
	
	<table id="memberList" class="table table-sm text-center table-bordered table-hover">
		<thead>
			<tr>
				<th scope="col" class="hidden-col">id</th>
				<th scope="col" class="col-md-2">ID</th>
				<th scope="col" class="col-md-2">이름</th>
				<th scope="col" class="col-md-2">핸드폰</th>
				<th scope="col" class="col-md-2">이메일</th>
				<th scope="col" class="col-md-1">나이</th>
				<th scope="col" class="col-md-1">상태</th>
				<th scope="col" class="col-md-2">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList}" var="list">
				<c:set var="regDate" value="${list.regDate}"/>
				<c:set var="active" value="${list.active}"/>
				<c:set var="mbBirth" value="${list.mbBirth}"/>
				<c:set var="birth" value="${fn:substring(mbBirth,0,4)}"/>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
				<tr class="trAdd" data-id="${list.id}" data-popup-open="mpop">
					<td class="hidden-col">${list.id}</td>
					<td>${list.mbUserId}</td>
					<td>${list.mbName}</td>
					<td>${list.mbCellphone}</td>
					<td>${list.mbEmail}</td>
					<td><c:out value="${sysYear-birth+1}"/></td>
					<td>
						<c:choose>
							<c:when test="${active eq 'y'}">활동 중</c:when>
							<c:when test="${active eq 'n'}">정지</c:when>
						</c:choose>
					</td>
					<td>${fn:split(regDate, ' ')[0]}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
</div>
</body>
</html>