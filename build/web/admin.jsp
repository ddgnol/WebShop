<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ADMIN</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            var loadFile = function (event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('output');
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            };// code display image upload
        </script>
    </head>
    <body class="w3-light-grey w3-content" style="max-width:1600px">

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container">
                <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
                    <i class="fa fa-remove"></i>
                </a>
                <img src="image/admin.jpg" style="width:45%;" class="w3-round"><br><br>
                <h4><b>ADMIN</b></h4>

            </div>
            <div class="w3-bar-block">
                <a href="#sanpham" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ">Sản phẩm</a> 
                <a href="#updateProduct" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Thêm sản phẩm</a>
                <a href="#khachhang" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Khách hàng</a> 
                <a href="#sanphamduocquantam" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Sản phẩm được quan tâm</a>
                <a href="index.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Trở lại trang chủ</a>
            </div>

        </nav>

        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px">

            <!-- Header -->
            <header id="sanpham">
                <h2 style="padding:10px"><strong>Sản phẩm</strong></h2>
            </header>
            <div class="container">           
                <table class="table table-dark table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ảnh</th>
                            <th>TÊN SẢN PHẨM</th>
                            <th>GIÁ</th>
                            <th>MIÊU TẢ</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pro" items="${listPro}">
                            <tr>
                                <td>${pro.id}</td>
                                <td>
                                    <div style="width:100px;height: 80px">
                                        <img src="${pro.img}" style="width: 100%; height: 100%">
                                    </div>
                                </td>
                                <td>${pro.name}</td>
                                <td>${pro.price}</td>
                                <td>${pro.describe}</td>
                                <td>
                                    <a href="<c:url value="EditProduct?${pro.id}"/>">Sửa</a>

                                    <form action="DeleteProduct?id=${pro.id}" method="post">
                                        <button>Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <form action="AddProduct" method="POST" enctype="multipart/form-data">
                <div id="updateProduct" class="container " style="margin:20px">
                    <h1>Thêm sản phẩm</h1>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="ProductId">MA SAN PHAM </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="id" required="required"
                                   class="form-control col-md-7 col-xs-12" name="id">
                        </div>
                    </div>
                    <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="Mã sản phẩm"  name="id" id="id" required>-->
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productName">Tên sản phẩm </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="name" required="required"
                                   class="form-control col-md-7 col-xs-12" name="name">
                        </div>
                    </div>
                    <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="Tên sản phẩm"  name="name" required>-->
                    <div class="form-check-inline">
                        <label class="form-check-label" for="check1">
                            <input type="checkbox" class="form-check-input" id="check1" name="category" value="ĐIỆN THOẠI" checked>ĐIỆN THOẠI
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="check2">
                            <input type="checkbox" class="form-check-input" id="check2" name="category" value="LAPTOP">LAPTOP
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" id="check3" name="category" value="MÁY ẢNH">MÁY ẢNH
                        </label>
                    </div>
                    <!--                                        <input class="w3-input w3-padding-16" type="text" placeholder="Price"  name="price" id="price" required >-->
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productName">Price </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="price" required="required"
                                   class="form-control col-md-7 col-xs-12" name="price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productName">Mo ta </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="describe" required="required"
                                   class="form-control col-md-7 col-xs-12" name="describe">
                        </div>
                    </div>
                    <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="describe"  name="describe" id="describe" required >-->

                    <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="img"  name="image" id="image" required>-->
                    <label for="anh3"
                           class="control-label col-md-3 col-sm-3 col-xs-12">Ảnh</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="anh3" class="form-control col-md-7 col-xs-12"
                               type="file" name="anh3" accept="image/*" onchange="loadFile(event)">
                    </div>

                </div>
                <input style="width:400px; height: 50px; margin:  50px" type = "submit" value = "Them san pham" />
            </form>
            <!-- First Photo Grid-->


            <!-- Pagination -->

            <div id="khachhang">
                <h2 style="padding:10px"><strong>Hóa đơn khách hàng</strong></h2>
            </div>
            <div class="container">           
                <table class="table table-dark table-striped">
                    <thead>
                        <tr>
                            <th>Mã khách hàng</th>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>GIÁ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${listOrder}">
                            <tr>
                                <td>${order.idCustomer}</td>
                                <td>${order.idPro}</td>
                                <td>${order.namePro}</td>
                                <td>${order.price}</td>
                            </tr>
                        </c:forEach> 
                    </tbody>
                </table>
            </div>



            <h2 id="sanphamduocquantam"><b>Sản phẩm được quan tâm</b></h2>




            <!-- Footer -->




            <!-- End page content -->
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
