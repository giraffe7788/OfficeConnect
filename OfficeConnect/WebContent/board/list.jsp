<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>    
<%@ page import="java.util.*" %>

<
<%
     ArrayList<BoardVO> list=(ArrayList<BoardVO>)request.getAttribute("boardList");

%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
<script type="text/javascript">
  function deleteFn(num){
	  location.href="/OfficeConnect/boardDelete.do?num="+num; // ?num=12
  }
</script>
</head>
<body>

<h3>게시판</h3>
<table class="table table-bordered">
  <tr>
    <td>번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>날짜</td>
    <td>조회수</td>
 
  </tr>
  <% for(BoardVO vo : list) { %>

    	  <tr>
    	    <td><%=vo.getBrdNo()%></td>
    	    <td><a href="<%=request.getContextPath()%>/board/detail.do?brdNo=<%=vo.getBrdNo()%>"><%=vo.getBrdTitle()%></a></td>
    	    <td><%=vo.getEmpNo()%></td>
    	    <td><%=vo.getBrdDateDisplay()%></td>
    	    <td><%=vo.getBrdViews()%></td>    	 	
    	  </tr>    	
    	  
 <% } %>
  <tr>
  <td colspan="8" align="right"><input type="button" value="작성" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/board/insert.do'"/></td>
  </tr>
</table>
</body>
</html>