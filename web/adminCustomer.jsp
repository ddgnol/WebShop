<%-- 
    Document   : allBill
    Created on : Dec 11, 2019, 10:56:44 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>KHÁCH HÀNG</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body class="w3-light-grey w3-content" style="max-width:1600px">
        <div>
            <br><h2 style="color: red">${error}</h2><br>
            <header id="sanpham">
                <h2 style="padding:10px"><strong>Danh sách khách hàng</strong></h2>
            </header>
            <div >           
                <table class="table table-dark table-striped" >
                    <thead>
                        <tr>
                            <th>Mã khách hàng</th>
                            <th>Tên khách hàng</th>
                            <th>Địa chỉ</th>
                            <th>SĐT</th>
                            <th>Ngày Sinh</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cus" items="${CusList}">

                            <tr>

                                <td>${cus.id}</td>
                                <td>${cus.name}</td>
                                <td>${cus.address}</td>
                                <td>${cus.phoneNum}</td>
                                <td>${cus.dateOfBirth}</td>
                                <td>${cus.email}</td>
                              
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <button style="margin: 30px; width: 150px; height: 50px">
                <a href="<c:url value="/AdminView"/>">Quay lại</a>
            </button>

        </div>


    </body>
</html>
