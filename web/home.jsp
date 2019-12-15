<%-- 
    Document   : home
    Created on : Nov 28, 2019, 11:12:17 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            body {
                position: relative; 
            }
        </style>
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark  justify-content-center">  
            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link" href="#section1">SẢN PHẨM</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#section2">VỀ CHÚNG TÔI</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#section3">DIỄN ĐÀN</a>
                </li>

            </ul>
        </nav>
        <br> <br> <br> <br>
        <div id="section1" class="container-fluid" >
            <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">SẢN PHẨM</h2>
            <a href="viewPhone"><h4>   ĐIỆN THOẠI</h4></a>

            <div class="w3-row ">
                <%
                    ProductDAO productDAO = new ProductDAO();
                    List<Product> listPhone = productDAO.getPhone();

                    for (int i = 0; i < 4; i++) {
                        String pattern = "###,###.###";
                        DecimalFormat decimalFormat = new DecimalFormat(pattern);
                        String format = decimalFormat.format(listPhone.get(i).getPrice());
                %>

                <div class="w3-col l3 s6">
                    <div class="w3-container border">
                        <div class="w3-display-container " >
                            <img src="<%=listPhone.get(i).getImg()%>" style="width: 100%">
                            <span class="w3-tag w3-display-topleft w3-red">New</span>
                            <div class="w3-display-middle w3-display-hover">
                                <a href="ProDetail?id=<%=listPhone.get(i).getId()%>">
                                    <button class="w3-button w3-black">Chi tiết <i class="fa fa-shopping-cart"></i></button>
                                </a>
                            </div>
                        </div>
                        <p><%=listPhone.get(i).getName()%><br></p>
                        <h3><%=format%></h3>
                    </div>
                </div>
                <%
                    }
                %>
                <!-- <div class="w3-col l3 s6">
                     <div class="w3-container border">
                         <div class="w3-display-container">
                             <img src="image/2.jpg" style="width:100%">
                             <span class="w3-tag w3-display-topleft w3-red">New</span>
                             <div class="w3-display-middle w3-display-hover">
                                 <button class="w3-button w3-black">Chi tiết <i class="fa fa-shopping-cart"></i></button>
                             </div>
                         </div>
                         <p>camera<br></p>
                         <h3>21.600.000VNĐ</h3>
                     </div>
                 </div>
                 <div class="w3-col l3 s6">
                     <div class="w3-container border">
                         <div class="w3-display-container">
                             <img src="image/3.jpg" style="width:100%">
                             <span class="w3-tag w3-display-topleft w3-red">New</span>
                             <div class="w3-display-middle w3-display-hover">
                                 <button class="w3-button w3-black">Chi tiết <i class="fa fa-shopping-cart"></i></button>
                             </div>
                         </div>
                         <p>camera<br></p>
                         <h3>21.600.000VNĐ</h3>
                     </div>
                 </div>
                 <div class="w3-col l3 s6">
                     <div class="w3-container border">
                         <div class="w3-display-container">
                             <img src="image/4.jpg" style="width:100%">
                             <span class="w3-tag w3-display-topleft w3-red">New</span>
                             <div class="w3-display-middle w3-display-hover">
                                 <button class="w3-button w3-black">Chi tiết <i class="fa fa-shopping-cart"></i></button>
                             </div>
                         </div>
                         <p>camera<br></p>
                         <h3>21.600.000VNĐ</h3>
                     </div>
                 </div>
             </div> -->
                <br><br><br>
                <a href="viewLaptop"><h4>   LAPTOP</h4></a>
                <div class="w3-row ">
                    <%
                        ProductDAO productDAO2 = new ProductDAO();
                        List<Product> listLaptop = productDAO2.getLaptop();
                        for (int i = 0; i < 4; i++) {
                            String pattern = "###,###.###";
                            DecimalFormat decimalFormat = new DecimalFormat(pattern);
                            String format = decimalFormat.format(listLaptop.get(i).getPrice());
                    %>

                    <div class="w3-col l3 s6">
                        <div class="w3-container border">
                            <div class="w3-display-container " >
                                <img src="<%=listLaptop.get(i).getImg()%>" style="width: 100%">
                                <span class="w3-tag w3-display-topleft w3-red">New</span>
                                <div class="w3-display-middle w3-display-hover">
                                    <a href="ProDetail?id=<%=listLaptop.get(i).getId()%>">
                                        <button class="w3-button w3-black">Chi tiết <i class="fa fa-shopping-cart"></i></button>
                                    </a>

                                </div>
                            </div>
                            <p><%=listLaptop.get(i).getName()%><br></p>
                            <h3><%=format%></h3>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <br><br><br>
                    <a href="viewCamera"><h4>   CAMERA</h4></a>
                    <div class="w3-row ">
                        <%
                            ProductDAO productDAO3 = new ProductDAO();
                            List<Product> listCam = productDAO3.getCamera();
                            for (int i = 0; i < 4; i++) {
                                String pattern = "###,###.###";
                                DecimalFormat decimalFormat = new DecimalFormat(pattern);
                                String format = decimalFormat.format(listCam.get(i).getPrice());
                        %>

                        <div class="w3-col l3 s6">
                            <div class="w3-container border">
                                <div class="w3-display-container " >
                                    <img src="<%=listCam.get(i).getImg()%>" style="width: 100%">
                                    <span class="w3-tag w3-display-topleft w3-red">New</span>
                                    <div class="w3-display-middle w3-display-hover">
                                        <a href="ProDetail?id=<%=listCam.get(i).getId()%>">
                                            <button class="w3-button w3-black">Chi tiết <i class="fa fa-shopping-cart"></i></button>
                                        </a>
                                    </div>
                                </div>
                                <p><%=listCam.get(i).getName()%><br></p>
                                <h3><%=format%></h3>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <br> <br> <br> <br>
                        <div id="section2" class="container-fluid "  >
                            <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">VỀ CHÚNG TÔI</h3>
                        </div>

                        <div class="container-fluid">

                            <div class="row" style="padding-top:20px;padding-bottom:20px">
                                <div class="col" >
                                    <img src="image/paris.jpg" class="rounded-circle w3-card" alt="Paris" width="304" height="200"> 
                                    <h3 >Nguyễn Văn A</h3>
                                    <p class="w3-opacity ">CEO & Founder</p>
                                    <p>Lớp CNTT - Đại học Bách Khoa Hà Nội <br>SĐT:0123456789</p>

                                </div>
                                <div class="col" >
                                    <img src="image/paris.jpg" class="rounded-circle w3-card" alt="Paris" width="304" height="200"> 
                                    <h3 >Nguyễn Văn B</h3>
                                    <p class="w3-opacity ">Developer</p>
                                    <p>Lớp CNTT - Đại học Bách Khoa Hà Nội <br>SĐT:0123456789</p>
                                </div>
                                <div class="col" >
                                    <img src="image/paris.jpg" class="rounded-circle w3-card" alt="Paris" width="304" height="200"> 
                                    <h3 >Nguyễn Văn C</h3>
                                    <p class="w3-opacity ">Tester</p>
                                    <p>Lớp CNTT - Đại học Bách Khoa Hà Nội <br>SĐT:0123456789</p>
                                </div>
                                <div class="col" >
                                    <img src="image/paris.jpg" class="rounded-circle w3-card" alt="Paris" width="304" height="200"> 
                                    <h3 >Nguyễn Văn A</h3>
                                    <p class="w3-opacity ">Thư kí</p>
                                    <p>Lớp CNTT - Đại học Bách Khoa Hà Nội <br>SĐT:0123456789</p>
                                </div>

                            </div> 
                        </div>
                        <br>
                        <br>

                        <div id="section3" class="container-fluid "  >
                            <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">DIỄN ĐÀN</h3>
                        </div>

                        <div class="container" style="padding-top:20px;padding-bottom:20px">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h2>Iphone ra siêu phẩm mới</h2>
                                    <p>Use the float classes to float the image to the left or to the right:</p> 
                                    <p>Use the float classes to float the image to the left or to the right:</p> 
                                    <p>Use the float classes to float the image to the left or to the right:</p>  
                                </div>
                                <div class="col-sm-4">
                                    <img src="image/event1.jpg" class="" alt="Paris" width="304" height="200"> 
                                </div>

                            </div>
                            <br> <br> <br> <br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2>Aligning images</h2>
                                        <p>Use the float classes to float the image to the left or to the right:</p> 
                                        <p>Use the float classes to float the image to the left or to the right:</p> 
                                        <p>Use the float classes to float the image to the left or to the right:</p>  
                                    </div>
                                    <div class="col-sm-4">
                                        <img src="image/event2.jpg" class="" alt="Paris" width="304" height="200"> 
                                    </div>
                                </div>

                                <br> <br> <br> <br>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <h2>Aligning images</h2>
                                            <p>Use the float classes to float the image to the left or to the right:</p> 
                                            <p>Use the float classes to float the image to the left or to the right:</p> 
                                            <p>Use the float classes to float the image to the left or to the right:</p>  
                                        </div>
                                        <div class="col-sm-4">
                                            <img src="image/event3.jpg" class="" alt="Paris" width="304" height="200"> 
                                        </div>
                                    </div>


                                    <br> <br> <br> <br>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h2>Aligning images</h2>
                                                <p>Use the float classes to float the image to the left or to the right:</p> 
                                                <p>Use the float classes to float the image to the left or to the right:</p> 
                                                <p>Use the float classes to float the image to the left or to the right:</p>  
                                            </div>
                                            <div class="col-sm-4">
                                                <img src="image/event4.jpg" class="" alt="Paris" width="304" height="200"> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    </body>
                    </html>