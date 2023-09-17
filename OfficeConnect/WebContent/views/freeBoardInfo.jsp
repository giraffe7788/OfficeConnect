<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.SessionEmpInfo"%>
<%@page import="util.TransEmpInfo"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<%
BoardVO boardVO = (BoardVO)request.getAttribute("boardVO");
System.out.println("boardVO : " + boardVO);
String empNo = (String) session.getAttribute("empNo");
System.out.println("empNo : " + empNo);
System.out.println("boardVO : " + boardVO.getEmpNo());
EmpVO sessionVO = SessionEmpInfo.getInstance().getEmpVO(empNo);
System.out.println("sessionVO : " + sessionVO);
TransEmpInfo transfer = TransEmpInfo.getInstance();
// 이거는 아래 VO는 현재 게시글 쓴 사람의 VO (직급or부서or작성자이름 등등 떙겨오려고)
/* EmpVO empVO = (EmpVO) request.getAttribute("empVO"); */
%>


<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title> <%=boardVO.getBrdNo()%>번 게시판</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
/* #commCont{
border:none; input:focus {outline: none;} 
} */
#commCont{
	resize: none;
    border: none;
     overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;  
      height: auto;
      width: 100%;
      min-height: 30px; 
     
}
#commCont:focus{ 
    outline:none; 
 } 


    
</style>
</head>
<body id="page-top">



	<!-- 페이지 Wrapper -->
	<div id="wrapper">


		<!-- 사이드바 include -->
		<%@ include file="./aside.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 Content -->
			<div id="content">

				<!-- 헤더 include -->
				<%@ include file="./header.jsp"%>

				<!-- 페이지 Content 시작 -->
				<div class="container-fluid">
					<input type="hidden" name="brdNo" value="<%=boardVO.getBrdNo()%>">
					<!-- 보드 번호 넘겨줌-->
					<!-- 페이지 내 헤더 -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4"
						id="mainbutton">
						<!-- 게시판 수정 삭제 버튼 숨기기 -->
						<h1 class="h3 mb-0 text-gray-800">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=boardVO.getBrdTitle()%></h1>
						<a
							onclick="return confirm('삭제하시겠습니까?')"
							href='<%=request.getContextPath()%>/board/delete.do?brdNo=<%=boardVO.getBrdNo()%>'
							class="btn btn-danger btn-circle"
							style="position: absolute; margin-left: 68%"> <i
							class="fas fa-trash"></i>
						</a> 
						<a
							href='<%=request.getContextPath()%>/board/update.do?brdNo=<%=boardVO.getBrdNo()%>'
							class="btn btn-info btn-circle"
							style="position: absolute; margin-left: 64%"> <i
							class="fa-solid fa-pen-to-square"></i>
						</a>
					</div>


					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<!-- 공지사항 내용 -->
							<div class="card mb-4">
								<div class="card-header">
									<%=boardVO.getDeptName()%>&nbsp;&nbsp;<%=boardVO.getEmpPosit()%>&nbsp;&nbsp;<%=boardVO.getEmpName()%> <span style="float: right"><%=boardVO.getBrdModDisplay()%></span></div>
								<div class="card-body" style="height: 60vh">
									<%=boardVO.getBrdCont()%></div>
									<div class="card-body">
									<span><strong>Comments &nbsp;&nbsp;&nbsp;<span id="cCnt"></span></strong></span> 
									</div>

							</div>
						</div>
				
						
						<div class="col-lg-8" >					
								<div id="commentList"></div>
								<div class="card mb-4">
								
									<div class="card-header">
										<input type="hidden" id="empNo" value="<%=empNo%>">
										<input type="hidden" id="brdNo"value="<%=boardVO.getBrdNo()%>"> 
										<%=transfer.transformDeptCode(sessionVO.getDeptCode())%>&nbsp;&nbsp;<%=sessionVO.getEmpPosit()%>&nbsp;&nbsp;<%=sessionVO.getEmpName()%>
										 
									</div>
									<div class="card-body">
										<textarea placeholder="댓글을 입력해주세요" id="commCont" name="commCont"  autofocus  maxlength='3000' ></textarea>
									</div>
								</div>
								
							
						</div>
					</div>

					<div class="row" style="justify-content: center; margin-bottom: 2%">
						<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
							class="icon text-white-50"> <i
								class="fa-solid fa-right-to-bracket"></i>
						</span> <span class="text"
							onclick="location.href='<%=request.getContextPath()%>/board/list.do'">목록으로</span>
						</a> <a href="#" class="btn btn-primary btn-icon-split btn-lg"
							style="margin-left: 3%"> <span class="icon text-white-50">
								<i class="fa-solid fa-pen"></i>
						</span> <span class="text" id="add" onclick="fn_comment()">댓글작성</span>
						</a>
		
					</div>

				</div>

			</div>
			<!-- 페이지 Content 끝 -->

		</div>
		<!-- 메인 Content 끝 -->

	</div>
	<!-- Content Wrapper 끝 -->

	</div>
	<!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->
	<%@ include file="./common.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		// 자기가 작성한 글이 아니면서 + 본인이 관리자도 아니면 display : none 적용
	if (<%=empNo%> !== <%=boardVO.getEmpNo()%> && <%=sessionVO.getAdminCode()%> !==1 ) {
			$('#mainbutton').find('a').css('display','none');	
		}
	
	function call_confirm(){
		
		if(confirm("삭제하시겠습니까?")){
		}
	}

	
		function fn_comment() {
		
			var sendData = { "empNo":<%=empNo%>, "brdNo":<%=boardVO.getBrdNo()%>, "commCont" : $("#commCont").val()}
			$.ajax({
				
			 	url : "../comment/insert.do",
				type : "post",
				data : sendData,
				success : function(cnt){
					
		            if(cnt==1){
 		            	getcommentList();
		                $("#commCont").val("");		  
		                $("#commCOnt").css('rows','1')
		             }
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				} 
			});
		}

 		$(function() {
			getcommentList()
		
		}); 
 
		function getcommentList() {
			console.log("댓글list ajax  왔음")
			$.ajax({
				url : "../comment/list.do", // 서버로 요청
				type : "get",
				data : { "brdNo" :<%=boardVO.getBrdNo()%>},
				dataType : "json",
				success : function(data) {
					
					  var html = "";
			            var cCnt = data.length;
			        	console.log("댓글list ajax  왔음2")
			            if(data.length > 0){
			         
			            	
			                html+= "<div class='row' style='justify-content: center'>";
			            	 $.each(data, function(index, obj){
			            		 var currentDate = new Date(obj.commDate);
			            		 var dateString = currentDate.toLocaleDateString();
			            		   html += "<div class='col-lg-12'>";
			                       html += "<div class='card mb-4' id='Form"+ obj.commNo +"'>";
			                       html += "<div class='card-header' id='abc"+obj.commNo+"'><span id='emp"+obj.commNo+"'>" + obj.deptName +"&nbsp;&nbsp;" +obj.empPosit +"&nbsp;&nbsp;"+ obj.empName+ ""; 
			                       html += "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + dateString		
			                       
			                       if ( empNo.value == obj.empNo || <%=sessionVO.getAdminCode()%> == 1 ){
			                       html += "<span id='btn"+obj.commNo+"' style='float: right'><a  href='javascript:void(0)' onclick='updateForm("+obj.commNo+")' class='btn btn-info btn-circle btn-sm' style='margin-top:-0.2%'>";
			                       html += "<i class='fa-solid fa-pen-to-square'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			                       html += "<a  href='javascript:void(0)' onclick='deleteFn("+obj.commNo+")' class='btn btn-danger btn-circle btn-sm' style='margin-top:-0.2%'>";
			                       html += "<i class='fas fa-trash'></i></a></span>";
			                       }
			                       html += "</div>";
			                       html += "<div class='card-body' id='cont"+obj.commNo+"'  style='white-space:pre;'>" + obj.commCont;		           
			                       html += "</div>";
			                       html += "</div>";
			                       html += "</div>";
			                       
			            	 })

			            	  
			            	html +="<div>";
			            } else {
			                
			                html += "<div>";
			                html += "<div><table><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			                html += "</table></div>";
			                html += "</div>";
			            }
			      
			            $("#cCnt").html(cCnt);
			            $("#commentList").html(html);
			            
			            },
			            error : function(xhr) {
							alert("상태 : " + xhr.status);} 
				
			});
		}
		  function deleteFn(num){
			  if(confirm("삭제하시겠습니까?")){
				
			  $.ajax({		  
				  url : "../comment/delete.do",
				  type : "get",
				  data : {"commNo" : num},
				  success : function(cnt){						
			            if(cnt==1){
	 		            	getcommentList();           
			             }
					},
				  error : function(){ alert("error");  }
			  });
		  }
		  }
		  function updateForm(commNo){
			  var emp = $("#emp"+commNo).text();
			  var cont = $("#cont"+commNo).text();
			 
		
			 
			  var Form  = "<div class='card-header' >"+emp +"<span style='float: right'><input type='button'  value='취소' onclick='getcommentList()' >&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' style='float: right' value='등록' onclick='updateFn("+ commNo+ ")' ></span></div>";
			  	  Form += "<textarea id='cont' class='autosize' onkeydown='resize(this)' onkeyup='resize(this)' autofocus  maxlength='3000' >"+cont+"</textarea>";
			  $("#Form"+commNo).html(Form);
			  
		  }
		  function updateFn(num){
			  
			  var cont = $('#cont').val();
			  alert(cont);
			  alert(num);
			  $.ajax({		  
				  url : "../comment/update.do",
				  type : "post",
				  dataType : "json",
				  data : {"commNo" : num, "commCont" : cont },
				  success : function(cnt){						
			            if(cnt==1){
			            	getcommentList();           
			             }
					},
				  error : function(){ alert("error");  }
			  });
		  }
			
		  function resize(obj) {
			  obj.style.height = 1;
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}
	</script>

</body>

</html>