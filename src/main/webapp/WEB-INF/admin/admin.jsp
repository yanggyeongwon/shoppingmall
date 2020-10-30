<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/Chart.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/script.js" />"></script>
    <script src="<c:url value="/resources/js/chart.js" />"></script>    
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/best.css"/>">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    
    <title>Document</title>
</head>
<body>
    <%@ include file="../admin_header.jsp" %>
    <div id="admin_page">
        <div id="first_top">
            <div class="more_btn">
                <a href="orderlist.ord">MORE</a>
            </div>
            <div id="Order_History">
                <div class="order">
                    <p>상품 주문 내역</p>
                    <ul class="order_list">
                        <li>번호</li>
                        <li>상품명</li>
                        <li>주문자</li>
                        <li>수령자</li>
                        <li>구매 금액</li>
                        <li>배송비</li>
                    </ul>
                    <c:forEach items="${lists }" var="order">
                   		<ul class="order_list order_result_list">
	                        <li>${order.onum }</li>
	                        <li>${order.opname }</li>
	                        <li>${order.oname }</li>
	                        <li>${order.oprename }</li>
	                        <li>${order.oppricesum }</li>
	                        <li>${order.opcharge }</li>
	                    </ul>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="QA_border">
            <div class="more_btn">
                <a href="list.bd">MORE</a>
            </div>
            <div class="order" id="QA_bar">
                <p>Q &amp;  A 상품문의</p>
                <ul class="order_list">
                    <li>번호</li>
                    <li>문의내용</li>
                    <li>작성자</li>
                    <li>날짜</li>
                </ul>
                <c:forEach var="items" items="${boardlist }">
                	<ul class="order_list result_list">
		                    <li>${items.num }</li>
		                    <li>${items.subject }</li>
		                    <li>${items.writer }</li>
		                    <li>${items.regdate }</li>
		                </ul>
                </c:forEach>
            </div>
        </div>
        <div id="shipping_border">
            <div class="more_btn">
                <a href="deliverystate1.ord">MORE</a>
            </div>
            <div id="shipping">
                <ul id="shipping_list">
                    <li><img src="<c:url value="/resources/images/shipping1.PNG"/>" alt="no"><p>배송준비중</p></li>
                    <li><img src="<c:url value="/resources/images/shipping2.PNG"/>" alt="no"><p>배송중</p></li>
                    <li><img src="<c:url value="/resources/images/shipping3.PNG"/>" alt="no"><p>배송완료</p></li>
                </ul>
                <ul id="shipping_list_num">
                    <li>${cnt }</li>
                    <li>${cnt2 }</li>
                    <li>${cnt3 }</li>
                </ul>

            </div>
        </div>
        <div id="analytics">
            <div id="chart">
                <canvas id="myChart"></canvas>
            </div>
        </div>
        <div id="notice">
            <div class="more_btn">
                <a href="#">MORE</a>
            </div>
            <div class="order" id="notice_bar">
                <p>공지사항</p>
                <ul class="order_list">
                    <li>번호</li>
                    <li>문의내용</li>
                    <li>작성자</li>
                    <li>날짜</li>
                </ul>
                <%
                    	for(int i=0; i< 4; i++){
                    		%>
                    		<ul class="order_list result_list">
			                    <li>1</li>
			                    <li>이거왜 이래요ddddd</li>
			                    <li>양경원</li>
			                    <li>2020 / 10 / 07</li>
			                </ul>
                    		<%
                    	}
                    %>
            </div>
        </div>
     </div>
</body>
</html>