<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	텍스트 : ${text}<br>
	<c:forEach var="file" items="${fileList}">
		<p>
			파일 이름 : : ${file }<br>
			<img src="${file}">
		</p>
	</c:forEach>
</body>
</html>