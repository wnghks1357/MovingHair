<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!-- Header -->
<header class="header">
  <div class="container">
    <div class="row">
      <div class="col">
        <div class="header_content d-flex flex-row align-items-center justify-content-start">
          <div class="logo">
            <a href="/home.do">
              <div>Moving Hair</div>
              <div>The best service</div>
            </a>
          </div>
          <nav class="main_nav">
            <ul class="d-flex flex-row align-items-center justify-content-start">
              <li class="active"><a href="/home.do">홈</a></li>
              <li><a href="/myReservationPage.do">예약 관리</a></li>
              <li><a href="/eventList.do">이벤트</a></li>
              <li><a href="#">회원 서비스</a>
              	<ul>
              		<li><a href="/myPage.do">회원 정보 수정</a>
              		<li><a href="/myPointPage.do">나의 포인트 내역</a>
              		<li><a href="/myQna.do">나의 질문</a>
              	</ul>
              </li>
              <li><a href="#">고객센터</a>
              	<ul>
          			<li><a href="/csNotice.do">공지사항</a>
              		<li><a href="/csFaq.do">FAQ</a>
              	</ul>
              </li>
            </ul>
          </nav>
          <div class="header_extra d-flex flex-row align-items-center justify-content-start ml-auto">
<!--             <div class="phone d-flex flex-row align-items-center justify-content-start"><i class="fa fa-phone" aria-hidden="true"></i><span>02-345-3222</span></div> -->
            <div class="book_button trans_200" style="margin-left: 50px;"><a href="#">Book Now</a></div>
            
            <div class="book_button trans_200" id="logoutBtn" style="margin-left: 200px; width: 80px;"><a href="logoutProc.do">로그아웃</a></div>
          </div>
          <div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- Menu -->

<div class="menu">
  <div class="background_image" style="background-image:url(resources/images/bootstrapTemplate/menu.jpg)"></div>
  <div class="menu_content d-flex flex-column align-items-center justify-content-center">
    <ul class="menu_nav_list text-center">
      <li><a href="/home.do">홈</a></li>
      <li><a href="/myReservationPage.do">예약 관리</a></li>
      <li><a href="/eventList.do">이벤트</a></li>
      <li><a href="/myPage.do">회원 정보 수정</a></li>
      <li><a href="/myPointPage.do">나의 포인트 내역</a></li>
      <li><a href="/myQna.do">나의 질문</a>
      <li><a href="/csNotice.do">공지사항</a></li>
      <li><a href="/csFaq.do">FAQ</a></li>      
    </ul>
    <div class="menu_review"><a href="#">Book Now</a></div>
  </div>
</div>

<!-- Home -->

<!-- <div class="home">
  <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="resources/images/bootstrapTemplate/index.jpg" data-speed="0.8"></div>
  <div class="home_container">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="home_content text-center">
            <div class="home_title"><h1>Luxury & Compfort</h1></div>
            <div class="home_text">In vitae nisi aliquam, scelerisque leo a, volutpat sem. Vivamus rutrum dui fermentum eros hendrerit, id lobortis leo volutpat. Maecenas sollicitudin est in libero pretium interdum.</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div> -->