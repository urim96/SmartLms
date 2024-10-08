<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <% if("교수".equals(usertype) || "관리자".equals(usertype)){ %>
        <%@ include file="../member/adminIndex.jsp"%>
    <%}else{ %>
   		<%@ include file="../member/taskIndex.jsp"%>
    <%} %>
<% Integer c_number = (Integer) request.getAttribute("c_number"); %>
<% String c_name = (String) request.getAttribute("c_name"); %>
<% String id = (String) request.getAttribute("userId"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 목록</title>
</head>
<body>
    
<div class="bcl">
        <div class="divall">
        <h4>과제 목록</h4>
        <br>
            <section class="header-container">
    					<h5>강의번호 :<%=c_number %> </h5>
    					<h5>강의명 : <%=c_name %></h5> 
                </section>
        <br><br>
      
        		
        		
        	<c:choose>
				<c:when test="${taskListcnt > 0}">
				     <table class="table">
				        <tr>
				        <th>강의 번호</th>
				        <th>작성자</th>
				        <th>과제 제목</th>
				        <th>과제 내용 </th>
				        <th>종료 시간</th>
				        <% if(usertype == null){ %>			
				        <th>완료 여부</th>
				        <%} %>
				        
				        </tr>
					<c:forEach items="${taskList}" var="tl">
					
					<%if("교수".equals(usertype) || "관리자".equals(usertype)){ %>
					<tr onclick="location.href='/task/students?c_number=${tl.c_number}&t_number=${tl.t_number}'" style="cursor:hand" >
					<% }else{%>
					<tr onclick="location.href='/task/info?c_number=${tl.c_number}&t_number=${tl.t_number}&id=<%=id %>'" style="cursor:hand" >
					<%} %>
						<td>${tl.c_number}</td>  
						<td>${tl.id}</td>  
						<td>${tl.title}</td>
						<td>${tl.info}</td>
						<td><fmt:formatDate value="${tl.deadline}" pattern="yyyy-MM-dd HH:mm"/></td>
						
						<% if(usertype == null){ %>						
						<td id="taskStatus_${tl.t_number}"></td>
						<%} %>
						</tr>
					</c:forEach>
					</table>
					
				</c:when>	
				<c:otherwise>
					<div class="nodiv">
						<h5>진행중인 과제 목록이 없습니다.</h5>
					</div>
				</c:otherwise>			
			</c:choose>
	</div>
</div>

<script>
$(document).ready(function() {
    const taskList = [
        <c:forEach items="${taskList}" var="task">
            {
                "t_number": "${task.t_number}"
            },
        </c:forEach>
    ]; // JSON 배열 생성

    taskList.forEach(task => {
        const t_number = task.t_number; // 각 과제의 t_number

        $.ajax({
            url: '/task/check',
            type: 'GET',
            data: { t_number: t_number, userId: userId }, // userId는 필요에 따라 설정
            success: function(response) {
                const statusId = '#taskStatus_' + t_number; // 고유한 ID로 선택
                $(statusId).empty(); // 이전 상태 지우기
                console.log(response);

             // 공백을 제거하고 제출 여부 확인
                if (response && response.trim() === 'yes') {
                    $(statusId).append(`
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-check2-circle" viewBox="0 0 16 16">
                            <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0"/>
                            <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/>
                        </svg>
                    `); // 체크 표시
                } else if (response && response.trim() === 'no') {
                    $(statusId).append(`
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                        </svg>
                    `); // X 표시
                } else {
                    $(statusId).text('알 수 없는 응답입니다.'); // 예상치 못한 응답 처리
                }
            },
            error: function() {
                const statusId = '#taskStatus_' + t_number; // 고유한 ID로 선택
                $(statusId).text('오류가 발생했습니다.');
            }
        });
    });
});
</script>
</body>
</html>