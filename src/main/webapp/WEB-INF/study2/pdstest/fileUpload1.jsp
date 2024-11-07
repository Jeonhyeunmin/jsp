<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fileUpload1.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">

	.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
	}
	
	.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
    margin-top: 10px;
	}
	
	.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
	}
</style>

<script type="text/javascript">
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
	});
	
	function fCheck() {
		let fName = document.getElementById("file").value;
		let maxSize = 1024 * 1024 * 10;
		let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
		
		if(fName.trim == ""){
			alert("업로드 파일을 선택하세요.");
			return false;
		}
		
		let fileSize = document.getElementById("file").files[0].size;
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
</script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
<p><br/></p>
<div class="container">
 	<h2>파일 업로드 연습(싱글 파일 처리)</h2>
 	<form name="myform" method="post" action="FileUpload1Ok.st" enctype="multipart/form-data">
    파일명 :
    <input type="file" name="fName" id="file" class="form-control-file border mb-2" />
    <input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control"/>
    <input type="hidden" name="nickName" value="${sNickName}"/>
  </form>
  <hr>
  <div class="row">
  	<div class="col"><a href="FileDownload.st" class="btn btn-primary form-control">다운로드 폴더로 이동하기</a></div>
  	<div class="col"><a href="FileUpload.st" class="btn btn-secondary form-control">돌아가기</a></div>
  </div>
  
  <hr>
  
  <!-- ------------------------------------------------------------------------------------- -->
  <hr>
  
  
 	<!-- <form name="myform" method="post" action="FileUpload1Ok.st" enctype="multipart/form-data">
 		<div class="filebox">
	    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
	    <label for="file">파일찾기</label> 
	    <input type="file" id="file">
		</div>
		<input type="button" class="btn btn-success form-control mt-2" value="파일 전송">
 	</form> -->
</div>
<p><br/></p>
<jsp:include page="/include/Footer.jsp"/>
</body>
</html>