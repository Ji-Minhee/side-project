<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
	<section class="content">
		<tiles:insertAttribute name="header"/> <!--  /WEB-INF/views/layout/header.jsp -->
		<tiles:insertAttribute name="body"/> <!-- body -->
		<tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/layout/footer.jsp -->
    </section>

</body>
</html>