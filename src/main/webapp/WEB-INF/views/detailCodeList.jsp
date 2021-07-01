<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
var groupId = '1';
$(document).ready(function(){
	
	/* 상세코드 리스트 */
	getCodeList();
	
});

<%-- 상세코드 리스트 조회 --%>
function getCodeList() {
	console.log("1");
	$.ajax({
		type: "GET",
		url: "/rest/code/detail/list/" + groupId,
		success: function(data) {
			console.log(data);
			showCodeList(data);
		}
	});
}

function showCodeList(data) {
	
	$("#listAll").html("");
	
	if(data.detailCodeList.length == 0) {
		var html = '<tr><td colspan="6"><div class="no-data"><p>조회내역이 없습니다.</p></div></td></tr>';
		$("#listAll").append(html);
	}
	
	var html = [];
	for (n in data.detailCodeList) {
		var item = data.detailCodeList[n];
		html.push('<tr>');
		html.push(	'<td>'+item.groupCode+'</td>');
		html.push(	'<td><a href="#" data-id="' + (item.id||"") + '"</a>'+item.detailCode+'</td>');
		html.push(	'<td>'+item.detailCodeName+'</td>');
		html.push(	'<td>'+item.description+'</td>');
		html.push(	'<td>'+item.useYn+'</td>');
		html.push(	'<td>'+item.regDate.split(' ')[0]+'</td>');
		html.push('</tr>');
	}
	$("#listAll").append(html.join(''));
	
}
<%--// 상세코드 리스트 조회 --%>
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">공통코드 관리</h1>
	<h3>detailCode list</h3>
	
	<br>
	
	<table class="table table-sm text-center">
		<thead>
			<tr>
				<th scope="col">그룹코드</th>
				<th scope="col">상세코드</th>
				<th scope="col">상세코드명</th>
				<th scope="col">설명</th>
				<th scope="col">사용여부</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody id="listAll">
		</tbody>
	</table>
	<br>
	
	
	
</div>	
</body>
</html>