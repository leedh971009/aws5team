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
    <link rel="icon" href="img/data/join.png">
    <title>Join</title>

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
    <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    if (request.getMethod().equalsIgnoreCase("post")) {
    if (id == null || id.isEmpty() || password == null || password.isEmpty()) {
        out.println("<script>alert('ID와 Password는 필수 입력 항목입니다.'); </script>");
    } else {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://database-1.cn482mka8n93.ap-northeast-2.rds.amazonaws.com:3306/test";
            String dbUser = "hf";
            String dbPass = "1234";

            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            String sql = "INSERT INTO users (id, password, address, phone) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            pstmt.setString(3, address);
            pstmt.setString(4, phone);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<script>alert('회원가입 성공!'); location.href='index.jsp';</script>");
            } else {
                out.println("<script>alert('회원가입 실패!'); </script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
           // out.println("<h3>회원가입 중 오류 발생!</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
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
                    <h2>Join</h2>
                   <p>Welcome to the High Five OTT</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>Join</h3>
                    <form action="join.jsp" method="post">
                        <div class="input__item">
                            <input type="text" placeholder="Your id" name="id">
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Password" name="password">
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="address" name="address">
                            <span class="icon_tags"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Phone number" name="phone">
                            <span class="icon_phone"></span>
                        </div>

                        <button type="submit" class="site-btn">Login Now</button>
                    </form>
                    <h5>Already have an account? <a href="#">Log In!</a></h5>
                </div>
            </div>
            <div class="col-lg-6">
                 <div class="login__register">
                    <div class="product__item__pic set-bg" data-setbg="img/contents/yumi.jpg">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

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
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with</i> by DoHyun LEE</a>

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
