<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoView1.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<script type="text/javascript">
	'use strict';
	
	function imgCheck(input) {
		if(input.files[0] && input.files[0]){
			let reader =  new FileReader();
			reader.onload = function(e){
				document.getElementById("demo").src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
		else{
			document.getElementById("demo").src = "";
		}
	}
	
	function fCheck1() {
		let fName = document.getElementById("fName").value;
		let maxSize = 1024 * 1024 * 10;
		let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
		
		if(fName.trim == ""){
			alert("업로드 파일을 선택하세요.");
			return false;
		}
		
		let fileSize = document.getElementById("fName").files[0].size;
		if(fileSize > maxSize){
			alert("10MB 이상 업로드 불가");
		}
		else if(ext != "jpg" && ext != "png" && ext != "gif" && ext != "hwp" && ext != "zip" && ext != "ppt" && ext != "pptx" && ext != "xlsx" && ext != "txt" && ext != "doc") {
			alert("업로드 가능한 파일은 'jpg/png/gif/hwp/zip/ppt/pptx/xlsx/txt/doc 만 사용 가능합니다");
		}
		else{
			myform.submit();
		}
	}
	
	function fCheck2() {
		let fName = document.getElementById("fName").value;
		let maxSize = 1024 * 1024 * 10;
		let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
		
		if(fName.trim == ""){
			alert("업로드 파일을 선택하세요.");
			return false;
		}
		
		let fileSize = document.getElementById("fName").files[0].size;
		if(fileSize > maxSize){
			alert("10MB 이상 업로드 불가");
			return false;
		}
		else if(ext != "jpg" && ext != "png" && ext != "gif" && ext != "hwp" && ext != "zip" && ext != "ppt" && ext != "pptx" && ext != "xlsx" && ext != "txt" && ext != "doc") {
			alert("업로드 가능한 파일은 'jpg/png/gif/hwp/zip/ppt/pptx/xlsx/txt/doc 만 사용 가능합니다");
			return false;
		}
		
		let query = new FormData(myform);
		
		$.ajax({
			type : "post",
			url : "PhotoViewAjax",
			enctype : "multipart/form-data",
			data : query,
			processData : false,
			contentType : false,
			success: function(res) {
				if(res != "0"){
					alert("파일 업로드 성공!");
					let str = '서버에 저장된 파일 명 : ' + res;
					$("#ajaxDemo").html(str);
				}
				else{
					alert("파일 업로드 실패");
				}
			},
			error: function() {
				alert("전송실패");
			}
		});
	}
</script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
<p><br/></p>
<div class="container">
 	<h2>업로드 사진 미리보기1</h2>
 	<form action="PhotoView1Ok.st" name="myform" method="post" enctype="multipart/form-data">
 		<div>
 			<input type="file" name="fName" id="fName" onchange="imgCheck(this)" class="form-control-file border mb-2">
 			<img id="demo" width="150px">
 		</div>
 		<div>
 			사진 설명
 			<textarea rows="4" name="content" id="content" class="form-control mb-3" placeholder="사진설명을 입력하세요~"></textarea>
 			<div class="row">
 				<div class="col"><input type="button" value="저장(일반)" onclick="fCheck1()" class="btn btn-success mb-2"></div>
 				<div class="col"><input type="button" value="저장(AJAX)" onclick="fCheck2()" class="btn btn-info mb-2"></div>
 				<div class="col"><input type="button" value="다시선택" onclick="location.reload()" class="btn btn-warning mb-2"></div>
 				<div class="col"><input type="button" value="다중파일저장" onclick="location.href='PhotoView2.st'" class="btn btn-primary mb-2"></div>
 				<div class="col"><input type="button" value="업로드 사진 보기" onclick="location.href='PhotoStorageList.st'" class="btn btn-secondary mb-2"></div>
 			</div>
 		</div>
 	</form>
 	<hr>
 	<div id="ajaxDemo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/Footer.jsp"/>
</body>
</html>