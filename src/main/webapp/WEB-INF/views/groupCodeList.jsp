<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/common/modalAlert.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	
	/* 추가 버튼 */
	$("#addRow").on('click', function() {
		var addTbRow =	'<tr name="trAdd">'+
				        	'<td class="active col-md-2"><input type="text" class="form-control" name="groupCode"></td>'+
					        '<td class="active col-md-2"><input type="text" class="form-control" name="groupCodeName"></td>'+
					        '<td class="active col-md-3"><input type="text" class="form-control" name="description"></td>'+
					        '<td class="active col-md-1"><select class="form-control " name="useYn"><option value="y">사용</option><option value="n">미사용</option></select></td>'+
					        '<td class="active col-md-1">ㅡ</td>'+
					        '<td class="active col-md-1"><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#staticBackdrop" name="save">저장</button><button class="btn btn-sm btn-primary" name="delRow">취소</button></td>'+
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
</script>
</head>
<body>

<!-- Page Content -->
<div class="container">
	<h1 class="mt-4">공통코드 관리</h1>
	<h3>groupCode list</h3>
	
	<br>
	<p class="float-right">
		<button type="button" class="btn btn-sm btn-primary" id="addRow"> 추가 </button>
	</p>
	
	<table class="table table-sm text-center table-bordered">
		<thead>
			<tr>
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
				<tr class="trAdd">
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
	
	
	
</div>	
</body>
</html>