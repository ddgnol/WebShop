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
                <img src="image/admin.jpg" style="width:45%;" class="w3-round"><br><br>
                <h4><b>${cus.name}</b></h4>

            </div>
            <div class="w3-bar-block">
                <a href="updatecustomer" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ">Sửa thông tin</a> 
                <a href="updateaccount" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Sửa mật khẩu</a>
                <a href="thanhtoan.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Thông tin thanh toán</a>
                <a href="index.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">Quay lại trang chủ</a>
            </div>
        </nav>

        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <h2 style="color: red; margin-left: 350px;">${error}</h2>
        <div class="w3-main" style="margin-left:300px">

          
            <!-- update mật khẩu -->

            <form action="updateaccount" method="POST" name="form1" onsubmit="return matchpass()">
                <input  type="text" name="id" value="${acc.id}" hidden>
                <div id="updateAcc" class="container " style="margin:20px">
                    <h1>Sửa mật khẩu</h1>
                    <table>
                        <tr>
                            <td>Mật khẩu cũ:</td>
                            <td> <input class="w3-input w3-padding-16" type="password" name="password" required></td>
                        </tr>
                        <tr>
                            <td>Mật khẩu mới:</td> 
                            <td><input class="w3-input w3-padding-16" type="password" name="password1" required></td>
                        </tr>
                        <tr>
                            <td>Nhập lại mật khẩu mới:</td> 
                            <td><input class="w3-input w3-padding-16" type="password" name="password2" required><span id="passloc"></span></td>
                        </tr>
                    </table>
                </div>
                <input style="width:400px; height: 50px; margin:  50px" type = "submit" value = "Update" />
            </form>

                    <script type="text/javascript">
                        function matchpass() {
                            var firstpassword = document.form1.password1.value;
                            var secondpassword = document.form1.password2.value;
 
                            if (firstpassword == secondpassword) {
                            return true;
                            } else {
                            document.getElementById("passloc").innerHTML = "confirm mật khẩu sai";
                            return false;
                            }
                        }
                    </script>


                  

            
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
