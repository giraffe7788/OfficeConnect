<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
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
<script type="text/javascript" src="../../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "../../se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
</head>
<body>
<h1>게시판</h1>
<form atcion="<%=request.getContextPath()%>/board/insert.do" method="post">
<div class="form-group">
  <label for="title">title:</label>
  <input type="text" class="form-control" name="title">
</div>
<div class="form-group">
  <label for="cont">Comment:</label>
    <iframe src="SmartEditor2Skin.html" width="300" height="300">
    <textarea class="form-control" name="ir1" id="ir1" rows="10" cols="100"></textarea>
 </iframe>
  <textarea class="form-control" rows="5" name="comment"></textarea><br>
  
  <input type="submit" value="게시판 등록">
</div>	
</form>
</body>
</html>