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

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container">
                <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
                    <i class="fa fa-remove"></i>
                </a>
                <img src="image/user.png" style="width:45%;" class="w3-round"><br><br>
                <h4><b>${cus.name}</b></h4>

            </div>
            <div class="w3-bar-block">
                <a href="CustomerCart" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ">Đơn hàng đang đặt</a>
                <a href="HistoryCusCart" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ">Lịch sử mua hàng</a>
                <a href="index.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Quay lại trang chủ</a>
            </div>
        </nav>

        
        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px">

           
                <div class="col-lg-9 p-5  rounded  ">
                    <h2>Đơn hàng của tôi</h2>    
                    <table class="table">
                            <thead>
                                <tr class="bg-light">
                                    <th class="p-2 px-3">Mã Đơn</th>
                                    <th class="py-2">Ngày mua</th>
                                    <th class="py-2">Người nhận</th>
                                    <th class="py-2">Tổng tiền</th>
                                    <th class="py-2">Địa chỉ nhận hàng</th>
                                    <th class="py-2">Trạng thái</th>
                                    <th></th>
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
                                            <strong>${cus.getName()}</strong>
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
                                        <td>
                                            <form action="DetailbillServlet?id=${bill.id}" method="post">
                                                <button>Xem chi tiết</button>
                                            </form>
                                            <a href="<c:url value="DeleteBill?${bill.id}"/>"><button>Xóa</button></a>
                                        </td>
                                    </tr>
                                    
                        </c:forEach>
                        </tbody>
                    </table>


                </div>

            
        </div>

        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }
        </script>

    </body>
</html>
