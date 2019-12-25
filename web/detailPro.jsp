<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
.<%-- 
    Document   : detailPro
    Created on : Dec 3, 2019, 10:40:41 PM
    Author     : Admin
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Controller.AddToCart"%>
<%@page import="Controller.AddToCart"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="Model.Product"%>
<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSP Page</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id ="doServlet"></div>
        <jsp:include page="header.jsp"></jsp:include>
            <br><br><br><br><br><br><br><br><br>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-2">
                        <h1 class="my-4">SẢN PHẨM</h1>
                        <div class="list-group">
                            <a href="viewPhone" class="list-group-item" >Điện thoại</a>
                            <a href="viewLaptop" class="list-group-item">Laptop</a>
                            <a href="viewCamera" class="list-group-item">Máy ảnh</a>
                        </div>
                    </div>
                    <div class="col-sm-10 " >
                        <div class="row" style="margin: 50px; margin-bottom: 100px">
                            <div class="col-sm-4 ">
                                <img src="${pro.img}" style="width: 100%; height: 100%" class="w3-card">
                        </div>
                        <div class="col-sm-7 " style="margin: 20px; padding-left: 150px">
                            <div>
                                <h3><strong style="color: red">${error}</strong></h3>
                            </div>  
                            <h1 class="w3-center">${pro.name}</h1><br>
                            <hr>
                            <h3 class="w3-center"><strong>Giá: ${pro.price}</strong></h3>
                            <hr>
                            <h3>
                                ${pro.describe}
                            </h3>
                            <hr>
                            <h5>Trong kho hiện còn: ${pro.quantity} sản phẩm</h5>
                            <hr>
                            <h5>Số lượng :</h5>	
                            <div class="quaty slg" >
                                <button onclick="sub();" type="button" class="btn btn-link">-</button>   
                                <span id="sl"> 1 </span>
                                <button onclick="add();" type="button" class="btn btn-link" >+</button>   
                            </div>

                            <br>
                            <form action="AddToCart" method="post">
                                <input type="hidden" name="id" value="${pro.id}">
                                <input type="hidden" name="soLuong" id="soLuong">
                                <button type="submit" class="btn btn-outline-danger" data-toggle="collapse"  data-target="#demo">Thêm vào giỏ hàng <i class="fa fa-shopping-cart"></i></button>
                            </form>   

                            <!--                         <button type="submit"  class="btn btn-outline-danger" data-toggle="collapse" data-target="#demo"  onclick="loadDoc()">Thêm vào giỏ hàng <i class="fa fa-shopping-cart"></i></button>
                                                   <div id="demo" class="collapse alert alert-success">
                                                       <strong>Thành công .</strong> Sản phẩm của bạn đã được thêm vào giỏ hàng.
                                                   </div>   -->

                        </div>
                    </div>
                    <!--SẢN PHẨM TƯƠNG TỰ-->
                    <div class="row" style="margin-left: 25px">
                        <div class="col-md-9">
                            <h3>SẢN PHẨM TƯƠNG TỰ</h3>
                        </div>
                        <div class="col-md-3">
                            <!-- Controls -->
                            <div class="controls pull-right hidden-xs">
                                <a class="left fa fa-chevron-left btn" href="#carousel-example"
                                   data-slide="prev"></a><a class="right fa fa-chevron-right btn" href="#carousel-example"
                                   data-slide="next"></a>
                            </div>
                        </div>
                    </div>
                    <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel" style="margin-left: 40px">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="row">
                                    <c:forEach var="pro" items="${samePros}" begin="0" end="3">
                                        <div class="col-sm-3">
                                            <div class="col-item">
                                                <a href="ProDetail?id=${pro.id}">
                                                    <div class="info"  style="width: 272.5px; height: 85px">
                                                        <div class="row">
                                                            <div class="price col-md-12">
                                                                <h5>${pro.name}</h5>
                                                                <h5 class="price-text-color">${pro.price}</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>

                                                <div class="photo">
                                                    <img src="${pro.img}" class="img-responsive" alt="a" />
                                                </div>
                                                <div class="info">
                                                    <div class="separator clear-left">
                                                        <p class="btn-add">
                                                            <i class="fa fa-shopping-cart"></i><a href="AddToCart?id=${pro.id}&soLuong=1" class="hidden-sm">Add to cart</a>
                                                        </p>
                                                        <p class="btn-details">
                                                            <i class="fa fa-list"></i><a href="ProDetail?id=${pro.id}" class="hidden-sm">More details</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="item">
                                <div class="row">
                                    <c:forEach var="pro" items="${samePros}" begin="4" end="7">
                                        <div class="col-sm-3">
                                            <div class="col-item">
                                                <a href="ProDetail?id=${pro.id}">
                                                    <div class="info"  style="width: 272.5px; height: 85px">
                                                        <div class="row">
                                                            <div class="price col-md-12">
                                                                <h5>${pro.name}</h5>
                                                                <h5 class="price-text-color">${pro.price}</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="photo">
                                                    <img src="${pro.img}" class="img-responsive" alt="a" />
                                                </div>
                                                <div class="info">
                                                    <div class="separator clear-left">
                                                        <p class="btn-add">
                                                            <i class="fa fa-shopping-cart"></i><a href="AddToCart?id=${pro.id}&soLuong=1" class="hidden-sm">Add to cart</a>
                                                        </p>
                                                        <p class="btn-details">
                                                            <i class="fa fa-list"></i><a href="ProDetail?id=${pro.id}" class="hidden-sm">More details</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .col-item
            {
                border: 2px solid #2323A1;
                border-radius: 5px;
                background: #FFF;
            }
            .col-item .photo img
            {
                margin: 0 auto;
                width: 100%;
            }

            .col-item .info
            {
                padding: 10px;
                border-radius: 0 0 5px 5px;
                margin-top: 1px;
            }
            .col-item:hover .info {
                background-color: rgba(215, 215, 244, 0.5); 
            }
            .col-item .price
            {
                /*width: 50%;*/
                float: left;
                margin-top: 5px;
            }

            .col-item .price h5
            {
                line-height: 20px;
                margin: 0;
            }

            .price-text-color
            {
                color: #00990E;
            }

            .col-item .info .rating
            {
                color: #003399;
            }

            .col-item .rating
            {
                /*width: 50%;*/
                float: left;
                font-size: 17px;
                text-align: right;
                line-height: 52px;
                margin-bottom: 10px;
                height: 52px;
            }

            .col-item .separator
            {
                border-top: 1px solid #FFCCCC;
            }

            .clear-left
            {
                clear: left;
            }

            .col-item .separator p
            {
                line-height: 20px;
                margin-bottom: 0;
                margin-top: 10px;
                text-align: center;
            }

            .col-item .separator p i
            {
                margin-right: 5px;
            }
            .col-item .btn-add
            {
                width: 50%;
                float: left;
            }

            .col-item .btn-add
            {
                border-right: 1px solid #CC9999;
            }

            .col-item .btn-details
            {
                width: 50%;
                float: left;
                padding-left: 10px;
            }
            .controls
            {
                margin-top: 20px;
            }
            [data-slide="prev"]
            {
                margin-right: 10px;
            }
        </style>
        <jsp:include page="footer.jsp"></jsp:include>


            <script type="text/javascript">
                function add() {
                    var max = ${pro.quantity};
                    var soluong = parseInt($("#sl").html());

                    if (soluong < max) {
                        soluong += 1;
                        $("#sl").html(soluong);
                        $("#soLuong").val(soluong);
                    }
                }
                function sub() {
                    var soluong = parseInt($("#sl").html());
                    if (soluong > 1) {
                        soluong -= 1;
                        $("#sl").html(soluong);
                        $("#soLuong").val(soluong);
                    }

                }
        </script>		


        <script>
            function loadDoc() {
                var soluong = parseInt($("#sl").html());
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("doServlet").innerHTML = this.responseText;
                    }
                };
                var url = "AddToCart?id=${pro.id}&soluong=" + soluong;
                xhttp.open("POST", url, true);
                xhttp.send();
            }
        </script>


    </body>
</html>
