<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"	href="<c:url value="/resources/css/common.css" />">
<link rel="stylesheet"	href="<c:url value="/resources/css/main_style.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/best.css" />">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>
<title>Document</title>
<script>
    $(document).ready(function(){
		$('.bottom_product').on({
			click : function(){
				let thisIndex = $(this).index()-1;
				console.log(thisIndex)
			    let items_pnum = $('input[name="pnum"]').eq(thisIndex).val();
			    console.log(items_pnum)
				location.href="top2.prd?pnum="+items_pnum;
			}
		});
    })
	
    </script>
</head>
<body>
	<section>
		<%@ include file="../header.jsp"%>
		<div class="area2">
			<p class="product_title">OUTER</p>
			

			<div class="product_items">
			<div id="filter">
				<span class="product_list_btn_hover"> 필터&nbsp; </span>
				<ul id="product_list_btn">
					<li><a href="#">신상품</a></li>
					<li><a href="#">인기상품</a></li>
					<li><a href="#">낮은가격</a></li>
					<li><a href="#">높은가격</a></li>
				</ul>
			</div>
			<c:if test="${empty lists}">
				<style>
					#filter{display:none;}
					.empty p { margin-top: 50%;font-family: 'Nanum Gothic Coding', monospace;}
					.empty{height:300px;margin: 0 auto}
				</style>
				<div class="empty">
					<p>상품이 없습니다.</p>
				</div>
			</c:if>
				<c:forEach var="items" items="${lists }">
					<div class="bottom_product">
					<input type="hidden" name="pnum" value=${items.pnum }>
						<p class="imgoveflow"><img src="<c:url value="/resources/${items.pimage }"/>" alt="no"><p>
						<p>OUTER</p>
						<p>${items.pname }</p>
						<p>₩ ${items.pprice }</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>