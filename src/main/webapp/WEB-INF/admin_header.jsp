<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/adminpage.css"/>">
</head>
<body>
<header>
        <div id="menu">
            <ul class="left_side_logo">
                <li><a href="admin.ad"><img src="<c:url value="/resources/images/logo2.png" />" alt="no"/></a></li>
            </ul>
            <ul class="left_side"> 
                <li><a href="productinsert.prd">상품 등록</a></li>
                <li><a href="productselect.prd">상품 조회</a></li>
                <li><a href="memberselect.me">회원 관리</a></li>
                <li><a href="deliverystate1.ord">배송 관리</a></li>
                <li><a href="list.bd">Q &amp; A 상품문의</a></li>
                <li><a href="orderlist.ord">상품 주문 내역</a></li>
                <li><a class="noshow" href="#">공지 사항</a></li>
                <li><a class="noshow" href="#">후기 관리</a></li>
                <li><a href="index.ad">홈페이지 바로가기</a></li>
            </ul>
        </div>
        <p>version 1.10.0.1</p>
    </header>
</body>
</html>