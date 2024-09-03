<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="data/img/data/mypage.png">
    <title>Login</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="data/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="data/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="data/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="data/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="data/css/style.css" type="text/css">
</head>

<body>
    <%
    // 폼이 제출되었는지 확인
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcUrl = "jdbc:mysql://hf-db.cn482mka8n93.ap-northeast-2.rds.amazonaws.com:3306/test";
        String dbUser = "hf";
        String dbPass = "1234";

        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            String sql = "SELECT * FROM users WHERE id = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 로그인 성공 시 세션에 사용자 정보 저장
                session.setAttribute("userId", id);
                session.setAttribute("password", password);
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("phone", rs.getString("phone"));
                // 성공 알림 후 메인 페이지로 이동
                out.println("<script>alert('로그인 성공!'); location.href='index.jsp';</script>");
            } else {
                // 로그인 실패 시 메시지 출력
                out.println("<script>alert('로그인 실패. ID 또는 패스워드를 확인하세요.');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('데이터베이스 연결 오류'); history.back();</script>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // 로그아웃 동작 처리
    String action = request.getParameter("action");
    if ("logout".equals(action)) {
        // 세션 무효화
        session.invalidate();
        // 로그아웃 알림 후 메인 페이지로 이동
        out.println("<script>alert('로그아웃 되었습니다.'); location.href='index.jsp';</script>");
    }
%>
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
                                <li> <a href="./mypage.jsp">My Page</a></li>                                
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
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
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="data/img/ott.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Login</h2>
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
                    <h3>Login</h3>
                    <form action="login.jsp" method="post">
                        <div class="input__item">
                            <input type="text" placeholder="Email address" name="id">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Password" name="password">
                            <span class="icon_lock"></span>
                        </div>
                        <button type="submit" class="site-btn">Login Now</button>
                    </form>
                    <a href="#" class="forget_pass">Forgot Your Password?</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__register">
                                    <div class="product__item__pic set-bg" data-setbg="data/img/contents/inside.jpg">
                </div>
            </div>
        </div>
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <span></span>
                        <ul>

                        </ul>
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
                <a href="./index.html"><img src="data/img/logo.png" alt=""></a>
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
<script src="data/js/jquery-3.3.1.min.js"></script>
<script src="data/js/bootstrap.min.js"></script>
<script src="data/js/player.js"></script>
<script src="data/js/jquery.nice-select.min.js"></script>
<script src="data/js/mixitup.min.js"></script>
<script src="data/js/jquery.slicknav.js"></script>
<script src="data/js/owl.carousel.min.js"></script>
<script src="data/js/main.js"></script>


</body>

</html>
