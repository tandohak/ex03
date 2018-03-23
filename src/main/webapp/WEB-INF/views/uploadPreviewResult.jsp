<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 작성자 : ${writer}</p>
	<img  src="displayFile?filename=${path }" id="img" data-path="${path }">
	<div id="imgBox">
	
	</div>
	<script>
		$("#img").click(function(){
			var path = $(this).attr("data-path"); 
			path = path.replace("s_","");
			var imgObj = "<img id='viewImg' src='displayFile?filename="+path+"'>"; 
			$("#imgBox").html(imgObj);   
		}) 
	</script>
</body>
</html>