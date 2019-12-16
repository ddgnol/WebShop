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
                        <DIV class="col-sm-7 " style="margin: 20px; padding-left: 150px">
                            <h1 class="w3-center">${pro.name}</h1><br>
                            <hr>
                            <h3 class="w3-center"><strong>${pro.price}</strong></h3>
                            <hr>
                            <h3>
                                ${pro.describe}
                            </h3>

<!--                            <button type="submit" class="btn btn-outline-danger" data-toggle="collapse" data-target="#demo" ><a href="AddToCart?id=${pro.id}">Thêm vào giỏ hàng <i class="fa fa-shopping-cart"></i></a></button>-->
                                <button type="submit"  class="btn btn-outline-danger" data-toggle="collapse" data-target="#demo"  onclick="loadDoc()">Thêm vào giỏ hàng <i class="fa fa-shopping-cart"></i></button>
                            <div id="demo" class="collapse alert alert-success">
                                <strong>Thành công .</strong> Sản phẩm của bạn đã được thêm vào giỏ hàng.
                            </div>
                            
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            function loadDoc() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("doServlet").innerHTML = this.responseText;
                    }
                };
                xhttp.open("POST", "AddToCart?id=${pro.id}", true);
                xhttp.send();
            }
        </script>
    </body>
</html>
