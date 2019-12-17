<%-- 
    Document   : editProductjsp
    Created on : Dec 11, 2019, 10:56:44 PM
    Author     : Admin
--%>

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
        <style>

        </style>
    </head>
    <body class="w3-light-grey w3-content" style="max-width:1600px">
        
        <div>
        
        <form action="EditProduct" method="post">
                <div  style="margin:20px">
                    <h1>Sửa sản phẩm</h1>
                    <div>
                        <label for="id">Mã Sản Phẩm:</label>
                        <input class="w3-input w3-padding-16" type="text" name="id" value="${id}" id="id" hidden>
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
                    


                </div>
                <input style="width:400px; height: 50px; margin:  50px" type = "submit" value = "Update" />
            </form>
        </div>
        

    </body>
</html>
