<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/script.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin_delivery.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/adminpage.css"/>">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap" rel="stylesheet">
    <title>상품주문내역페이지입니다.</title>
    
</head>
<body>
    <%@ include file="../admin_header.jsp" %>
    <div class="admin_page">
        <div id="first_box">
            <div id="second_box">
                <p id="p_title">상품 주문 내역</p>
               <div id="third_box">           
                   <div id="list_box">
                        <table>
                            <tr id="list_box_top">
                                <td><p>번호</p></td>
                                <td><p>ID</p></td>
                                <td><p>주문자</p></td>
                                <td><p>수령자</p></td>
                                <td><p>가격</p></td>
                                <td><p>배송비</p></td>
                                <td><p>주문일자</p></td>
                            </tr>
                            <c:forEach items="${lists }" var="orderdetails" varStatus="status">
                            <tr id="list_box_bottom">
                                <td><p>${orderdetails.onum }</p></td>
                                <td><p>${orderdetails.oid }</p></td>
                                <td><p>${orderdetails.oname }</p></td>
                                <td><p>${orderdetails.oprename }</p></td>
                                <td><p>${orderdetails.oppricesum }</p></td>
                                <td><p>${orderdetails.opcharge }</p></td>
                                <td><p>${orderdetails.opdate }</p></td>
                            </tr>
                            </c:forEach>
                        </table>
                        <div class="page_a">
							${pageInfo.pagingHtml } 
                        </div>
                   </div>
               </div>
            </div>
        </div>
    </div>
</body>
</html>