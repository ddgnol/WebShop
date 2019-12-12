<%-- 
    Document   : LoginSuccess
    Created on : Dec 6, 2019, 10:04:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="container" style="padding-top: 200px" >
            <div style="color: red">
                <h1>Bạn đã đăng nhập rồi. Quay lại trang chủ <a href="index.jsp" style="color: violet"> tại đây</a></h1>
            </div>
        </div>
        <div class="container">
            <div style="color: darkgoldenrod">
                <h1>Bạn muốn đăng xuất ?  <a href="logout" style="color: violet"> Tại đây</a></h1>
            </div>
        </div>
           
        <jsp:include page="header.jsp"></jsp:include>
    </body>
</html>
