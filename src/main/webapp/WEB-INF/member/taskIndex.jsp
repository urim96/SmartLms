<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/attendance.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminIndex.css">
</head>
<body>
<div class="idxbody">
	<div>
	<img class="idxlog" src="/resources/img/logo11.png" alt="smartLMS" title="smartLMS" style="height: 155px; cursor:pointer;" onclick="javascript:newin=window.open('about:blank'); newin.location.href='/';" ><br>
	<!--  <div class="infodiv"><p class="infoa nick">${userName} 님</p>&nbsp;&nbsp;<a class="infoa" href="logout">로그아웃</a></div>-->
	<ul>
	<li><br></li>
	<li><a href="adminPage" class = "atag2">${userName} 님</a></li>
	<li class="menu">과제 관리></li>
	<li><a href="classList" class = "atag" id="classList">- 시험</a></li>
	<li><a href="gradeclassList" class = "atag">- 과제</a></li>
	<li><a href="gradeclassList2" class = "atag">- 성적</a></li>
	
	</ul>
	</div>
</div>
</body>
</html>