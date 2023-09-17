<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8");
String empNo = (String)session.getAttribute("empNo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>게시판</h1>
<form atcion="<%=request.getContextPath()%>/board/insert.do" method="post">
<div class="form-group">
  <label for="title">title:</label>
  <input type="text" class="form-control" name="brdTitle">
  <input type="hidden" name="empNo" value="<%=empNo%>">

</div>
<div class="form-group">
  <label for="cont">Comment:</label>


  <textarea class="form-control" rows="5" name="brdCont"></textarea><br>
  
  <input type="submit" value="게시판 등록">
</div>	
</form>


</body>
</html>