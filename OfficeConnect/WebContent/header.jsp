<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header id="header">
        <a id="logo" href="#">
            <img src="images/로고.png" alt="로고" class="logoimg">
        </a>
        <nav id="topmenu">
            <ul>
                <li class="navli"><a href="#">협 업</a>
                    <hr>
                    <div class="sub">
                        <a href="#">Office mail</a>
                        <a href="#">전자결재</a>
                        <a href="#">조직도 조회</a>
                    </div>
                </li>
                <!-- <li>|</li> -->
                <li class="navli"><a href="#">소통</a>
                    <hr>
                    <div class="sub">
                        <a href="#">회사연혁</a>
                        <a href="#">공지사항</a>
                        <a href="#">자유게시판</a>
                    </div>
                </li>
                <!-- <li>|</li> -->
                <li class="navli"><a href="#">업무지원</a>
                    <hr>
                    <div class="sub">
                        <a href="#">회의실예약</a>
                        <a href="#">차량예약</a>
                        <a href="#">근무태도평가</a>
                    </div>
                </li>
                <li class="navli"><a href="#">비지니스</a>
                    <hr>
                    <div class="sub">
                        <a href="#">마이페이지</a>
                        <a href="#">관리자설정</a>
                    </div>
                </li>
            </ul>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script>
                $('.navli').on('mouseover', function () {
                    $('.sub', this).attr('style', 'display: block;');
                        });
           
                $('.navli').on('mouseout', function () {
                    $('.sub', this).attr('style', 'display: none;');
                        });



            </script>


        </nav>
        <div id="minebox">
            <button id="mypage" type="button" onclick="alert('클릭됨?')">
                <img src="images/마이페이지최종.png" alt="마이페이지">
            </button>
            <button id="logout" type="button" onclick="alert('클릭됨?')">
                <img src="images/로그아웃최종.png" alt="로그아웃">
            </button>
        </div>
    </header>

</body>
</html>