<%-- 
    Document   : hear
    Created on : Nov 28, 2019, 4:04:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div style="position:fixed; top:0px; left:0px; right:0px; z-index: 100 ">
            <!-------------------------------------LOGO--------------------------------------------------------- -->
            <!--        <nav class="navbar  bg-light justify-content-center ">
            
                        <a class="navbar justify-content-center  " href="index.jsp" style="padding-left: 700px">
                            <img src="image/logo.png" alt="Logo" style="width:30px; height: 30px; ">
                        </a>  
                        <button type="button" class="btn btn-link justify-content-end float-right "><i class="fas fa-user"></i> Tai khoan</button>
            
                    </nav>-->


            <div class="container-fluid  bg-light" style="padding-bottom: 20px;padding-top: 20px">
                <a class=" justify-content-center" href="index.jsp" style="padding-left: 700px; padding-bottom: 30px; margin:auto">
                    <img src="image/logo.png" class="" alt="Logo" style="width:50px; height: 50px">
                </a>


                <div class="dropdown" style="padding-bottom: 10px">
                    <a    href="#" class=" justify-content-end float-right " data-toggle="dropdown" ><i class="fas fa-user"></i> Chào ${cus.name} , Mã KH: ${cus.id}</a>
                    <!--                    <input type="button" class="btn btn-secondary float-right" value="Đăng xuất"/>-->
                    <div class="dropdown-menu" style="z-index: 1000">
                        <input type="button" class="btn btn-secondary" value="Đăng xuất"/>

                    </div>
                </div>
            </div>
            <div id="formlogin">
                <!----------------------------------HEADER----------------------------------------------------------------->
                <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center ">
                    <ul class="navbar-nav  ">


                        <li class="nav-item ">
                            <form action="products" method="get">
                                <a class="nav-link" href="products" >SẢN PHẨM</a>
                            </form>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Cart">GIỎ HÀNG</a>

                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="logchange" href="LoginForward" onclick="changelog()">ĐĂNG xuất</a>
                        </li>
                    </ul>
                </nav>
                <br>
            </div>


        </div>
        <script>
            var changeinout = document.getElementById("logchange")
        </script>
    </body>
</html>