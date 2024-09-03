<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
// 세션에서 사용자 정보 가져오기
HttpSession httpSession = request.getSession();
String userId = (String) httpSession.getAttribute("userId");
String password = (String) httpSession.getAttribute("password");
String address = (String) httpSession.getAttribute("address");
String phonenumber = (String) httpSession.getAttribute("phone");
%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="img/data/mypage.png">
    <title>My Page</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                       <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.jsp"><span class="icon_like"></span>&ensp;High Five</a></li>
                            </ul>
                        </nav>
                    </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="./index.jsp">HomePage</a></li>
                                <li><a href="./contents.jsp">Contents</a></li>
                                <li class="active"><a href="./mypage.jsp">My Page</a></li>                  
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">

                        <% if (session.getAttribute("userId") != null) { %>
                            <a href="mypage.jsp"><span class="arrow_right_alt"></span> Logout</a>
                        <% } else { %>
                             <a href="./join.jsp"><span class="arrow_right_alt"></span> Join</a>            
                        <a href="./login.jsp"><span class="icon_profile"></span> Login</a>
                        <% } %>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->
<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="img/ott.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>My Page</h2>
                    <p>Welcome to the High Five OTT</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>My Page</h3>
                    <form action="#">
                        <div class="input__item">
                            <input type="text" class="form-control" placeholder="ID" value="id : &nbsp;<%= session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>" readonly />
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" class="form-control" placeholder="Password" value="Password : &nbsp;<%= session.getAttribute("password") != null ? session.getAttribute("password") : "" %>" readonly />
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item">
                           <input type="text" class="form-control" placeholder="address" value="address : &nbsp;<%= session.getAttribute("address") != null ? session.getAttribute("address") : "" %>" readonly />
                           <span class="icon_tags"></span>
                       </div>
                        <div class="input__item">
                           <input type="text" class="form-control" placeholder="Phone number" value="Phone number : &nbsp;<%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %>" readonly />
                           <span class="icon_phone"></span>
                       </div>
                        <button type="submit" class="site-btn">Login Now</button>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__register">
                   <div class="product__item__pic set-bg" data-setbg="img/contents/squidgame.jpg">
                </div>
            </div>
        </div>
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Login Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
<div class="page-up">
    <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="footer__logo">
                <a href="./index.html"><img src="img/logo.png" alt=""></a>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="footer__nav">
                <ul>
                       <li class="active"><a href="./index.jsp">HomePage</a></li>
                    <li><a href="./contents.jsp">Contents</a></li>
                    <li><a href="./mypage.jsp">My Page</a></li>
                </ul>
            </div>
        </div>
        <div class="col-lg-3">
            <p>
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with</i> by DoHyun LEE</a>
             </p>

          </div>
      </div>
  </div>
</footer>

  <!-- Search model Begin -->
  <div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>
