<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/border_list.css" />">
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/script.js" />"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"rel="stylesheet">
    <title>메인입니다</title>

	<script>

			$(document).on('click','.aclass', function(){
				let idx = $('.aclass').index(this);
				$('.review_box').hide();
				$('.review_box').eq(idx).toggle();	
				console.log($('.flexul2 #number').eq(idx).text())
				$.ajax({
					type:"GET",
					url:"insert2.pro",
					dataType:"json",
					data:{
						pinum : $('.flexul2 #number').eq(idx).text()
					},
					error:function(error){
						console.log("답글이 없습니다.")
					},
					success : function(data) {

						$('.review_box #p_pienquiry').eq(idx).text(data[0].pienquiry)
						$('.review_box #s_piwriter').eq(idx).text(data[0].piwriter)
						$('.review_box #s_pidate').eq(idx).text(data[0].pidate)
					}
				}) 
				
			    const piwriter = "관리자";
			    
				$('input[type="submit"]').on('click', function(){
					let pienquiry = $('.tdclass textarea').eq(idx).val();
					location.href ="insert.pro?pienquiry="+pienquiry+"&piwriter="+piwriter+"&pinum="+$('.flexul2 #number').eq(idx).text();
				}) 
			})
		
	</script>
</head>
<body>
<%@ include file="../admin_header.jsp" %>

<div id="container">
	<div class="title-name">
		<h1>Q &amp; A 상품문의</h1>
		<b>글목록(전체 글:${pageInfo.totalCount })</b>
		<form action="list.bd" method="get">
			<select name="whatColumn">
				<option value="all">전체
				<option value="subject">제목
				<option value="writer">작성자
			</select>
			<input type="text" name="keyword" value="홍길동">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<div class="table_container">
		<div class="writer">
			<p>
				<span><a href="write.bd">글쓰기</a></span>
			</p>
		</div>
		<c:if test="${totalCount == 0}">
		<div class="result">
				<p>
					<span>게시판에 저장된 글이 없습니다.</span>		
				</p>
		</div>
		</c:if>
				
		<c:if test="${ not (totalCount == 0) }">
			<div class="result">
				<ul class="flexul">
					<li>번호</li>	
					<li>제 목</li>	
					<li>작성자</li>	
					<li>작성일</li>	
					<!-- <td align="center" width="50">조회</td>	
					<td align="center" width="10">IP</td>	 -->
					
				</ul>
			</div>		
			<div class="result">
				<c:forEach items ="${lists }" var ="bd">
		    	<ul class="flexul2">
		  	  		
		    		<li id="number">${bd.num }</li>
		    		<li id="subject"><a class="aclass" href="#">${bd.subject }</a></li><%-- content.bd?num=${bd.num} --%>
		    		<li id="writer">${bd.writer }</li>
		    		<li id="date">${bd.regdate }</li>
		    		<%-- <td>${bd.readcount }</td>
		    		<td>${bd.ip }</td> --%>
		    	</ul>
		    	<div class="review_box">
			    	<div class="result_area">
			    		<p id="s_piwriter"></p>
			    		<p id="p_pienquiry"></p>
			    		<p id="s_pidate"> </p>
			    	</div>
			    	<ul class="tdclass">
			    		<li><textarea rows="5" cols="60" placeholder="내용을 입력하세요"></textarea></li>
			    		<li style="padding-top: 30px"><input type="submit" value="등록하기"></li>
			    	</ul>
		    	</div>
		    	
		    </c:forEach>
		    </div>
		</c:if>
	</div>
	<div class="paging">${pageInfo.pagingHtml}</div>
</div>
</body>


