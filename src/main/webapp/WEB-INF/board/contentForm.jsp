


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%@ include file="color.jsp" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- <link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css" />"> --%>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap" rel="stylesheet">
    <title>상품수정페이지입니다.</title>
  
<style type="text/css">
body {
    width: 100%;
    text-align : center;
}
table {
    margin: 0 auto;
}   
</style>     
</head>
<body bgcolor="<%=bodyback_c %>">
	
	<%-- <%@ include file="../header.jsp" %> --%>
	<table border="1" width="450" align="center" cellspacing="0">
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>" >글번호 </td>
		<td width="125"  align="center">${bean.num }</td>  
		<td width="125"  align="center" bgcolor="<%=value_c %>">조회수 </xtd>
		<td width="125"  align="center">${bean.readcount }</td>
		
	</tr>
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>">작성자 </td>
		<td width="125"  align="center" >${bean.writer }</td>
		<td width="125"  align="center" bgcolor="<%=value_c %>" >작성일</td>
		<td width="125"  align="center" >${bean.regdate }
		
	</tr>
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>">글제목 </td>
		<td colspan="3" align="center" >${bean.subject }</td>
		
		  
	</tr>
	<tr>
		<td width="125" height="500"  align="center" bgcolor="<%=value_c %>">글내용 </td>
		<td colspan="3">${bean.content }</td>
	</tr>
	<tr>
		<td width="125" align="center" bgcolor="<%=value_c %>" colspan="3">
			<textarea cols="30">내용 영역</textarea>
		</td>
		<td><input type="button" value="등록하기" onclick="loaction.href='comment.bd'"></td>
	</tr>
	<tr>
		<td width="125" align="center" bgcolor="<%=value_c %>">이름영역 </td>
		<td colspan="2"> 
			<textarea cols="30">내용 영역</textarea>
		</td>
		<td>날짜영역</td>
	</tr>
	
	<tr>
		<td colspan=4  align="center" height="30" bgcolor="<%=value_c %>">
			<input type="submit" value="글수정" onClick="location.href='update.bd?num=${bean.num }'">  
			<input type="button" value="글삭제" onClick="location.href='delete.bd?num=${bean.num}'"> 
			<input type="button"  value="답글쓰기" onClick= "location.href='reply.bd?num=${bean.num }&ref=${bean.ref }&re_level=${bean.relevel }&re_step=${bean.restep }'"> 
			<input type="button" value="목록보기" onClick="location.href='read.bd?num=${bean.num}'">
		</td>
	</tr>

	
	</table>
	<%-- <%@ include file="../footer.jsp" %> --%>
</body>