<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/common/modalAlert.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.hidden-col { display: none; }
</style>

<script type="text/javascript">

var groupId = null;

$(document).ready(function(){
	
	$("#groupCodeList tr").click(function(){
		
		groupId = $(this).data('id');
		
		/* 상세코드 리스트 */
		getCodeList();
		
	});

	
	/* 추가 버튼 */
	$("#addGroupRow").on('click', function() {
		var addTbRow =	'<tr>'+
				        	'<td class="active hidden-col"></td>'+
				        	'<td class="active col-md-2"><input type="text" class="form-control" name="groupCode"></td>'+
					        '<td class="active col-md-2"><input type="text" class="form-control" name="groupCodeName"></td>'+
					        '<td class="active col-md-3"><input type="text" class="form-control" name="description"></td>'+
					        '<td class="active col-md-1"><select class="form-control " name="useYn"><option value="y">사용</option><option value="n">미사용</option></select></td>'+
					        '<td class="active col-md-1">ㅡ</td>'+
					        '<td class="active col-md-1"><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#staticBackdrop" name="save">저장</button><button class="btn btn-sm btn-warning" name="delRow">취소</button></td>'+
				        '</tr>';
        
		var trHtml = $( ".trAdd:last" ); //last를 사용하여 trAdd라는 명을 가진 마지막 태그 호출
		
		trHtml.after(addTbRow); //마지막 trAdd명 뒤에 붙인다.
	});
	
	/* 취소 버튼 */
	$(document).on("click", "button[name=delRow]", function(){
		var trHtml = $(this).parent().parent();
		trHtml.remove(); //tr 테그 삭제
	});
	
	/* 저장 버튼 */
	$(document).on("click", 'button[name=save]', function(e) {
		e.preventDefault();
		groupCodeWrite();
	});
	
});

<%-- 새 그룹코드 등록 --%>
function groupCodeWrite() {
	$.ajax({
		type: "POST",
		url: "/rest/code/group/write",
		data: JSON.stringify({
			"groupCode" 	: $("input[name=groupCode]").val(),
			"groupCodeName" : $("input[name=groupCodeName]").val(),
			"description" 	: $("input[name=description]").val(),
			"useYn" 		: $("select[name=useYn]").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			//alert("그룹코드 등록 완료 ^^");
		}
	});
}
<%--// 새 그룹코드 등록 --%>

<%-- 상세코드 리스트 조회 --%>
function getCodeList() {
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
		var useYn;
		if (item.useYn == 'y') {
			useYn = "사용";
		} else {
			useYn = "미사용";
		}
		html.push('<tr>');
		html.push(	'<td>'+item.groupCode+'</td>');
		html.push(	'<td>'+item.detailCode+'</td>');
		html.push(	'<td>'+item.detailCodeName+'</td>');
		html.push(	'<td>'+item.description+'</td>');
		html.push(	'<td>'+useYn+'</td>');
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
	<br>
	
	
	<h3 class="float-left">groupCode list</h3>
	<p class="float-right">
		<button type="button" class="btn btn-primary" id="addGroupRow"> 추가 </button>
	</p>
	
	<table id="groupCodeList" class="table table-sm text-center table-bordered table-hover">
		<thead>
			<tr>
				<th scope="col" class="hidden-col">id</th>
				<th scope="col" class="col-md-2">그룹코드</th>
				<th scope="col" class="col-md-2">그룹코드명</th>
				<th scope="col" class="col-md-3">설명</th>
				<th scope="col" class="col-md-1">사용여부</th>
				<th scope="col" class="col-md-1">등록일</th>
				<th scope="col" class="col-md-1">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${groupList}" var="list">
				<c:set var="regDate" value="${list.regDate}"/>
				<c:set var="useYn" value="${list.useYn}"/>
				<tr class="trAdd" data-id="${list.id}">
					<td class="hidden-col">${list.id}</td>
					<td>${list.groupCode}</td>
					<td>${list.groupCodeName}</td>
					<td>${list.description}</td>
					<td>
						<c:choose>
							<c:when test="${useYn eq 'y'}">사용</c:when>
							<c:when test="${useYn eq 'n'}">미사용</c:when>
						</c:choose>
					</td>
					<td>${fn:split(regDate, ' ')[0]}</td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<h3 class="float-left">detailCode list</h3>
	<p class="float-right">
		<!-- <button type="button" class="btn btn-primary" id="addDetailRow"> 추가 </button> -->
	</p>
	
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