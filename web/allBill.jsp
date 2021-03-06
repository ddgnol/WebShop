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
        <title>HÓA ĐƠN</title>

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
                <h2 style="padding:10px"><strong>Hóa đơn khách hàng</strong></h2>
            </header>
            <div >           
                <table class="table table-dark table-striped" >
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Mã khách hàng</th>
                            <th>Địa chỉ</th>
                            <th>SĐT</th>
                            <th>Phương thức thanh toán</th>
                            <th>Giá đơn</th>
                            <th>Ngày đặt</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="bill" items="${listbill}">

                            <tr>
                        <form action="EditBill?id=${bill.id}" method="post">
                            <td>${bill.id}</td>
                            <td>${bill.id_cus}</td>
                            <td>${bill.address}</td>
                            <td>${bill.phone}</td>
                            <td>${bill.payment}</td>
                            <td>${bill.price}</td>
                            <td>${bill.order_day}</td>
                            <td>
                                <select name="status" class="form-control">
                                    <option value="${bill.status}">${bill.status}</option>
                                    <option value="Đã hủy">Đã hủy</option>
                                    <option value="Đã gửi">Đã gửi</option>
                                </select>
                            </td>
                            <td>
                                <button>update</button>                                  
                            </td>
                        </form>
                        <td>
                            <a href="DetailbillServlet?id=${bill.id}"><button>view</button></a>
                        </td>
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
