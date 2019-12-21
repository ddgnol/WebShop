<%-- 
    Document   : cart
    Created on : Dec 2, 2019, 9:27:21 PM
    Author     : Admin
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Customer"%>
<%@page import="Model.ProCart"%>
<%@page import="Model.Product"%>
<%@page import="DAO.*" %>
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
                                    <th class="py-2"> Thành tiền</th>
                                    <th class="py-2"> Xóa</th>
                                </tr>
                            </thead>
                            <tbody>

                            <%--<c:forEach var="pro" items="${cartPro}">--%>
                            <%

                                List<ProCart> list
                                        = (List<ProCart>) request.getAttribute("cartPro");
                                String pattern = "###,###.###";
                                DecimalFormat decimalFormat = new DecimalFormat(pattern);
                                int sum = 0;
                                for (ProCart pro : list) {
                                    sum += pro.getPrice() * pro.getStatus();
                            %>
                            <tr >
                                <th >
                                    <div class="p-2 ">
                                        <img src="<%=pro.getImg()%>" class="img-fluid rounded shadow-sm" width="100">

                                        <div class="ml-3 d-inline-block align-middle">
                                            <h5 class="">
                                                <a href="#" class=""><strong><%=pro.getName()%></strong></a>
                                            </h5>
                                            <span CLASS="text-muted font-weight-normal font-italic d-block"><%=pro.getCategory()%></span>
                                        </div>
                                    </div>
                                </th>
                                <td class="align-middle">
                                    <strong><%=pro.getId()%></strong>
                                </td>
                                <td class="align-middle">
                                    <%
                                        String format1 = decimalFormat.format(pro.getPrice());
                                    %>
                                    <strong><%=format1%></strong>
                                </td>
                                <td class="align-middle">
                                    <div class="quaty slg" style="width: 100px" >

                                        <form action="UpdateCart" method="post">
                                            <input type="hidden" name="id" value="<%=pro.getId()%>">
                                            <%
                                                ProductDAO dao = new ProductDAO();
                                                Product p = dao.getProById(pro.getId());
                                            %>
                                            <input type="number" name="soLuong" id="soLuong" min="0" max="<%=p.getQuantity()%>" oninvalid="alert('Trong kho không còn đủ số lượng bạn cần');" value="<%=pro.getStatus()%>">
                                            <button type="submit" class="btn btn-outline-danger" data-toggle="collapse"  data-target="#demo">Update<i></i></button>
                                        </form> 
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <%
                                        int total = pro.getPrice() * pro.getStatus();
                                        String format2 = decimalFormat.format(total);
                                    %>
                                    <strong><%=format2%></strong>
                                </td>
                                <td class="align-middle">
                                    <a  href="DeleteProInCart?id=<%=pro.getId()%>" ><i class="fa fa-trash"></i></a>
                                </td>

                            </tr>
                        <div id ="doServlet"></div>
                        <%
                            }
                        %>
                        <%--</c:forEach>--%>
                        </tbody>

                    </table>


                    <div style="margin: 20px; color: gray">
                        <h3 >Tổng tiền:</h3>
                        <%
                            String format = decimalFormat.format(sum);
                        %>
                        <h2><%=format%> VND</h2>
                    </div>

                    <a href="Check"><button class="btn btn-block btn-info" data-toggle="collapse">Thanh toán</button></a>
                </div>
            </div>


        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript">
            function add() {
                var soluong = parseInt($("#sl").html());
                soluong += 1;
                $("#sl").html(soluong);
                $("#soLuong").val(soluong);
            }
            function sub() {
                var soluong = parseInt($("#sl").html());
                if (soluong > 1) {
                    soluong -= 1;
                    $("#sl").html(soluong);
                    $("#soLuong").val(soluong);
                }

            }
        </script>
    </body>
</html>
