<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardContent.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
<style type="text/css">
	th{
		text-align: center;
		width: 100px;
		background-color: #eee;
	}
	
</style>
<script type="text/javascript">
	'use strict';
	
	function BoardDelete() {
    	let ans = confirm("현재 게시글을 삭제 하시겠습니까?");
    	if(ans) location.href = "BoardDelete.bo?idx=${vo.idx}";
    }
	
	/* 좋아요 처리(중복허용) */
/* 	function goodCheck1() {
		$.ajax({
			type	:	"post",
			url		:	"BoardGoodCheck.bo",
			data	:	{idx : ${vo.idx}},
			success:function(res){
				if(res != '0'){
					location.reload();
				}
			},
			error : function(){
				alert("전송오류");
			}
		});
	} */
	
	// 좋아요/싫어요 처리(중복 허용)
   /*  function goodCheck2(goodCnt) {
    	$.ajax({
    		type : "post",
    		url  : "BoardGoodCheck.bo",
    		data : {
    			idx : ${vo.idx},
    			goodCnt : goodCnt
    		},
    		success:function(res) {
    			if(res != "0") location.reload();
    		},
    		error : function() {
    			alert('전송오류');
    		}
    	});
    } */
	// 좋아요/싫어요 처리(중복 불가)
    function goodCheck3() {
    	$.ajax({
    		type : "post",
    		url  : "BoardGoodCheck.bo",
    		data : {idx : ${vo.idx}},
  			success:function(res) {
    			if(res != "0") location.reload();
    			else alert("이미 좋아요 버튼을 클릭하셨습니다.");
    		},
    		error : function() {
    			alert('전송오류');
    		}
    	});
    }
    /* 모달 기타내용 입력창 보여주기. */
    function etcShow() {
			$("#claimTxt").show();
		}
    
 // 모달창에서 신고항목 선택후 '확인'버튼 클릭시 수행처리(ajax) 
    function claimCheck() {
    	if(!$("input[type=radio][name=claim]:checked").is(':checked')) {
    		alert("신고항목을 선택하세요");
    		return false;
    	}
    	if($("input[type=radio]:checked").val() == '기타' && $("#claimTxt").val() == '') {
    		alert("기타 사유를 입력해 주세요");
    		return false;
    	}
    	
    	let claimContent = modalForm.claim.value;
    	if(claimContent == '기타') claimContent += '/' + $("#claimTxt").val();
    	
    	let query = {
    			part : 'board',
    			partIdx : ${vo.idx},
    			claimMid: '${sMid}',
    			claimContent: claimContent
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "BoardClaimInput.ad",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("신고 되었습니다.");
    				location.reload();
    			}
    			else alert("신고 실패~~");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
 
 // 댓글 달기
    function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요");
    		return false;
    	}
    	let query = {
    			boardIdx 	: ${vo.idx},
    			mid 			: '${sMid}',
    			nickName 	: '${sNickName}',
    			content   : content,
    			hostIp    : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "BoardReplyInput.bo",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("댓글이 입력되었습니다.");
//    				location.reload();
						$("#replyViewList").load(location.href + ' #replyViewList');
    			}
    			else alert("댓글 입력 실패!!");
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
    	});
    }
 		function replyDeleteCheck(idx) {
			let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
			if(!ans){
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"BoardReplyDelete.bo",
				data:{idx:idx},
				success: function(res) {
					if(res != "0"){
						alert("댓글이 삭제되었습니다.");
						location.reload();
					}
					else{
						alert("삭제 실패");
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
 		
 	// 댓글 수정창 보여주기
    function replyDeleteUpdateCheck(idx) {
    	$(".replyUpdateForm").hide();
    	$("#replyUpdateForm"+idx).show();
    }
 	
//	댓글 수정 	
 	function replyUpdateCheck(idx){
 		let content = $("#content"+idx).val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요");
    		return false;
    	}
    	let query = {
    			idx 	: idx,
    			content   : content,
    			hostIp    : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "BoardReplyUpdate.bo",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("댓글이 수정되었습니다.");
    				location.reload();
    			}
    			else alert("댓글 수정 실패!!");
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
    	});
	}
	function replyUpdateViewClose(idx) {
		$("#replyUpdateForm"+ idx).hide();
	}
</script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
<p><br/></p>
<div class="container">
 	<h2 class="text-center">${vo.title}</h2>
 	<table class="table table-borderless p-0 m-0">
		<tr>
			<td></td>
	 		<td class="text-right mb-4 p-0">
	 			<c:if test="${vo.claim == 'NO' && sMid != vo.mid}"><a href="#" onclick="" data-toggle="modal" data-target="#myModal" class="btn btn-outline-danger">신고하기</a></c:if>
	 			<c:if test="${vo.claim != 'NO'}"><font color="red">신고된 글 입니다.</font></c:if>
			</td>
		</tr>
	 	<tr>
	 		<td class="p-0 m-0">
	 			조회수 : ${vo.readNum}
			</td>
	 		<td class="text-right p-0 m-0">
	 			접속IP : ${vo.hostIp}
			</td>
		</tr>
	</table>
 	<table class="table table-bordered">
 		<tr>
 			<th>글쓴이</th>
 			<td>${vo.nickName}</td>
 			<!-- 좋아요 수 증가 중복 가능 -->
 			<!-- <th class="text-center"><a href="javascript:goodCheck1()" title="좋아요" style="color: red;"><i class="fa-regular fa-heart fa-2x"></i></a></th> -->
 			<!-- 좋아요 싫어요 공용 사용 중복 가능 -->
 			<!-- <th class="text-center"><a href="javascript:goodCheck2(1)" title="좋아요" style="color: red;"><i class="fa-regular fa-heart fa-2x"></i></a></th> -->
 			<c:if test="${sContentGood != null}"><th class="text-center"><a href="javascript:goodCheck3(1)" title="좋아요" style="color: red;"><i class="fa-solid fa-heart fa-2x"></i></a></th></c:if>
 			<c:if test="${sContentGood == null}"><th class="text-center"><a href="javascript:goodCheck3(1)" title="좋아요" style="color: black;"><i class="fa-regular fa-heart fa-2x"></i></a></th></c:if>
 			<td style="width: 15%;">${vo.good}</td>
 		</tr>
 		<tr>
 			<th>글쓴날짜</th>
 			<td colspan="3">${vo.wDate.substring(0,10)}</td>
<%--  			<th class="text-center"><a href="javascript:goodCheck2(-1)" title="싫어요"><i class="fa-solid fa-thumbs-down fa-2x"></i></a></th>
 			<td style="width: 15%;">${vo.good}</td> --%>
 		</tr>
 		<tr>
 			<th>글제목</th>
 			<td colspan="3">${vo.title}</td>
 		</tr>
 		<tr>
 			<th>글 내용</th>
 			<td colspan="3" style="height: 240px;">${fn:replace(vo.content, newLine, '<br/>')}</td>
 		</tr>
 	</table>
 	<table class="table table-borderless">
    <tr>
    	<td colspan="2">
	      <input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}'" class="btn btn-secondary mr-2"/>
      </td>
    	<td class="text-right">
		    <c:if test="${sMid == vo.mid || sLevel==0}">
		      	<input type="button" value="수정하기" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}'" class="btn btn-warning mr-2"/>	
			      <input type="button" value="삭제하기" onclick="BoardDelete()" class="btn btn-danger mr-2"/>
	      </c:if>
			</td>
    </tr>
  </table>
  
  <hr>
  
	<!-- 이전글/다음글 시작 -->
	<c:if test="${!empty nextVo.title}">
		<div>다음글 <a href="BoardContent.bo?idx=${nextVo.idx}&pag=${pag}&pageSize=${pageSize}">${nextVo.title}</a></div>
	</c:if>
	<c:if test="${!empty preVo.title}">
		<div>이전글 <a href="BoardContent.bo?idx=${preVo.idx}&pag=${pag}&pageSize=${pageSize}">${preVo.title}</a></div>
	</c:if>
	<!-- 이전글/다음글 끝 -->

	<hr>
	
	<div id="replyViewList">
		<table class="table table-hover text-center">
			<tr>
				<th style="width: 70px;">작성자</th>
				<th>댓글 내용</th>
				<th>댓글 날짜</th>
				<th>접속 IP</th>
				<th style="width: 2px;"></th>
			</tr>
			<c:forEach var="vo" items="${replyVos}" varStatus="st">
				<tr>
					<td>${vo.nickName}</td>
					<td class="text-left">${fn:replace(vo.content,newLine,"<br/>")}</td>
					<td>${fn: substring(vo.wDate,0,10)}</td>
					<td>${vo.hostIp}</td>
					<td>
						<div class="dropdown dropright">
						  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
					    	.
						  </button>
						  <div class="dropdown-menu text-center" style="width: 10px;">
								<c:if test="${sMid == vo.mid || sLevel == 0}">
							  	<c:if test="${sMid == vo.mid}">
						 				<div><a href="javascript:replyDeleteUpdateCheck(${vo.idx})" title="수정" style="color: black;">수정</a></div>
					 				</c:if>
						 			<div><a href="javascript:replyDeleteCheck(${vo.idx})" title="삭제" style="color: black;">삭제</a></div>
								</c:if>
						  </div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="m-0 p-0">
						<div id="replyUpdateForm${vo.idx}" style="display: none;">
							<form action="">
								<table class="table table-borderless text-center">
									<tr style="height: 10px;">
										<td style="text-align: left; padding-bottom: 0px;">
											작성자 : ${sNickName}
									 	</td>
								 </tr>
									<tr>
										<td style="padding-top: 0px;" colspan="2">
											<textarea rows="4" class="form-control" name="content" id="content${vo.idx}">${vo.content}</textarea>
										</td>
									</tr>
									<tr>
										<td class="text-left">
									  	<input type="button" value="취소" onclick="replyUpdateViewClose(${vo.idx})" class="btn btn-warning btn-sm">
								  	</td>
								  	<td class="text-right">
									  	<input type="button" value="댓글수정" onclick="replyUpdateCheck(${vo.idx})" class="btn btn-info btn-sm">
								  	</td>
							  	</tr>
								</table>
							</form>
						</div>
					</td>
				</tr>
			</c:forEach>
			<tr><td colspan="4" class="m-0 p-0"></td></tr>
		</table>
		
		<!-- 블록페이지 시작 -->
	  <div class="pagination-wrapper text-center">
	    <ul class="pagination mt-3">
	      <li class="page-item">
	        <c:if test="${pag > 1}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=1">첫 페이지</a></c:if>
	        <c:if test="${pag <= 1}"><span class="page-link disabled text-secondary">첫페이지</span></c:if>
	      </li>
	      <li class="page-item">
	        <c:if test="${curBlock > 0}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></c:if>
	        <c:if test="${curBlock <= 0}"><span class="page-link disabled text-secondary">이전블록</span></c:if>
	      </li>
	      
	      <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
	        <c:if test="${i <= totPage && i == pag}">
	          <li class="page-item active"><a class="page-link bg-secondary border-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
	        </c:if>
	        <c:if test="${i <= totPage && i != pag}">
	          <li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
	        </c:if>
	      </c:forEach>
	      
	      <li class="page-item">
	        <c:if test="${curBlock >= lastBlock}"><span class="page-link disabled text-secondary">다음블록</span></c:if>
	        <c:if test="${curBlock < lastBlock}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></c:if>
	      </li>
	      
	      <li class="page-item">
	        <c:if test="${pag >= totPage}"><span class="page-link disabled text-secondary">마지막 페이지</span></c:if>
	        <c:if test="${pag < totPage}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a></c:if>
	      </li>
	    </ul>
	  </div>
	    <!-- 블록페이지 끝 -->
	
		<form action="">
			<table class="table table-borderless text-center">
				 <tr style="height: 10px;">
					<td style="text-align: left; padding-bottom: 0px;">
						작성자 : ${sNickName}
				 	</td>
				 </tr>
				<tr>
					<td style="padding-top: 0px;">
						<textarea rows="4" class="form-control" name="content" id="content" placeholder="댓글을 입력하세요"></textarea>
						<p style="text-align: right;"><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"></p>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>


<!-- The Modal 시작 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">현재 게시글을 신고합니다.</h3>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <b>신고사유 선택</b>
        <hr/>
        <form name="modalForm">
        	  <div><input type="radio" name="claim" id="claim1" value="광고,홍보,영리목적"/><label for="claim1">광고,홍보,영리목적</label></div>
            <div><input type="radio" name="claim" id="claim2" value="욕설,비방,차별,혐오"/><label for="claim2">설,비방,차별,혐오</label></div>
            <div><input type="radio" name="claim" id="claim3" value="불법정보"/><label for="claim3">불법정보</label></div>
            <div><input type="radio" name="claim" id="claim4" value="음란,청소년유해"/><label for="claim4">음란,청소년유해</label></div>
            <div><input type="radio" name="claim" id="claim5" value="개인정보노출,유포,거래"/><label for="claim5">개인정보노출,유포,거래</label></div>
            <div><input type="radio" name="claim" id="claim6" value="도배,스팸"/><label for="claim6">도배,스팸</label></div>
            <div><input type="radio" name="claim" id="claim7" value="기타" onclick="etcShow()"/><label for="claim7">기타</label></div>
            <div id="etc"><textarea rows="2" id="claimTxt" class="form-control" style="display:none"></textarea></div>
            <hr/>
            <input type="button" value="확인" onclick="claimCheck()" class="btn btn-success form-control" />
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- The Modal 끝 -->

<p><br/></p>
<jsp:include page="/include/Footer.jsp"/>
</body>
</html>