<%@page import="Model.Bill"%>
<%@page import="Model.BillDetail"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>CUSTOMER</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

        </style>
    </head>
    <body class="w3-light-grey w3-content" style="max-width:1600px">


       <div>
            
            <header id="sanpham">
                <h2 style="padding:10px"><strong>Lịch sử mua hàng</strong></h2>
            </header>
            <div >           
                <table class="table table-dark table-striped" >
                    <thead>
                        <tr>
                            <th>Mã Đơn</th>
                            <th>Ngày mua</th>
                            <th>Người nhận</th>
                            <th>Tổng tiền</th>
                            <th>Địa chỉ nhận hàng</th>
                            <th>Trạng thái</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="bill" items="${listBill}">
                            <tr >

                                <td class="align-middle">
                                    <strong>${bill.id}</strong>
                                </td>
                                <td class="align-middle">
                                    <strong>${bill.order_day}</strong>
                                </td>

                                <td class="align-middle">
                                    <strong>${name_cus}</strong>
                                </td>

                                <td class="align-middle">
                                    <strong>${bill.price}</strong>
                                </td>
                                <td class="align-middle">
                                    <strong>${bill.address}</strong>
                                </td>
                                <td class="align-middle">
                                    <strong>${bill.status}</strong>
                                </td>

                            </tr>

                        </c:forEach>
                    </tbody>
                </table>


            </div>
            <button style="margin: 30px; width: 150px; height: 50px">
                <a href="<c:url value="/CustomerSer"/>">Quay lại</a>
            </button>

        </div>

      

    </body>
</html>
