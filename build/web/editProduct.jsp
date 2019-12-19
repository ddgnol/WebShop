<%-- 
    Document   : editProductjsp
    Created on : Dec 11, 2019, 10:56:44 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>

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

        <div class="container-fluid">
            <div class="row">
                <div class="row" style="margin: 50px; margin-bottom: 100px">
                    <div class="col-sm-4 ">
                        <img src="${pro.img}" style="width: 400px; height: 600px" class="w3-card">
                    </div>
                    <div class="col-sm-7 " style="margin: 20px; padding-left: 150px">
                        <form action="EditProduct" method="POST" enctype="multipart/form-data">

                            <!--                <div  style="margin:20px">
                                                <h1>Sửa sản phẩm</h1>
                                                <div>
                                                    <label for="id">Mã Sản Phẩm:</label>
                                                    <input class="w3-input w3-padding-16" type="text" name="id" value="${id}" id="id" readonly>
                                                    <a style="color: red;font-weight:500">${id}</a>
                                                </div>
                                                <div>
                                                    <label for="name">Tên Sản Phẩm:</label>
                                                    <input class="w3-input w3-padding-16" type="text" value="${pro.name}"  name="name" id="name">
                                                </div>
                                                
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
                                                <div>
                                                    <label for="price">Giá Sản Phẩm:</label>
                                                    <input class="w3-input w3-padding-16" type="text" value="${pro.price}"  name="price" id="price" >
                                                </div>
                                                
                                                <div>
                                                    <label for="describe">Miêu Tả:</label>
                                                    <input class="w3-input w3-padding-16" type="text" value="${pro.describe}"  name="describe" id="describe" >
                                                </div>
                                                
                                                <div>
                                                    <label for="image">Hình Ảnh Sản Phẩm:</label>
                                                    <input class="w3-input w3-padding-16" type="text" value="${pro.img}"  name="image" id="image">
                                                </div>
                                                
                            
                            
                                            </div>-->
                            <div id="updateProduct" class="container " style="margin:20px">
                                <h3 style="color: red">${error}</h3>
                                <h1>Sửa sản phẩm</h1>
                                <div class="form-group">
                                    <label class="control-label" style="margin-left: 10px "
                                           for="ProductId">Mã sản phẩm: </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="id" required="required"
                                               class="form-control col-md-7 col-xs-12" name="id" value="${id}" readonly>
                                    </div>
                                </div>
                                <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="Mã sản phẩm"  name="id" id="id" required>-->
                                <div class="form-group">
                                    <label class="control-label" style="margin-left: 10px "
                                           for="productName">Tên sản phẩm:</label>
                                    <div style="margin-left: 10px">
                                        <input type="text" id="name" required="required"
                                               class="form-control " name="name" value="${pro.name}">
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
                                           for="productName">Price:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="price" required="required"
                                               class="form-control col-md-7 col-xs-12" name="price" value="${pro.price}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="productName">Số lượng:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="quantity" required="required"
                                               class="form-control col-md-7 col-xs-12" name="quantity" value="${pro.quantity}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="productName">Mô tả:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea rows="4" cols="50" id="describe" required="required"
                                                  name="describe">${pro.describe}</textarea>
                                    </div>
                                </div>
                                <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="describe"  name="describe" id="describe" required >-->

                                <!--                    <input class="w3-input w3-padding-16" type="text" placeholder="img"  name="image" id="image" required>-->
                                <label for="anh3"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">Ảnh</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="anh3"
                                           type="file" name="anh3" accept="image/*" onchange="loadFile(event)" value="${pro.img}">
                                </div>
                            </div>
                            <div class="row" style="margin: 20px">
                                <input style="width:150px; height: 50px; margin:  30px" type = "submit" value = "Update" />
                                <button style="margin: 30px; width: 150px; height: 50px">
                                    <a href="<c:url value="/AdminView"/>">Quay lại</a>
                                </button>
                            </div>

                    </div>

                    </form>
                </div>

            </div>


    </body>
</html>
