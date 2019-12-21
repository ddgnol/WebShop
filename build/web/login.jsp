<%-- 
    Document   : login
    Created on : Nov 29, 2019, 9:29:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <br><br><br><br><br><br><br><br>
            <div class="row">
                <div class="col-sm-3">
                    <h1 class="my-4">SẢN PHẨM</h1>
                    <div class="list-group">
                        <a href="viewPhone" class="list-group-item" >Điện thoại</a>
                        <a href="viewLaptop" class="list-group-item">Laptop</a>
                        <a href="viewCamera" class="list-group-item">Máy ảnh</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="container">
                        <h2>Đăng nhập</h2>
                        <form action="login" method="post">
                            <div class="">
                                <label for="email">Tài khoản</label>
                                <input type="text" class="form-control" placeholder="Enter email" id="email"  name="user">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Mật khẩu</label>
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass">
                            </div>
                            <div class="form-group form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary ">Đăng nhập</button>

                        </form>
                        <div style="margin-top: 30px">
                            <h3>Bạn chưa có tài khoản ?</h3>
                            <button  class="btn  bg-warning btn-block"><a href="register.jsp">Đăng kí</a></button>
                        </div>
                    </div>
                </div>
            </div>
            
            <br><br><br><br><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
