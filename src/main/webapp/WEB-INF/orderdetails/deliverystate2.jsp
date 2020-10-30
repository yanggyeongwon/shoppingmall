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
    <title>배송관리페이지입니다.</title>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		$('.check-all').click(function(){
          		$('.ab').prop('checked', this.checked );
       		 });
     	 });
    	function submitClick() {
            console.log("들어옴");
            var checkedVal = '';
            $("input[name=chk]:checked").each(function(idx, checkbox){
                console.log('chk값:' + $(checkbox).val());
                if(idx > 0) {
                    checkedVal += '-';
                }
                checkedVal += $(checkbox).val();
            });
            
            console.log(checkedVal); // 1-2-3-4 …
            
            $('input[name=onums]').val(checkedVal);

            
            if('${state}' == 1) {
                // 현재 페이지가 배송접수인 경우
                $("input[name=state]").val(2);
            } else if('${state}' == 2) {
                // 현재 페이지가 배송준비인 경우 
                $("input[name=state]").val(2);
            } else if('${state}' == 3){
            	$("input[name=state]").val(2);
            	// 현재페이지가 배송중인경우
            } else{
            	$("input[name=state]").val(2);
            	// 현제페이지가 배송완료인경우
            }
            
            $("#myform").submit();
         }
    </script>
    
</head>
<body>
    <%@ include file="../admin_header.jsp" %>
    <div class="admin_page">
        <div id="first_box">
            <div id="second_box">
                <p id="p_title">배송 관리[배송 준비]</p>
               <div id="third_box">
               <form action="deliverystate3.ord" name="myform" id='myform' method="get">
               	<input type='hidden' name='onums'/> 
                   <div id="top_box">
                    <ul>
                        <li><a href="deliverystate1.ord" style= "color : black">배송접수</a></li>
                        <li><a href="deliverystate2.ord" style= "color : black">배송준비</a></li>
                        <li><a href="deliverystate3.ord" style= "color : black">배송중</a></li>
                        <li><a href="deliverystate4.ord" style= "color : black">배송완료</a></li>
                    </ul>
                    <ul>
                    	<li><input type="button" value="보내기" onclick='submitClick();'></li>
                    </ul>
                   </div>
                   <div id="list_box">
                        <table>
                            <tr id="list_box_top">
                            	<td><input type="checkbox" name="all" class="check-all"></td>
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
                            	<td><input type="checkbox" class="ab" name="chk" value="${orderdetails.onum }"></td>
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
                   </form>
               </div>
            </div>
        </div>
    </div>
</body>
</html>