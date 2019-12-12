<%-- 
    Document   : register
    Created on : Dec 10, 2019, 7:28:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="w3-container w3-padding-64" style="margin: 200px">
    <h1>Đăng kí</h1><br>
    
    <form action="Register" >
       <p><input class="w3-input w3-padding-16" type="text" placeholder="Tài khoản"  name="user"></p>
       <p><input class="w3-input w3-padding-16" type="password" placeholder="Mật khẩu"  name="pass"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Mã khách hàng chọn ( 8 kí tự )"  name="code"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Tên khách hàng"  name="name"></p>
      <p><input class="w3-input w3-padding-16" type="date" placeholder="Ngày sinh"  name="date" ></p>
      <p><input class="w3-input w3-padding-16" type="number" placeholder="Số điện thoại"  name="phone"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Gmail"  name="gmail"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Địa chỉ"  name="address"></p>
      <p><button class="btn  bg-warning btn-block" type="submit">Đăng kí</button></p>
    </form>
  </div>
         <jsp:include page="header.jsp"></jsp:include>
    </body>
</html>
