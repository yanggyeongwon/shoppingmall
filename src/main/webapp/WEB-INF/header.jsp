<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>메인</title>
</head>

<body>
<a id="admin-page" href="admin.ad"></a>
	<article>
		<button class="totop_arrow1" type="button">위로 올리기</button>
	</article>
	<div class="menu">
		<div id="logo">
			<a href="index.ad"><img src="<c:url value="/resources/images/logo2.png"/>" alt="no"></a>
		</div>
		<div class="join">
			
			<a class="noshow" href="#"><span>NOTICE</span></a>
			<a class="noshow" href="#"><span>BASKET</span></a>
			<a class="noshow" href="#"><span>MYPAGE</span></a>
			<%
			
			Object login = session.getAttribute("loginInfo");

				if(login == "" || login == null || login == "null"){
					%>
					<a href="login.me"><span>LOGIN</span></a>
					<a href="register.me"><span>JOIN</span></a>
					<%
				}else{
					%>
					<a href="logout.me"><span>LOGOUT</span></a>
					<%
				}
			
			%>
		</div>
		<ul id="ul_id">
			<li><a href="best.prd">BEST</a></li>
			<li><a href="top.prd">TOP</a></li>
			<li><a href="pants.prd">PANTS</a></li>
			<li><a href="outer.prd">OUTER</a></li>
			<li><a href="shoes.prd">SHOES</a></li>
			<li><a href="acc.prd">ACC</a></li>
		</ul>
	</div>
</body>
</html>