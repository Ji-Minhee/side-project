<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>


</head>
<body>
	
	hello ~ <br>
	이 컨트롤러의 이름은 ${posts} 입니다	<br>
	이 화면의 view count는 ${count} 입니당	<br>
	<a href="/index2.jsp">index2.jsp</a> <br><br>
	
	<table border="1" bordercolor="lightgray">
		<thead>
			<th>target_url</th>
			<th>count</th>
		</thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>