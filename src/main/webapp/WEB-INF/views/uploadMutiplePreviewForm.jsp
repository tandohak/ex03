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
		width:900px;
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
	<form id="f1" action="mutiplePreview" method="post" enctype="multipart/form-data">
		작성자 이름 : <input type="text" name="writer" placeholder="작성자 이름"><br>
		파일 선택 : <input type="file" name="files" id="file" multiple="multiple"><br>
		<input type="submit" value="전송"/>  
	</form> 
	 
	<div id="dropBox">
	</div>
	
	<script>
		$("#file").change(function(){
			$("#dropBox").empty();
			
			var files = $(this)[0].files;  
			for(var i=0; i<files.length; i++){
				console.log(files[i]);
				var reader = new FileReader(); 
				
				reader.onload = function(e){
					var imgObj = $("<img>").attr("src",e.target.result);
					$("#dropBox").append(imgObj);
				}
				
				reader.readAsDataURL(files[i]);
			} 
		});
	</script>
</body>
</html>