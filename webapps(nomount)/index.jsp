<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>

<% HttpSession session2 = request.getSession(true);
String userId = (String) session.getAttribute("userId");
String userType = (String) session.getAttribute("userType");

// Check if the user is logged in
boolean isLoggedIn = (userId != null && !userId.isEmpty());
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="img/data/movie.png">
    <title>HighFive</title>

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
                            <li class="active"><a href="./index.jsp">HomePage</a></li>
                                            <li><a href="./contents.jsp">Contents</a></li>              
                            <li><a href="./mypage.jsp">My Page</a></li>
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
<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="img/homepage/main.jpg">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">Netfilx</div>
                            <h2>NetFlix</h2>
                            <p>Watch TV Shows Online, Watch Movies Online</p>
                            <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="img/homepage/tving.jpg">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">Tving</div>
                            <h2>TVING</h2>
                            <p>TVING ORIGINAL</p>
                            <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="img/homepage/marvel.jpg">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">Disney</div>
                            <h2>DISNEY/MARVEL</h2>
                            <p>Walt Diseny</p>
                            <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Hero Section End -->
<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">

</div>
</div>
</section>
<!-- Product Section End -->

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
<!-- Footer Section End -->
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
