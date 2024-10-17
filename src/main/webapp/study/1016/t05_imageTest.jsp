<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t05_imageTest.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<body>
	<p><br/></p>
	<div class="container">
  	<pre>
  	콤보상자에 출력 할 그림 파일명을 보여주고,
  	그 그림파일명을 선택하면 demo레이어에 선택된 그림 파일을 출력하시오.
  	</pre>
  	<form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T05Ok">
	  	<select name="images" id="images" class="form-control">
	  	  	<option value="">사진 선택</option>
	  	  	<option vlaue="11.jpg">11.jpg</option>
	  	  	<option vlaue="12.jpg">12.jpg</option>
	  	  	<option vlaue="13.jpg">13.jpg</option>
	  	  	<option vlaue="14.jpg">14.jpg</option>
	  	  	<option vlaue="15.jpg">15.jpg</option>
	  	  	<option vlaue="16.jpg">16.jpg</option>
	  	  </select>
	  	  <div><input type="submit" value="그림 출력" class="form-control btn-success mt-3" /></div>
	  	  <hr>
	  </form>
	  <div id="demo">
	  	<img src="<%=request.getContextPath()%>/images/${images}" width="700px"/>
	  </div>
	</div>
	<p><br/></p>
	</body>
</html>