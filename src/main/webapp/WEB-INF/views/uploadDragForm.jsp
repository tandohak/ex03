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
<style>
#dropBox {
	width: 400px;
	height: 300px;
	border: 1px dotted gray;
	overflow: auto;
}

#dropBox img {
	max-width: 100%;
	max-height: 100%;
}

#dropBox div.item {
	position: relative;
	width: 100px;
	height: 130px;
	margin: 5px;
	float: left;
}

.del{
	position: absolute;
	right:10px;
	top:10px;
}
</style>
</head>
<body>
	<form id="f1" action="uploadDrag" method="post"
		enctype="multipart/form-data">
		텍스트 : <input type="text" name="text"><br> <input
			type="submit" " value="전송">
	</form>

	<div id="dropBox"></div>
	<script>
		var formData = new FormData();

		$("#dropBox").on("dragenter dragover", function(e) {
			e.preventDefault();
		});

		$("#dropBox").on("drop", function(e) {
			e.preventDefault();

			var files = e.originalEvent.dataTransfer.files;
			var file = files[0];
			console.log(file);

			var reader = new FileReader();
			reader.addEventListener("load", function() {
				var divObj = $("<div>").addClass("item");
				var imgObj = $("<img>").attr("src", reader.result);
				divObj.html(imgObj);

				$("#dropBox").append(divObj);
			}, false);

			if (file) {
				reader.readAsDataURL(file);
			}

			if (formData == null) {
				formData = new FormData();
			}

			//<input type="file" name="files" value="file">
			formData.append("files", file);
		});

		$("#f1").submit(function(e) {
			e.preventDefault();
			formData.append("test", $("input[name='test']").val());
			
			$.ajax({
				url : "uploadDrag",
				data : formData,
				processData : false,
				contentType : false,
				type : "post",
				dataType : "json",
				success : function(result) {
					console.log(result);
					
					$("#dropBox").empty();
					
					if(result == null){
						alert("전송 실패");
					}else{
						$(result).each(function(i,obj){
							var divObj = $("<div>").addClass("item");
							var imgObj = $("<img>").attr("src","displayFile?filename="+obj);
							divObj.append(imgObj);
							
							var inputObj = $("<input>").val("X").addClass("del").attr("type","button").attr("data-del",obj);
							
							divObj.append(inputObj);
							
							$("#dropBox").append(divObj);
							
							formData = null;
						})
					} 
				}
			}) 
		})
		
		$("#dropBox").on("click",".del",function(){
			var fileName = $(this).attr("data-del"); 
				
			console.log(fileName);
			
			var obj = $(this);
			$.ajax({
				url : "deleteFile",
				data : {"filename":fileName},
				type : "get",
				dataType : "text",
				success : function(result) {
					if(result == "success"){
						alert("삭제 성공");
						obj.parent(".item").remove();
					}else{
						alert("삭제 실패");
					}
				}
			})
		})
	</script>
</body>
</html>