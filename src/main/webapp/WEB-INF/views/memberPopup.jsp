<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<script type="text/javascript">

$(function(){
	setPop();
});


// 팝업 세팅
var clickRow = null;
function setPop() {
	
	var popOpenBtn = $("#memberList tr");
	 
	//팝업 열기
	popOpenBtn.on('click', function() {
		clickRow = $(this).attr('data-id');
		getMemberInfo(clickRow);
		$('#popUp').fadeIn(200);
	})
	 
	//팝업 닫기
	$('.popBg, .popCloseBtn').on('click', function() {
		$('#popUp').fadeOut(200);
	})
	
	
	/* 수정 버튼 (그룹코드) */
	$('.memUpdateBtn').on('click', function(e) {
		e.preventDefault();
		memberInfoUpdate(clickRow);
	})
	
}

<%-- 회원 상세 정보 --%>
function getMemberInfo(id) {
	$.ajax({
		type: "GET",
		url: "/rest/member/" + id,
		success: function(data) {
			var updateDate;
			if(!data.updateDate) {
				updateDate = data.regDate.split(' ')[0];
			} else {
				updateDate = data.updateDate.split(' ')[0];
			}
			
			$("#mId").text(data.mbUserId);
			$("#mPw").val(data.mbPw);
			$("#mName").val(data.mbName);
			$("#mCellphone").val(data.mbCellphone);
			$("#mEmail").val(data.mbEmail);
			$("#mBirth").val(data.mbBirth);
			$("#mState").val(data.active);
			$("#mRegDate").text(data.regDate.split(' ')[0]);
			$("#mUpdateDate").text(updateDate);
		}
	});
}
<%--// 회원 상세 정보 --%>


<%-- 회원 정보 수정 --%>
function memberInfoUpdate(id) {
	$.ajax({
		type: "POST",
		url: "/rest/member/update/" + id,
		data: JSON.stringify({
			"mbPw"			: $("#mPw").val(),
			"mbName"		: $("#mName").val(),
			"mbCellphone"	: $("#mCellphone").val(),
			"mbEmail"		: $("#mEmail").val(),
			"mbBirth"		: $("#mBirth").val(),
			"active"		: $("#mState option:selected").val()
		}),
		contentType: "application/json; charset=utf-8",
		success: function() {
			location.href="/web/member/list";
		}
	});
}
<%--// 회원 정보 수정 --%>

</script>
</head>
<body>


<div id="popUp" class="popCmmn">
  <div class="popBg"></div>		<!-- 백그라운드 딤드처리 -->
  <div class="popInnerBox">		<!-- 팝업 상자 -->
    <div class="popHead">회원 상세 / 수정</div>
    <div class="popBody">
    	<table id="detailMemberInfo" class="table text-center table-bordered">
			<tr>
				<th scope="col" class="hidden-col col-md-2">id</th>
				<td class="hidden-col"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">ID</th>
				<td class="text-left" id="mId"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">비밀번호</th>
				<td class=""><input type="text" class="form-control" id="mPw" name="mbPw"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">이름</th>
				<td class=""><input type="text" class="form-control" id="mName" name="mbName"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">핸드폰</th>
				<td class=""><input type="text" class="form-control" id="mCellphone" name="mbCellphone"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">이메일</th>
				<td class=""><input type="text" class="form-control" id="mEmail" name="mbEmail"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">생년월일</th>
				<td class=""><input type="text" class="form-control" id="mBirth" name="mbBirth"></td>
			</tr>
			<tr>
				<th scope="col" class="text-center">상태</th>
				<td class="">
					<select class="form-control" id="mState" name="active">
						<option value="y">활동 중</option><option value="n">정지</option>
					</select>
				</td>
			</tr>
		</table>
		
		<p style="text-align: right">
			등록일 &nbsp;&nbsp;<span id="mRegDate"></span>&nbsp;&nbsp;&nbsp;&nbsp; <br>
			수정일 &nbsp;&nbsp;<span id="mUpdateDate"></span>&nbsp;&nbsp;&nbsp;&nbsp;
		</p>
		
    </div>
    
    <div class="popFoot">
		<p><button type="button" class="memUpdateBtn btn btn-primary">수정</button>&nbsp;<button type="button" class="popCloseBtn btn btn-secondary">닫기</button></p>
    </div>
	
  </div>
</div>

</body>
</html>