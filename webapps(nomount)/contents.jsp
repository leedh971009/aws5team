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
                                        <h4>Contents</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
              <%
				    Connection conn1 = null;
				    Statement stmt1 = null;
				    ResultSet rs1 = null;
				    PreparedStatement updateStmt1 = null;
				
				    String jdbcDriver = "com.mysql.jdbc.Driver";
				    String jdbcUrl = "jdbc:mysql://database-1.cn482mka8n93.ap-northeast-2.rds.amazonaws.com:3306/test";
				    String dbUser = "hf";
				    String dbPass = "1234";

				    try {
				        Class.forName(jdbcDriver);
				        conn1 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt1 = conn1.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=1;";
				        rs1 = stmt1.executeQuery(sql1);
				
				        if (rs1.next()) {
				            String name1 = rs1.getString("name");
				            int price1 = rs1.getInt("price");
				            String platform1 = rs1.getString("platform");
				            String CATEGORY1 = rs1.getString("CATEGORY");
				            String COMMENT1 = rs1.getString("COMMENT");
				            String VIEW1 = rs1.getString("VIEW");
					%>
				        
				       <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="img/contents/begin_again.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  		</div>
							</div>
						</div>

					<%
					        }
					    } catch (Exception e) {
					        e.printStackTrace();
					    } finally {
					        // Close JDBC objects in the reverse order of their creation
					        try {
					            if (rs1 != null) rs1.close();
					            if (stmt1 != null) stmt1.close();
					            if (conn1 != null) conn1.close();
					        } catch (SQLException se) {
					            se.printStackTrace();
					        }
					    }
					%>
					
					
																																																							
					 <%
				    Connection conn2 = null;
				    Statement stmt2 = null;
				    ResultSet rs2 = null;
				    PreparedStatement updatestmt2 = null;
				
				    // Define JDBC connection parameters
				

				    try {
				        // Load the JDBC driver
				        Class.forName(jdbcDriver);
				
				        // Establish connection
				        conn2 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				
				        // Create statement and execute query
				        stmt2 = conn2.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=2;";
				        rs2 = stmt2.executeQuery(sql1);
				
				        // Display menu item details
				        if (rs2.next()) {
				            String name1 = rs2.getString("name");
				            int price1 = rs2.getInt("price");
				            String platform1 = rs2.getString("platform");
				            String CATEGORY1 = rs2.getString("CATEGORY");
				            String COMMENT1 = rs2.getString("COMMENT");
				            String VIEW1 = rs2.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/showman.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				        </div>
				    </div>
				</div>

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
					
					
					
					<%
				    Connection conn3 = null;
				    Statement stmt3 = null;
				    ResultSet rs3 = null;
				    PreparedStatement updatestmt3 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn3 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt3 = conn3.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=3;";
				        rs3 = stmt3.executeQuery(sql1);
				
				        if (rs3.next()) {
				            String name1 = rs3.getString("name");
				            int price1 = rs3.getInt("price");
				            String platform1 = rs3.getString("platform");
				            String CATEGORY1 = rs3.getString("CATEGORY");
				            String COMMENT1 = rs3.getString("COMMENT");
				            String VIEW1 = rs3.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/up.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
				    		</div>
					</div>

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
					
					
					
					
					<%
				    Connection conn4 = null;
				    Statement stmt4 = null;
				    ResultSet rs4 = null;
				    PreparedStatement updatestmt4 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn4 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt4 = conn4.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=4;";
				        rs4 = stmt4.executeQuery(sql1);
				
				        if (rs4.next()) {
				            String name1 = rs4.getString("name");
				            int price1 = rs4.getInt("price");
				            String platform1 = rs4.getString("platform");
				            String CATEGORY1 = rs4.getString("CATEGORY");
				            String COMMENT1 = rs4.getString("COMMENT");
				            String VIEW1 = rs4.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/ironman.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
				    		</div>
							</div>

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
					
					<%
				    Connection conn5 = null;
				    Statement stmt5 = null;
				    ResultSet rs5 = null;
				    PreparedStatement updatestmt5 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn5 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt5 = conn5.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=5;";
				        rs5 = stmt5.executeQuery(sql1);
				
				        if (rs5.next()) {
				            String name1 = rs5.getString("name");
				            int price1 = rs5.getInt("price");
				            String platform1 = rs5.getString("platform");
				            String CATEGORY1 = rs5.getString("CATEGORY");
				            String COMMENT1 = rs5.getString("COMMENT");
				            String VIEW1 = rs5.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/baseball.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
						</div>
					</div>

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
					
					
					<%
				    Connection conn6 = null;
				    Statement stmt6 = null;
				    ResultSet rs6 = null;
				    PreparedStatement updatestmt6 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn6 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt6 = conn6.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=6;";
				        rs6 = stmt6.executeQuery(sql1);
				
				        if (rs6.next()) {
				            String name1 = rs6.getString("name");
				            int price1 = rs6.getInt("price");
				            String platform1 = rs6.getString("platform");
				            String CATEGORY1 = rs6.getString("CATEGORY");
				            String COMMENT1 = rs6.getString("COMMENT");
				            String VIEW1 = rs6.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/Transferring_Love.jpeg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
						</div>
					</div>

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
					
					<%
				    Connection conn7 = null;
				    Statement stmt7 = null;
				    ResultSet rs7 = null;
				    PreparedStatement updatestmt7 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn7 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt7 = conn7.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=7;";
				        rs7 = stmt7.executeQuery(sql1);
				
				        if (rs7.next()) {
				            String name1 = rs7.getString("name");
				            int price1 = rs7.getInt("price");
				            String platform1 = rs7.getString("platform");
				            String CATEGORY1 = rs7.getString("CATEGORY");
				            String COMMENT1 = rs7.getString("COMMENT");
				            String VIEW1 = rs7.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/spiderman.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
						</div>
					</div>

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
					
					
					<%
				    Connection conn8 = null;
				    Statement stmt8 = null;
				    ResultSet rs8 = null;
				    PreparedStatement updatestmt8 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn8 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt8 = conn8.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=8;";
				        rs8 = stmt8.executeQuery(sql1);
				
				        if (rs8.next()) {
				            String name1 = rs8.getString("name");
				            int price1 = rs8.getInt("price");
				            String platform1 = rs8.getString("platform");
				            String CATEGORY1 = rs8.getString("CATEGORY");
				            String COMMENT1 = rs8.getString("COMMENT");
				            String VIEW1 = rs8.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/kingsman.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
						</div>
					</div>

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
					
					<%
				    Connection conn9 = null;
				    Statement stmt9 = null;
				    ResultSet rs9 = null;
				    PreparedStatement updatestmt9 = null;
				

				    try {
				        Class.forName(jdbcDriver);
				        conn9 = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				        stmt9 = conn9.createStatement();
				        String sql1 = "SELECT * FROM menu WHERE id=9;";
				        rs9 = stmt9.executeQuery(sql1);
				
				        if (rs9.next()) {
				            String name1 = rs9.getString("name");
				            int price1 = rs9.getInt("price");
				            String platform1 = rs9.getString("platform");
				            String CATEGORY1 = rs9.getString("CATEGORY");
				            String COMMENT1 = rs9.getString("COMMENT");
				            String VIEW1 = rs9.getString("VIEW");
					%>
				        
				            <div class="col-lg-4 col-md-6 col-sm-6">
				                <div class="product__item">
				                    <div class="product__item__pic set-bg" data-setbg="img/contents/tears.jpg">
				                        <div class="ep"><%= price1 %>₩</div>
				                        <div class="comment"><i class="fa fa-comments"></i><%= COMMENT1 %></div>
				                        <div class="view"><i class="fa fa-eye"></i> <%= VIEW1 %></div>
				                    </div>
				                    <div class="product__item__text">
				                        <ul>
				                            <li><%= platform1 %></li>
				                            <li><%= CATEGORY1 %></li>
				                        </ul>
				                        <h5 style="color: white;"><%= name1 %></h5>
				      		  </div>
						</div>
					</div>

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
                <div class="footer__logo">
                    <a href="./index.html"><img src="img/logo.png" alt=""></a>
                </div>
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
