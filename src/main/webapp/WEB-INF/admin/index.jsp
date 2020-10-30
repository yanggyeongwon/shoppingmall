<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/best.css" />">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/script.js" />"></script>
    <title>메인입니다</title>
    <script>
    $(document).ready(function(){
		$('.bottom_product').on({
			click : function(){
				let thisIndex = $(this).index()-1;
			    let items_pnum = $('input[name="pnum"]').eq(thisIndex).val();
				location.href="product.prd?pnum="+items_pnum;
			}
		});
    })
	
    </script>
</head>
<body>
    <section>
       <%@ include file="../header.jsp" %>
        <div id="main_image">
            <div id="images" >
                <img src="<c:url value="/resources/images/main.jpg" />" alt="main_image">
                <img src="<c:url value="/resources/images/main22.jpg" />" alt="main_image2">
                <img src="<c:url value="/resources/images/main33.jpg" />" alt="main_image3">
                <img src="<c:url value="/resources/images/main44.jpg" />" alt="main_image4">
                <img src="<c:url value="/resources/images/main55.jpg" />" alt="main_image5">
                <img src="<c:url value="/resources/images/main66.jpg" />" alt="main_image6">
                <img src="<c:url value="/resources/images/main77.jpg" />" alt="main_image7">
            </div>
        </div>
        <div id="main2_image">
            <div class="area1">
                <p class="product_title">PRODUCT</p>
                <div class="product_items">
                    <div class="images_show" id="best">
                        <img src="<c:url value="/resources/images/best2.jpg"/>" alt="no">
                        <a href="best.prd">BEST</a>
                    </div>
                    <div class="images_show" id="top">
                        <img src="<c:url value="/resources/images/top.jpg"/>" alt="no">
                        <a href="top.prd">TOP</a>
                    </div>
                    <div class="images_show" id="pants">
                         <img src="<c:url value="/resources/images/pants.jpg"/>" alt="no">
                       <a href="pants.prd">PANTS</a>
                    </div>
                    <div class="images_show" id="outer">
                        <img src="<c:url value="/resources/images/outer.jpg"/>" alt="no">
                        <a href="outer.prd">OUTER</a>
                    </div>
                    <div class="images_show" id="shoes">
                         <img src="<c:url value="/resources/images/shoes.jpg"/>" alt="no">
                        <a href="shoes.prd">SHOES</a>
                    </div>
                </div>
            </div>
            <div class="area2">
                <p class="product_title">BEST</p>
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
	                <c:forEach var="items" items="${lists }" >
	               
	                	<div class="bottom_product">
	                	 <input type="hidden" name="pnum" value=${items.pnum }>
		                    <p class="imgoveflow"><img src="<c:url value="/resources/${items.pimage }"/>" alt="no"><p>
		                    <p id="dest_category">BEST</p>
		                    <p>${items.pname }</p>
		                    <p>₩ ${items.pprice }</p>
	                  	</div>
	                </c:forEach>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="../footer.jsp" %>
    
    
    
</body>
</html>