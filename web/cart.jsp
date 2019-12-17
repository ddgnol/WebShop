<%-- 
    Document   : cart
    Created on : Dec 2, 2019, 9:27:21 PM
    Author     : Admin
--%>

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
                        <table class="table">
                            <thead>
                                <tr class="bg-light">
                                    <th class="p-2 px-3">SẢN PHẨM</th>
                                    <th class="py-2"> Mã hàng</th>
                                    <th class="py-2"> Đơn giá</th>
                                    <th class="py-2"> Số lượng</th>
                                    <th class="py-2"> Xóa</th>
                                    <th class="py-2"> Theo dõi</th>
                                </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="pro" items="${cartPro}">
                                <tr >
                                    <th >
                                        <div class="p-2 ">
                                            <img src="${pro.img}" class="img-fluid rounded shadow-sm" width="100">

                                            <div class="ml-3 d-inline-block align-middle">
                                                <h5 class="">
                                                    <a href="#" class=""><strong>${pro.name}</strong></a>
                                                </h5>
                                                <span CLASS="text-muted font-weight-normal font-italic d-block">${pro.category}</span>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="align-middle">
                                        <strong>${pro.id}</strong>
                                    </td>
                                    <td class="align-middle">
                                        <strong>${pro.price}</strong>
                                    </td>
                                    <td class="align-middle">
                                        <strong>${pro.status}</strong>
                                    </td>
                                    <td class="align-middle">
                                        <a  href="DeleteProInCart?id=${pro.id}" ><i class="fa fa-trash"></i></a>
                                    </td>
                                    <td class="align-middle">
                                        <input type="checkbox" style="margin-left: 20px">
                                    </td>
                                </tr>
                            <div id ="doServlet"></div>
                            <!--                            <script>
                                                            function deletePro() {
                                                                var xhttp = new XMLHttpRequest();
                                                                xhttp.onreadystatechange = function () {
                                                                    if (this.readyState == 4 && this.status == 200) {
                                                                        document.getElementById("doServlet").innerHTML = this.responseText;
                                                                    }
                                                                };
                                                                xhttp.open("POST", "DeleteProInCart?id=${pro.id}", true);
                                                                xhttp.send();
                                                            }
                                                        </script>-->


                        </c:forEach>
                        </tbody>
                    </table>


                    <div style="margin: 20px; color: gray">
                        <h3 >Tổng tiền:</h3>
                        <%
                            List<ProCart> list
                                    = (List<ProCart>) request.getAttribute("cartPro");
                            int sum = 0;
                            for (ProCart p : list) {
                                sum += p.getPrice()*p.getStatus();
                            }
                        %>
                        <h2><%=sum%></h2>
                    </div>
                    <div id="demo" class="collapse alert alert-success">
                        <strong>Thành công .</strong> Sản phẩm của bạn sẽ được gửi về địa chỉ đăng kí trong 2, 3 ngày tới.
                    </div>
                    <button class="btn btn-block btn-info" data-toggle="collapse" data-target="#demo">Thanh toán</button>
                </div>
            </div>


        </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
