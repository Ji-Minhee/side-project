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
var groupCode = null;
var detailId = null;

$(document).ready(function(){
	
	/* 그룹코드 row 클릭 시 */
	$("#groupCodeList tr").click(function(){
		
		groupId = $(this).data('id');
		groupCode = $(this).data('code');
		
		/* 상세코드 리스트 */
		getCodeList();
		
	});
	
	
	/* 그룹코드 추가 버튼 */
	$("#addGroupRow").on('click', function() {
		var addTbRow =	'<tr>'+
				        	'<td class="active hidden-col"></td>'+
				        	'<td class="active col-md-2"><input type="text" class="form-control" name="groupCode" id="groupCodeDefault"></td>'+
					        '<td class="active col-md-2"><input type="text" class="form-control" name="groupCodeName"></td>'+
					        '<td class="active col-md-3"><input type="text" class="form-control" name="description"></td>'+
					        '<td class="active col-md-1"><select class="form-control" name="useYn"><option value="y">사용</option><option value="n">미사용</option></select></td>'+
					        '<td class="active col-md-1">ㅡ</td>'+
					        '<td class="active col-md-1"><button class="btn btn-sm btn-primary" name="saveGroup">저장</button><button class="btn btn-sm btn-secondary" name="delRow">취소</button></td>'+
				        '</tr>';
        
		var trHtml = $( ".trAddGroup:last" ); //last를 사용하여 trAddGroup라는 명을 가진 마지막 태그 호출
		
		trHtml.after(addTbRow); //마지막 trAddGroup명 뒤에 붙인다.
	});
	
	/* 상세코드 추가 버튼 */
	$("#addDetailRow").on('click', function() {
		
		$(".nodata").hide();
		
		var addTbRow =	'<tr>'+
				        	'<td class="active hidden-col"></td>'+
				        	'<td class="active col-md-1"><input type="text" class="form-control" name="groupId" value="'+groupCode+'" readonly style="text-align:center;"></td>'+
					        '<td class="active col-md-1"><input type="text" class="form-control" name="detailCode"></td>'+
					        '<td class="active col-md-1"><input type="text" class="form-control" name="detailCodeName"></td>'+
					        '<td class="active col-md-2"><input type="text" class="form-control" name="description"></td>'+
					        '<td class="active col-md-1"><select class="form-control" name="useYn"><option value="y">사용</option><option value="n">미사용</option></select></td>'+
					        '<td class="active col-md-1">ㅡ</td>'+
					        '<td class="active col-md-1"><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#staticBackdrop" name="saveDetail">저장</button><button class="btn btn-sm btn-secondary" name="delRow">취소</button></td>'+
				        '</tr>';
        
		var trHtml = $( ".trAddDetail:last" ); //last를 사용하여 trAddDetail라는 명을 가진 마지막 태그 호출
		
		trHtml.after(addTbRow); //마지막 trAddDetail명 뒤에 붙인다.
	});
	
	/* 취소 버튼 */
	$(document).on("click", "button[name=delRow]", function(){
		var trHtml = $(this).parent().parent();
		trHtml.remove(); //tr 테그 삭제
	});
	
	/* 저장 버튼 (그룹코드) */
	$(document).on("click", 'button[name=saveGroup]', function(e) {
		e.preventDefault();
		var groupCode = $("#groupCodeDefault").val()
		/* 그룹코드 중복체크 */
		groupCodeCnt(groupCode);
	});
	
	/* 저장 버튼 (상세코드) */
	$(document).on("click", 'button[name=saveDetail]', function(e) {
		e.preventDefault();
		detailCodeWrite();
	});
	
	/* 수정 버튼 (그룹코드) */
	$(document).on("click", 'button[name=updateGroup]', function(e) {
		e.preventDefault();
		groupCodeUpdate();
	});
	
	/* 수정 버튼 (상세코드) */
	$(document).on("click", 'button[name=updateDetail]', function(e) {
		e.preventDefault();
		detailId = $(this).closest("tr").data('did');
		console.log("수정 ::: "+detailId);
		detailCodeUpdate(detailId);
	});
	
});

<%-- 그룹코드 중복체크 --%>
function groupCodeCnt(groupCode) {
	$.ajax({
		type: "GET",
		url: "/rest/code/group/list/" + groupCode,
		success: function(data) {
			if(data == true) {
				groupCodeWrite();
			} else {
				alert("그룹코드 중복 불가");
			}
		}
	});
}

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
		var html = '<tr class="trAddDetail nodata"><td colspan="7"><div class="no-data"><p>조회내역이 없습니다.</p></div></td></tr>';
		$("#listAll").append(html);
	}
	
	var html = [];
	for (n in data.detailCodeList) {
		var item = data.detailCodeList[n];
		var useYn;
		if (item.useYn == 'y') {
			useYn = '<option value="y" selected>사용</option><option value="n">미사용</option>';
		} else {
			useYn = '<option value="y">사용</option><option value="n" selected>미사용</option>';
		}
		html.push('<tr class="trAddDetail" data-did="'+item.id+'">');
		html.push(	'<td class="hidden-col">'+item.id+'</td>');
		html.push(	'<td>'+item.groupCode+'</td>');
		html.push(	'<td><input type="text" class="form-control" id="detailCode'+item.id+'" 	name="detailCode" 			value="'+item.detailCode+'"></td>');
		html.push(	'<td><input type="text" class="form-control" id="detailCodeName'+item.id+'" name="detailCodeName" 		value="'+item.detailCodeName+'"></td>');
		html.push(	'<td><input type="text" class="form-control" id="descriptionDetail'+item.id+'" 	name="descriptionDetail" 	value="'+item.description+'"></td>');
		html.push(	'<td><select class="form-control" 			 id="useYnDetail'+item.id+'" 			name="useYnDetail">'+useYn+'</select></td>');
		html.push(	'<td>'+item.regDate.split(' ')[0]+'</td>');
		html.push(	'<td><button class="btn btn-sm btn-outline-primary" name="updateDetail">수정</button></td>');
		html.push('</tr>');
	}
	$("#listAll").append(html.join(''));
	
	
	/* 상세코드 row 클릭 시 */
	$("#listAll tr").on('click', function() {
		detailId = $(this).closest("tr").data('did');
		console.log(detailId);
	});
	
}
<%--// 상세코드 리스트 조회 --%>

<%-- 새 상세코드 등록 --%>
function detailCodeWrite() {
	$.ajax({
		type: "POST",
		url: "/rest/code/detail/write",
		data: JSON.stringify({
			"groupId" 			: groupId,
			"detailCode" 		: $("input[name=detailCode]").val(),
			"detailCodeName"	: $("input[name=detailCodeName]").val(),
			"description" 		: $("input[name=description]").val(),
			"useYn" 			: $("select[name=useYn]").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			//alert("등록 완료 ^^");
		}
	});
}
<%--// 새 상세코드 등록 --%>

<%-- 그룹코드 수정 --%>
function groupCodeUpdate() {
	$.ajax({
		type: "POST",
		url: "/rest/code/group/update/" + groupId,
		data: JSON.stringify({
			"groupCodeName" : $("#groupCodeName"+groupId).val(),
			"description" 	: $("#descriptionGroup"+groupId).val(),
			"useYn" 		: $("#useYnGroup"+groupId+" option:selected").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			alert("수정되었습니다");
		}
	});
}
<%--// 그룹코드 수정 --%>

<%-- 상세코드 수정 --%>
function detailCodeUpdate(detailId) {
	$.ajax({
		type: "POST",
		url: "/rest/code/detail/update/" + detailId,
		data: JSON.stringify({
			"detailCode" 		: $("#detailCode"+detailId).val(),
			"detailCodeName" 	: $("#detailCodeName"+detailId).val(),
			"description" 		: $("#descriptionDetail"+detailId).val(),
			"useYn" 			: $("#useYnDetail"+detailId+" option:selected").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			alert("수정되었습니다");
		}
	});
}
<%--// 상세코드 수정 --%>
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
				<tr class="trAddGroup" data-id="${list.id}" data-code="${list.groupCode}">
					<td class="hidden-col">${list.id}</td>
					<td>${list.groupCode}</td>
					<td><input type="text" class="form-control" id="groupCodeName${list.id}" 	 name="groupCodeName" 		value="${list.groupCodeName}"></td>
					<td><input type="text" class="form-control" id="descriptionGroup${list.id}"	 name="descriptionGroup" 	value="${list.description}"></td>
					<td>
						<select class="form-control" id="useYnGroup${list.id}" name="useYnGroup">
							<c:choose>
								<c:when test="${useYn eq 'y'}"><option value="y" selected>사용</option><option value="n">미사용</option></c:when>
								<c:when test="${useYn eq 'n'}"><option value="y">사용</option><option value="n" selected>미사용</option></c:when>
							</c:choose>
						</select>
					</td>
					<td>${fn:split(regDate, ' ')[0]}</td>
					<td data-id="${list.id}"><button class="btn btn-sm btn-outline-primary" name="updateGroup">수정</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<h3 class="float-left">detailCode list</h3>
	<p class="float-right">
		<button type="button" class="btn btn-primary" id="addDetailRow"> 추가 </button>
	</p>
	
	<table id="detailCodeList" class="table table-sm text-center table-hover">
		<thead>
			<tr>
				<th scope="col" class="hidden-col">id</th>
				<th scope="col" class="col-md-1">그룹코드</th>
				<th scope="col" class="col-md-1">상세코드</th>
				<th scope="col" class="col-md-1">상세코드명</th>
				<th scope="col" class="col-md-2">설명</th>
				<th scope="col" class="col-md-1">사용여부</th>
				<th scope="col" class="col-md-1">등록일</th>
				<th scope="col" class="col-md-1">비고</th>
			</tr>
		</thead>
		<tbody id="listAll">
		</tbody>
	</table>
	<br>
	
</div>	
</body>
</html>