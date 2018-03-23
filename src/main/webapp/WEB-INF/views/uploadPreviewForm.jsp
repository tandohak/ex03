<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#dropBox{
		width:300px;
		height:300px;
		border:1px solid #ccc;
		overflow:auto;
	}
	#dropBox img{
		max-width:100%;
		max-height:100%;
	}
</style>
</head>
<body>
	<form id="f1" action="uploadPreview" method="post" enctype="multipart/form-data">
		작성자 이름 : <input type="text" name="writer" placeholder="작성자 이름"><br>
		파일 선택 : <input type="file" name="file" id="file"><br>
		<input type="submit" value="전송"/> 
	</form>
	
	<div id="dropBox">
	</div>
	
	<script>
		$("#file").change(function(){
			$("#dropBox").empty();
			
			var reader = new FileReader();
			reader.onload = function(e){
				var imgObj = $("<img>").attr("src",e.target.result);
				$("#dropBox").append(imgObj);
			}
			
			//var file = document.getElementById("file");
			//file.files[0]
			reader.readAsDataURL($(this)[0].files[0]); 
		});
	</script>
</body>
</html>