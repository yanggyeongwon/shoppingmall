<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin_member_select.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/adminpage.css"/>">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap" rel="stylesheet">
    <title>회원관리페이지입니다.</title>
</head>
<body>
    <%@ include file="../admin_header.jsp" %>
    <div class="admin_page">
        <div id="first_box">
            <div id="second_box">
                <p id="p_title">회원 관리</p>
               <div id="third_box">
                    <div id="top_box">
                        <form action="memberselect.me" method="get">
                        	<ul id="select_top">
                            	<li>
                            		<select name="whatColumn">
                            			<option value="mnum">번호
                            			<option value="mname">회원명
                            			<option value="mid">회원ID
                            		</select>
                            	</li>
                            	<li><input type="text" size="10" name="keyword"></li>
                            	<li><input type="submit" value="조회"></li>
                       		 </ul>
                        </form>
                    </div>
                    <div id="bottom_box">
                        <table>
                            <tr id="select_bottom">
                                <td><p>번호</p></td>
                                <td><p>회원명</p></td>
                                <td><p>회원ID</p></td>
                                <td><p>회원PW</p></td>
                                <td><p>회원E-Mail</p></td>
                                <td><p>보기</p></td>
                                <td><p>삭제</p></td>
                            </tr>
                            <c:forEach items="${lists }" var="member">
                            <tr id="select_data">
                                <td><p>${member.mnum }<p></td>
                                <td><p>${member.mname }<p></td>
                                <td><p>${member.mid }<p></td>
                                <td><p>${member.mpw }<p></td>
                                <td><p>${member.memail}<p></td>
                                <td><p><a href="memberdetail.me?mnum=${member.mnum }">보기</a><p></td>
                                <td><p><a href="memberdelete.me?mnum=${member.mnum }">삭제</a><p></td>
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
