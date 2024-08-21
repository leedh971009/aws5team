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
    <link rel="icon" href="img/data/movie.png">
    <title>Contents</title>

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
                                <li class="active"><a href="./contents.jsp">Contents</a></li>                          
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
                             <a href="./join.jsp"><span class="arrow_right_alt"></span> join</a>                        
                        <a href="./login.jsp"><span class="icon_profile"></span> Login</a>
                        <% } %>
                         
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.jsp"><i class="fa fa-home"></i>Home&ensp;></a>
                        <a href="./contents.jsp">&ensp;Contents&ensp;</a>                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>CONTENTS</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>                                       
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                               <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        PreparedStatement updateStmt = null;

                        // Define JDBC connection parameters
                        String jdbcDriver = "com.mysql.jdbc.Driver";
                        String jdbcUrl = "jdbc:mysql://43.201.29.10:3307/test";
                        String dbUser = "hf";
                        String dbPass = "1234";

                        try {
                            // Load the JDBC driver
                            Class.forName(jdbcDriver);

                            // Establish connection
                            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

                            // Create statement and execute query
                            stmt = conn.createStatement();
                            String sql = "SELECT * FROM menu WHERE id=1;";
                            rs = stmt.executeQuery(sql);
                            
                            //String sql1 = "UPDATE menu SET PRICE=12.99 WHERE id=1;";
                            //updateStmt = conn.prepareStatement(sql1);
                            
                           // int rowsAffected = updateStmt.executeUpdate(sql1);

                            //System.out.println(rowsAffected + " rows updated.");
                            
                            // Display menu item details
                            if (rs.next()) {
                                String name = rs.getString("name");
                                int price = rs.getInt("price");
                                String platform = rs.getString("platform");
                                String CATEGORY = rs.getString("CATEGORY");
                                String COMMENT = rs.getString("COMMENT");
                                String VIEW = rs.getString("VIEW");
		                    %>
		                    <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="img/contents/begin_again.jpg">
                                        <div class="ep"><%= price %>₩</div>
                                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                    </div>
                                    <div class="product__item__text">
		                    
							<ul>
                                           <li><%= platform %></li>
                                           <li><%= CATEGORY %></li>
                                       </ul>
		                     <h5 style="color: white;"><%= name %></h5>
		
		                    <%
		                            }
		                        } catch (Exception e) {
		                            e.printStackTrace();
		                        } finally {
		                            // Close JDBC objects in the reverse order of their creation
		                            try {
		                                if (rs != null) rs.close();
		                                if (stmt != null) stmt.close();
		                                if (conn != null) conn.close();
		                            } catch (SQLException se) {
		                                se.printStackTrace();
		                            }
		                        }
		                    %>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                             <%
                        Connection conn2 = null;
                        Statement stmt2 = null;
                        ResultSet rs2 = null;
                        PreparedStatement updateStmt2 = null;

                        // Define JDBC connection parameters
                        String jdbcDriver2 = "com.mysql.jdbc.Driver";
                        String jdbcUrl2 = "jdbc:mysql://43.201.29.10:3307/test";
                        String dbUser2 = "hf";
                        String dbPass2 = "1234";

                        try {
                            // Load the JDBC driver
                            Class.forName(jdbcDriver2);

                            // Establish connection
                            conn2 = DriverManager.getConnection(jdbcUrl2, dbUser2, dbPass2);

                            // Create statement and execute query
                            stmt1 = conn2.createStatement();
                            String sql = "SELECT * FROM menu WHERE id=2;";
                            rs = stmt2.executeQuery(sql);
                            
                            //String sql2 = "UPDATE menu SET PRICE=12.99 WHERE id=2;";
                            //updateStmt = conn2.prepareStatement(sql2);
                            
                           // int rowsAffected = updateStmt2.executeUpdate(sql2);

                            //System.out.println(rowsAffected + " rows updated.");
                            
                            // Display menu item details
                            if (rs2.next()) {
                                String name = rs2.getString("name");
                                int price = rs2.getInt("price");
                                String platform = rs2.getString("platform");
                                String CATEGORY = rs2.getString("CATEGORY");
                                String COMMENT = rs2.getString("COMMENT");
                                String VIEW = rs2.getString("VIEW");
		                    %>
		                    <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="img/contents/showman.jpg">
                                        <div class="ep"><%= price %>₩</div>
                                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                    </div>
                                    <div class="product__item__text">
		                    
							<ul>
                                           <li><%= platform %></li>
                                           <li><%= CATEGORY %></li>
                                       </ul>
		                     <h5 style="color: white;"><%= name %></h5>
		
		                    <%
		                            }
		                        } catch (Exception e) {
		                            e.printStackTrace();
		                        } finally {
		                            // Close JDBC objects in the reverse order of their creation
		                            try {
		                                if (rs2 != null) rs2.close();
		                                if (stmt2 != null) stmt2.close();
		                                if (conn2 != null) conn2.close();
		                            } catch (SQLException se) {
		                                se.printStackTrace();
		                            }
		                        }
		                    %>
                                    </div>
                                </div>
                            </div>

                            <%
                            Connection conn3 = null;
                            Statement stmt3 = null;
                            ResultSet rs3 = null;
                            PreparedStatement updateStmt3 = null;
    
                            // Define JDBC connection parameters
                            String jdbcDriver3 = "com.mysql.jdbc.Driver";
                            String jdbcUrl3 = "jdbc:mysql://43.201.29.10:3307/test";
                            String dbUser3 = "hf";
                            String dbPass3 = "1234";
    
                            try {
                                // Load the JDBC driver
                                Class.forName(jdbcDriver3);
    
                                // Establish connection
                                conn3 = DriverManager.getConnection(jdbcUrl3, dbUser3, dbPass3);
    
                                // Create statement and execute query
                                stmt3 = conn.createStatement();
                                String sql = "SELECT * FROM menu WHERE id=3;";
                                rs3 = stmt3.executeQuery(sql);
                                
                                //String sql3 = "UPDATE menu SET PRICE=12.99 WHERE id=3;";
                                //updateStmt3 = conn.prepareStatement(sql3);
                                
                               // int rowsAffected = updateStmt.executeUpdate(sql3);
    
                                //System.out.println(rowsAffected + " rows updated.");
                                
                                // Display menu item details
                                if (rs3.next()) {
                                    String name = rs3.getString("name");
                                    int price = rs3.getInt("price");
                                    String platform = rs3.getString("platform");
                                    String CATEGORY = rs3.getString("CATEGORY");
                                    String COMMENT = rs3.getString("COMMENT");
                                    String VIEW = rs3.getString("VIEW");
                                %>
                                <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/contents/up.jpg">
                                            <div class="ep"><%= price %>₩</div>
                                            <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                            <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                        </div>
                                        <div class="product__item__text">
                                
                                <ul>
                                               <li><%= platform %></li>
                                               <li><%= CATEGORY %></li>
                                           </ul>
                                 <h5 style="color: white;"><%= name %></h5>
            
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        // Close JDBC objects in the reverse order of their creation
                                        try {
                                            if (rs3 != null) rs3.close();
                                            if (stmt3 != null) stmt3.close();
                                            if (conn3 != null) conn3.close();
                                        } catch (SQLException se) {
                                            se.printStackTrace();
                                        }
                                    }
                                %>
                                        </div>
                                    </div>
                                </div>
                                <%
                                Connection conn4 = null;
                                Statement stmt4 = null;
                                ResultSet rs4 = null;
                                PreparedStatement updateStmt4 = null;
        
                                // Define JDBC connection parameters
                                String jdbcDriver4 = "com.mysql.jdbc.Driver";
                                String jdbcUrl4 = "jdbc:mysql://43.201.29.10:3307/test";
                                String dbUser4 = "hf";
                                String dbPass4 = "1234";
        
                                try {
                                    // Load the JDBC driver
                                    Class.forName(jdbcDriver4);
        
                                    // Establish connection
                                    conn4 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
        
                                    // Create statement and execute query
                                    stmt = conn4.createStatement();
                                    String sql = "SELECT * FROM menu WHERE id=4;";
                                    rs = stmt4.executeQuery(sql);
                                    
                                    //String sql4 = "UPDATE menu SET PRICE=12.99 WHERE id=4;";
                                    //updateStmt4 = conn.prepareStatement(sq4);
                                    
                                   // int rowsAffected = updateStmt4.executeUpdate(sql4);
        
                                    //System.out.println(rowsAffected + " rows updated.");
                                    
                                    // Display menu item details
                                    if (rs4.next()) {
                                        String name = rs4.getString("name");
                                        int price = rs4.getInt("price");
                                        String platform = rs4.getString("platform");
                                        String CATEGORY = rs4.getString("CATEGORY");
                                        String COMMENT = rs4.getString("COMMENT");
                                        String VIEW = rs4.getString("VIEW");
                                    %>
                                    <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg" data-setbg="img/contents/ironman.jpg">
                                                <div class="ep"><%= price %>₩</div>
                                                <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                                <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                            </div>
                                            <div class="product__item__text">
                                    
                                    <ul>
                                                   <li><%= platform %></li>
                                                   <li><%= CATEGORY %></li>
                                               </ul>
                                     <h5 style="color: white;"><%= name %></h5>
                
                                    <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            // Close JDBC objects in the reverse order of their creation
                                            try {
                                                if (rs4 != null) rs4.close();
                                                if (stmt4 != null) stmt4.close();
                                                if (conn4 != null) conn4.close();
                                            } catch (SQLException se) {
                                                se.printStackTrace();
                                            }
                                        }
                                    %>
                                            </div>
                                        </div>
                                    </div>


                           
                                    <%
                                    Connection conn5 = null;
                                    Statement stmt5 = null;
                                    ResultSet rs5 = null;
                                    PreparedStatement updateStmt5 = null;
            
                                    // Define JDBC connection parameters
                                    String jdbcDriver5 = "com.mysql.jdbc.Driver";
                                    String jdbcUrl5 = "jdbc:mysql://43.201.29.10:3307/test";
                                    String dbUser5 = "hf";
                                    String dbPass5 = "1234";
            
                                    try {
                                        // Load the JDBC driver
                                        Class.forName(jdbcDriver5);
            
                                        // Establish connection
                                        conn5 = DriverManager.getConnection(jdbcUrl5, dbUser5, dbPass5);
            
                                        // Create statement and execute query
                                        stmt5 = conn.createStatement();
                                        String sql = "SELECT * FROM menu WHERE id=5;";
                                        rs5 = stmt5.executeQuery(sql);
                                        
                                        //String sql5 = "UPDATE menu SET PRICE=12.99 WHERE id=5;";
                                        //updateStmt5 = conn.prepareStatement(sql5);
                                        
                                       // int rowsAffected = updateStmt5.executeUpdate(sql5);
            
                                        //System.out.println(rowsAffected + " rows updated.");
                                        
                                        // Display menu item details
                                        if (rs5.next()) {
                                            String name = rs5.getString("name");
                                            int price = rs5.getInt("price");
                                            String platform = rs5.getString("platform");
                                            String CATEGORY = rs5.getString("CATEGORY");
                                            String COMMENT = rs5.getString("COMMENT");
                                            String VIEW = rs5.getString("VIEW");
                                        %>
                                        <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6">
                                            <div class="product__item">
                                                <div class="product__item__pic set-bg" data-setbg="img/contents/baseball.jpg">
                                                    <div class="ep"><%= price %>₩</div>
                                                    <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                                    <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                                </div>
                                                <div class="product__item__text">
                                        
                                        <ul>
                                                       <li><%= platform %></li>
                                                       <li><%= CATEGORY %></li>
                                                   </ul>
                                         <h5 style="color: white;"><%= name %></h5>
                    
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                // Close JDBC objects in the reverse order of their creation
                                                try {
                                                    if (rs5 != null) rs5.close();
                                                    if (stmt5 != null) stmt5.close();
                                                    if (conn5 != null) conn5.close();
                                                } catch (SQLException se) {
                                                    se.printStackTrace();
                                                }
                                            }
                                        %>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                        Connection conn6 = null;
                                        Statement stmt6 = null;
                                        ResultSet rs6 = null;
                                        PreparedStatement updateStmt6 = null;
                
                                        // Define JDBC connection parameters
                                        String jdbcDriver6 = "com.mysql.jdbc.Driver";
                                        String jdbcUrl6 = "jdbc:mysql://43.201.29.10:3307/test";
                                        String dbUser6 = "hf";
                                        String dbPass6 = "1234";
                
                                        try {
                                            // Load the JDBC driver
                                            Class.forName(jdbcDriver6);
                
                                            // Establish connection
                                            conn6 = DriverManager.getConnection(jdbcUrl6, dbUser6, dbPass6);
                
                                            // Create statement and execute query
                                            stmt6 = conn.createStatement();
                                            String sql = "SELECT * FROM menu WHERE id=6;";
                                            rs6 = stmt6.executeQuery(sql);
                                            
                                            //String sql6 = "UPDATE menu SET PRICE=12.99 WHERE id=6;";
                                            //updateStmt6 = conn6.prepareStatement(sql6);
                                            
                                           // int rowsAffected = updateStmt6.executeUpdate(sql6);
                
                                            //System.out.println(rowsAffected + " rows updated.");
                                            
                                            // Display menu item details
                                            if (rs6.next()) {
                                                String name = rs6.getString("name");
                                                int price = rs6.getInt("price");
                                                String platform = rs6.getString("platform");
                                                String CATEGORY = rs6.getString("CATEGORY");
                                                String COMMENT = rs6.getString("COMMENT");
                                                String VIEW = rs6.getString("VIEW");
                                            %>
                                            <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6">
                                                <div class="product__item">
                                                    <div class="product__item__pic set-bg" data-setbg="img/contents/Transferring_Love.jpg">
                                                        <div class="ep"><%= price %>₩</div>
                                                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                                    </div>
                                                    <div class="product__item__text">
                                            
                                            <ul>
                                                           <li><%= platform %></li>
                                                           <li><%= CATEGORY %></li>
                                                       </ul>
                                             <h5 style="color: white;"><%= name %></h5>
                        
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                } finally {
                                                    // Close JDBC objects in the reverse order of their creation
                                                    try {
                                                        if (rs6 != null) rs6.close();
                                                        if (stmt6 != null) stmt6.close();
                                                        if (conn6 != null) conn6.close();
                                                    } catch (SQLException se) {
                                                        se.printStackTrace();
                                                    }
                                                }
                                            %>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                            Connection conn7 = null;
                                            Statement stmt7 = null;
                                            ResultSet rs7 = null;
                                            PreparedStatement updateStmt7 = null;
                    
                                            // Define JDBC connection parameters
                                            String jdbcDriver7 = "com.mysql.jdbc.Driver";
                                            String jdbcUrl7 = "jdbc:mysql://43.201.29.10:3307/test";
                                            String dbUser7 = "hf";
                                            String dbPass7 = "1234";
                    
                                            try {
                                                // Load the JDBC driver
                                                Class.forName(jdbcDriver7);
                    
                                                // Establish connection
                                                conn7 = DriverManager.getConnection(jdbcUrl7, dbUser7, dbPass7);
                    
                                                // Create statement and execute query
                                                stmt7 = conn7.createStatement();
                                                String sql = "SELECT * FROM menu WHERE id=7;";
                                                rs7 = stmt7.executeQuery(sql);
                                                
                                                //String sql7 = "UPDATE menu SET PRICE=12.99 WHERE id=7;";
                                                //updateStmt7 = conn7.prepareStatement(sql7);
                                                
                                               // int rowsAffected = updateStmt7.executeUpdate(sql7);
                    
                                                //System.out.println(rowsAffected + " rows updated.");
                                                
                                                // Display menu item details
                                                if (rs7.next()) {
                                                    String name = rs7.getString("name");
                                                    int price = rs7.getInt("price");
                                                    String platform = rs7.getString("platform");
                                                    String CATEGORY = rs7.getString("CATEGORY");
                                                    String COMMENT = rs7.getString("COMMENT");
                                                    String VIEW = rs7.getString("VIEW");
                                                %>
                                                <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6">
                                                    <div class="product__item">
                                                        <div class="product__item__pic set-bg" data-setbg="img/contents/spiderman.jpg">
                                                            <div class="ep"><%= price %>₩</div>
                                                            <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                                            <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                                        </div>
                                                        <div class="product__item__text">
                                                
                                                <ul>
                                                               <li><%= platform %></li>
                                                               <li><%= CATEGORY %></li>
                                                           </ul>
                                                 <h5 style="color: white;"><%= name %></h5>
                            
                                                <%
                                                        }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    } finally {
                                                        // Close JDBC objects in the reverse order of their creation
                                                        try {
                                                            if (rs7 != null) rs7.close();
                                                            if (stmt7 != null) stmt7.close();
                                                            if (conn7 != null) conn7.close();
                                                        } catch (SQLException se) {
                                                            se.printStackTrace();
                                                        }
                                                    }
                                                %>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                Connection conn8 = null;
                                                Statement stmt8 = null;
                                                ResultSet rs8 = null;
                                                PreparedStatement updateStmt8 = null;
                        
                                                // Define JDBC connection parameters
                                                String jdbcDriver8 = "com.mysql.jdbc.Driver";
                                                String jdbcUrl8 = "jdbc:mysql://43.201.29.10:3307/test";
                                                String dbUser8 = "hf";
                                                String dbPass8 = "1234";
                        
                                                try {
                                                    // Load the JDBC driver
                                                    Class.forName(jdbcDriver8);
                        
                                                    // Establish connection
                                                    conn8 = DriverManager.getConnection(jdbcUrl8, dbUser8, dbPass8);
                        
                                                    // Create statement and execute query
                                                    stmt8 = conn8.createStatement();
                                                    String sql = "SELECT * FROM menu WHERE id=8;";
                                                    rs8 = stmt8.executeQuery(sql);
                                                    
                                                    //String sql8 = "UPDATE menu SET PRICE=12.99 WHERE id=8;";
                                                    //updateStmt8 = conn8.prepareStatement(sql8);
                                                    
                                                   // int rowsAffected = updateStmt8.executeUpdate(sql8);
                        
                                                    //System.out.println(rowsAffected + " rows updated.");
                                                    
                                                    // Display menu item details
                                                    if (rs.next()) {
                                                        String name = rs8.getString("name");
                                                        int price = rs8.getInt("price");
                                                        String platform = rs8.getString("platform");
                                                        String CATEGORY = rs8.getString("CATEGORY");
                                                        String COMMENT = rs8.getString("COMMENT");
                                                        String VIEW = rs8.getString("VIEW");
                                                    %>
                                                    <div class="row">
                                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                                        <div class="product__item">
                                                            <div class="product__item__pic set-bg" data-setbg="img/contents/kingsman.jpg">
                                                                <div class="ep"><%= price %>₩</div>
                                                                <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                                                <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                                            </div>
                                                            <div class="product__item__text">
                                                    
                                                    <ul>
                                                                   <li><%= platform %></li>
                                                                   <li><%= CATEGORY %></li>
                                                               </ul>
                                                     <h5 style="color: white;"><%= name %></h5>
                                
                                                    <%
                                                            }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        } finally {
                                                            // Close JDBC objects in the reverse order of their creation
                                                            try {
                                                                if (rs8 != null) rs8.close();
                                                                if (stmt8 != null) stmt8.close();
                                                                if (conn8 != null) conn8.close();
                                                            } catch (SQLException se) {
                                                                se.printStackTrace();
                                                            }
                                                        }
                                                    %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                    Connection conn9 = null;
                                                    Statement stmt9 = null;
                                                    ResultSet rs9 = null;
                                                    PreparedStatement updateStmt9 = null;
                            
                                                    // Define JDBC connection parameters
                                                    String jdbcDriver9 = "com.mysql.jdbc.Driver";
                                                    String jdbcUrl9 = "jdbc:mysql://43.201.29.10:3306/test";
                                                    String dbUser9 = "root";
                                                    String dbPass9 = "1234";
                            
                                                    try {
                                                        // Load the JDBC driver
                                                        Class.forName(jdbcDriver9);
                            
                                                        // Establish connection
                                                        conn9 = DriverManager.getConnection(jdbcUrl9, dbUser9, dbPass9);
                            
                                                        // Create statement and execute query
                                                        stmt9 = conn.createStatement();
                                                        String sql = "SELECT * FROM menu WHERE id=9;";
                                                        rs9 = stmt9.executeQuery(sql9);
                                                        
                                                        //String sql9 = "UPDATE menu SET PRICE=12.99 WHERE id=9;";
                                                        //updateStmt9 = conn9.prepareStatement(sql9);
                                                        
                                                       // int rowsAffected = updateStmt9.executeUpdate(sql9);
                            
                                                        //System.out.println(rowsAffected + " rows updated.");
                                                        
                                                        // Display menu item details
                                                        if (rs9.next()) {
                                                            String name = rs9.getString("name");
                                                            int price = rs9.getInt("price");
                                                            String platform = rs9.getString("platform");
                                                            String CATEGORY = rs9.getString("CATEGORY");
                                                            String COMMENT = rs9.getString("COMMENT");
                                                            String VIEW = rs9.getString("VIEW");
                                                        %>
                                                        <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6">
                                                            <div class="product__item">
                                                                <div class="product__item__pic set-bg" data-setbg="img/contents/tears.jpg">
                                                                    <div class="ep"><%= price %>₩</div>
                                                                    <div class="comment"><i class="fa fa-comments"></i><%= COMMENT %></div>
                                                                    <div class="view"><i class="fa fa-eye"></i> <%= VIEW %></div>
                                                                </div>
                                                                <div class="product__item__text">
                                                        
                                                        <ul>
                                                                       <li><%= platform %></li>
                                                                       <li><%= CATEGORY %></li>
                                                                   </ul>
                                                         <h5 style="color: white;"><%= name %></h5>
                                    
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                // Close JDBC objects in the reverse order of their creation
                                                                try {
                                                                    if (rs9 != null) rs9.close();
                                                                    if (stmt9 != null) stmt9.close();
                                                                    if (conn9 != null) conn9.close();
                                                                } catch (SQLException se) {
                                                                    se.printStackTrace();
                                                                }
                                                            }
                                                        %>
                                                                </div>
                                                            </div>
                                                        </div>
                        
                    
                    
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>Top Views</h5>
                            </div>
                            <ul class="filter__controls">
                                <li class="active" data-filter="*">Day</li>
                                <li data-filter=".week">Week</li>
                                <li data-filter=".month">Month</li>
                                <li data-filter=".years">Years</li>
                            </ul>
                            <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="img/sidebar/begin-again_1.jpg">
                                <div class="ep">1 / 9</div>
                                <div class="view"><i class="fa fa-eye"></i> 100000</div>
                                <h5><a href="#">Begin Again</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix month week"
                            data-setbg="img/sidebar/ironman.jpg">
                            <div class="ep">4 / 9</div>
                            <div class="view"><i class="fa fa-eye"></i> 9700</div>
                            <h5><a href="#">IRONMAN3</a></h5>
                        </div>
                        <div class="product__sidebar__view__item set-bg mix week years"
                        data-setbg="img/sidebar/baseball.jpg">
                        <div class="ep">5 / 9</div>
                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        <h5><a href="#">THE STRONGEST BASEBALL</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg mix years month"
                    data-setbg="img/sidebar/tears_1.jpg">
                    <div class="ep">9 / 9</div>
                    <div class="view"><i class="fa fa-eye"></i> 8941</div>
                    <h5><a href="#">Queen of Tears</a></h5>
                </div>
                <div class="product__sidebar__view__item set-bg mix day"
                data-setbg="img/sidebar/spider_1.jpg">
                <div class="ep">7 / 9</div>
                <div class="view"><i class="fa fa-eye"></i> 8923</div>
                <h5><a href="#">SPIDERMAN</a></h5>
            </div>
        </div>
    </div>
    <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/dead.jpg" alt="">
                
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Marvel</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Deadpool & Wolverine</a></h5>
                <span><i class="fa fa-eye"></i> 3000 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/arcane2.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>NetFlix</li>
                    <li>Animation</li>
                </ul>
                <h5><a href="#">ARCANE2</a></h5>
                <span><i class="fa fa-eye"></i> 1300 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/nogain.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Tving</li>
                    <li>Drama</li>
                </ul>
                <h5><a href="#">No Gain No Love</a></h5>
                <span><i class="fa fa-eye"></i> 1241 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/seo.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Tving</li>
                    <li>Reality</li>
                </ul>
                <h5><a href="#">Seojin's 2</a></h5>
                <span><i class="fa fa-eye"></i> 2157 Viewes</span>
            </div>
        </div>
    </div>
</div>
</div>
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
            </div>
            <div class="col-lg-6">
                <div class="footer__nav">
                    <ul>
                        <li class="active"><a href="./index.jsp">HomePage</a></li>
                        <li><a href="./contents.html">Contents</a></li>
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
            <input type="text" id="search-input" placeholder="Search here">
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