<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/main_style.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/admin_member_detail.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/adminpage.css"/>">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap" rel="stylesheet">
<title>회원상세페이지입니다.</title>
</head>
<body>
	<%@ include file="../admin_header.jsp"%>
	<div class="admin_page">
		<div id="first_box">
			<div id="second_box">
				<p id="p_title">회원 상세보기</p>
				<form:form commandName="member" method="post" action="memberdetail.me" enctype="multipart/form-data">
					<div id="third_box">
						<div id="top_box">
							<ul>
								<li><p>번호</p></li>
								<li><input type="text" size="16" name="m_num"
									value="${member.mnum }"></li>
							</ul>
							<ul>
								<li><p>이름</p></li>
								<li><input type="text" size="16" name="m_name"
									value="${member.mname }"></li>
							</ul>
							<ul>
								<li><p>ID</p></li>
								<li><input type="text" size="16" name="m_id"
									value="${member.mid }"></li>
							</ul>
							<ul>
								<li><p>PW</p></li>
								<li><input type="text" size="16" name="m_pw"
									value="${member.mpw }"></li>
							</ul>
							<ul>
								<li><p>E-Mail</p></li>
								<li><input type="text" size="20" name="m_email"
									value="${member.memail }"></li>
							</ul>
							<ul>
								<li><p>주문내역</p></li>
							</ul>
						</div>
						<div id="order_box">
							<table>
								<tr id="order_box_top">
									<td><p>번호</p></td>
									<td><p>ID</p></td>
									<td><p>주문자</p></td>
									<td><p>수령자</p></td>
									<td><p>가격</p></td>
									<td><p>배송비</p></td>
									<td><p>주문일자</p></td>
									<td><p>송장번호</p></td>
								</tr>
								
								<tr id="order_box_bottom">
									<td><p>번호</p></td>
									<td><p>ID</p></td>
									<td><p>주문자</p></td>
									<td><p>수령자</p></td>
									<td><p>가격</p></td>
									<td><p>배송비</p></td>
									<td><p>주문일자</p></td>
									<td><p>송장번호</p></td>
								</tr>
							</table>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>