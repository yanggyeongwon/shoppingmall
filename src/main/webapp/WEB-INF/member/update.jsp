<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/main_style.css" type="css/style">
<link rel="stylesheet" href="css/common.css" type="css/style">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>마이페이지</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
<div class="w3-container w3-card-4">
<div class="w3-center w3-large w3-margin-top">
<h3>회원정보</h3>
</div>
<div>
<form:form commandName="member" id="myForm" action="update.me" method="post" enctype="multipart/form-data">
<p>
<label>이름</label>
<input class="w3-input" type="text" id="name" name="mname" readonly value="${ member.mname }">
</p>
<p>
<label>ID</label>
<input class="w3-input" type="text" id="id" name="mid" readonly value="${ member.mid }">
</p>
<p>
<label>비밀번호</label>
<input class="w3-input" id="pw" name="mpw" type="password" value="${member.mpw }">
</p>
<p>
<label>Email</label>
<input class="w3-input" type="text" id="email" name="memail" value="${ member.memail }">
</p>
<button type="button" onClick="">회원탈퇴</button>
<p class="w3-center">
<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
</p>
</form:form>
</div>
</div>
</div>
<span id="guide" style="color:#999"></span>

</body>
</html>