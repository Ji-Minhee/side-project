<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/jslib/bootstrap-4.4.1-dist/css/bootstrap.min.css'/>">
<script src="<c:url value='/jslib/jquery/jquery-3.4.1.min.js'/>"></script>
<script src="<c:url value='/jslib/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>">
<link rel="stylesheet" href="<c:url value='/css/popup.css'/>">
<link rel="stylesheet" href="<c:url value='/jslib/fontawesome-free/css/all.min.css'/>">
<script src="<c:url value='/jslib/fontawesome-free/js/all.min.js'/>"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"> -->
<title></title>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
  <div class="container">
    <a class="navbar-brand" href="/"><img src="<c:url value='/img/moonrabbit.jpg" alt="logo" width="90px" height="70px'/>"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/web/list">게시판<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/web/code/group/list">공통코드관리</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/web/member/list">회원관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--// Navigation -->



</body>
</html>