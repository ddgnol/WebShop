<%-- 
    Document   : cart
    Created on : Dec 2, 2019, 9:27:21 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Customer"%>
<%@page import="Model.ProCart"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <br><br><br><br><br><br><br><br><br>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <h4 class="my-4">SẢN PHẨM</h4>
                        <div class="list-group">
                            <a href="viewPhone" class="list-group-item" >Điện thoại</a>
                            <a href="viewLaptop" class="list-group-item">Laptop</a>
                            <a href="viewCamera" class="list-group-item">Máy ảnh</a>
                        </div>
                    </div>
                    <div class="col-lg-9 p-5  rounded  ">
                        <img src="image/empty-cart.png" style="text-align: center; width: 50%;height: 75%; margin-left: auto; margin-right: auto;display: block">
                        <h5 style="text-align: center">Không có sản phẩm nào trong giỏ hàng của bạn</h5>
                        <a href="index.jsp"><button class="btn btn-block btn-info" data-toggle="collapse">Tiếp tục mua sắm</button></a>
                    </div>


                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
