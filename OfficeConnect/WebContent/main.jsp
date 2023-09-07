<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <title>오피스커넥트</title>
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
    <main id="wrap">
        <aside id="sidebar">
            <div id="sidebtn">
                <button type="button" onclick="alert('클릭됨?')">
                    <img src="images/바로가기편집최종.png" alt="바로가기편집" class="sbtn">
                </button> <br>
                <!-- <span>바로가기편집</span> <br> -->
                <button type="button" onclick="alert('클릭됨?')">
                    <img src="images/조직도최종.png" alt="조직도" class="sbtn">
                </button> <br>
                <span>조직도조회</span> <br>
                <button type="button" onclick="alert('클릭됨?')">
                    <img src="images/메일최종.png" alt="메일함" class="sbtn">
                </button> <br>
                <span>메일함</span> <br>
                <button type="button" onclick="alert('클릭됨?')">
                    <img src="images/결제최종.png" alt="결재" id="addrbtn">
                </button> <br>
                <span>결재</span> <br>
            </div>
        </aside>
        <article id="content">
            <div id="inner">
                <div id="imgbox" class="conbox">
                    <h4>회사이미지박스</h4>
                </div>
                <div id="cal" class="conbox">
                    <h4 class="h4_cal">일정</h4>
                </div>
                <div id="addr" class="conbox">
                    <h4 class="h4_addr">전자결재</h4>
                </div>
                <div id="allboard" class="conbox">
                    <h4 class="h4_board">공지사항</h4>
                </div>
                <div id="freeboard" class="conbox">
                    <h4 class="h4_board">자유게시판</h4>
                </div>
                <div id="meetingRoom" class="conbox">
                    <h4 class="h4_meetRoom">회의실예약</h4>
                </div>
                <div id="mail" class="conbox">
                    <h4 class="h4_mail">메일함</h4>
                </div>
                <div id="car" class="conbox">
                    <h4 class="h4_car">차량배차</h4>
                </div>
            </div>
        </article>
    </main>

</body>

</html>