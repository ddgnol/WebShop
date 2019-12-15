<%-- 
    Document   : AllProducts
    Created on : Dec 1, 2019, 10:12:49 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Ket qua tim kiem</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <br><br><br><br><br><br>
            <div class="container" style="padding-top: 100px">
                <div class="row">
                    <!--                ------------------------------MENU----------------------------->
                    <div class="col-sm-3">
                        <h1 class="my-4">SẢN PHẨM</h1>
                        <div class="list-group">
                            <a href="viewPhone" class="list-group-item" >Điện thoại</a>
                            <a href="viewLaptop" class="list-group-item">Laptop</a>
                            <a href="viewCamera" class="list-group-item">Máy ảnh</a>
                        </div>
                    </div>
                    <!--                -------------------------------CONTENT----------------------------------->
                    <div class="col-sm-9">
                        <h2>Kết quả tìm kiếm cho từ khóa: <p style="color: red">${search}</p></h2>
                            <br>
                            <hr>
                        <div class="row">                       
                        <%
                            String search =(String) request.getAttribute("search");
                            request.setAttribute("search", search);
                        %>
                        <c:forEach var="pro" items="${listPro}">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card h-100">
                                    <a href="ProDetail?id=${pro.id}"><img class="card-img-top" src="${pro.img}" alt=""></a>
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="ProDetail?id=${pro.id}">${pro.name}</a>
                                        </h4>
                                        <h5>${pro.price}</h5>
                                    </div>
                                    <div class="card-footer">
                                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                            <ul class="pagination justify-content-center"  style="margin-left: 200px"> 
                            <li class="page-item">
                                <!--                                <a class="page-link" href="javascript:void(0);">Previous</a>-->
                                <c:if test = "${currentPage != 1}">                            
                                    <a class="page-link" href ="search?page=${currentPage - 1}&search=${search}">Previous</a>                          
                                </c:if>
                            </li>
                            
                                <c:forEach begin="1" end="${noOfPages}" var="i">
                                    <c:choose>
                                        <c:when test="${currentPage eq i}">
                                        <li class="page-item ">${i}</li>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link active" href="search?page=${i}&search=${search}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            

                            <li class="page-item">
                                <!--                                <a class="page-link" href="javascript:void(0);">Next</a>-->
                                <c:if test="${currentPage lt noOfPages}">
                                    <a class="page-link" href ="search?page=${currentPage+1}&search=${search}">Next</a>                         
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
<!--<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                            <li class="page-item active"><a class="page-link" href="javascript:void(0);">2</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>-->