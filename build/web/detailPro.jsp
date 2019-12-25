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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
                    <div class="row" style="margin-left: 50px">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#">Item One</a>
                                    </h4>
                                    <h5>$24.99</h5>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#">Item Two</a>
                                    </h4>
                                    <h5>$24.99</h5>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#">Item Three</a>
                                    </h4>
                                    <h5>$24.99</h5>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
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
