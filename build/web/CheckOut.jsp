
<%@page import="Model.Customer"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="Model.ward"%>
<%@page import="Model.district"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.AddressDAO"%>
<%@page import="Model.province"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                font: 16px Arial;  
            }

            /*the container must be positioned relative:*/
            .autocomplete {
                position: relative;
                display: inline-block;
            }

            input {
                border: 1px solid transparent;
                background-color: #f1f1f1;
                padding: 10px;
                font-size: 16px;
            }

            input[type=text] {
                background-color: #f1f1f1;
                width: 100%;
            }

            input[type=submit] {
                background-color: DodgerBlue;
                color: #fff;
                cursor: pointer;
            }

            .autocomplete-items {
                position: absolute;
                border: 1px solid #d4d4d4;
                border-bottom: none;
                border-top: none;
                z-index: 99;
                /*position the autocomplete items to be the same width as the container:*/
                top: 100%;
                left: 0;
                right: 0;
            }

            .autocomplete-items div {
                padding: 10px;
                cursor: pointer;
                background-color: #fff; 
                border-bottom: 1px solid #d4d4d4; 
            }

            /*when hovering an item:*/
            .autocomplete-items div:hover {
                background-color: #e9e9e9; 
            }

            /*when navigating through the items using the arrow keys:*/
            .autocomplete-active {
                background-color: DodgerBlue !important; 
                color: #ffffff; 
            }
        </style>
        <title>Thanh Toán</title>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <br><br><br><br><br><br><br><br><br>
            <div class="container body">
                <div class="main_container">
                    <div class="row">
                        <div class="profile-content">
                            <h3 style="color: red">${error}</h3>
                        <div class="x_title col-md-12">
                            <h2 style="text-align: center;">Nhập thông tin thanh toán</h2>
                        </div>

                        <div style="padding: 5%; box-shadow: 1px 5px 8px">

                            <form autocomplete="off" action="CheckOut" method="POST">
                                <%
                                   // int isAdmin = (Integer) request.getAttribute("isAdmin");
                                    if (session.getAttribute("isAdmin") != null) {

                                %>
                                <div class="autocomplete" style="width: 350px">
                                    <span>Họ tên khách hàng</span> <input id="myInput" type="text" name="cus"
                                                                          class="form-control">
                                </div>
                                <%                                    }
                                %>
                                <div class="form-group">
                                    <span>Địa chỉ </span> <!--<input type="text" name="address"
                                                                 class="form-control">-->
                                    <div class="form-group">
                                        <div>
                                            <div>
                                                <label>Thành phố/Tỉnh</label>
                                                <div>
                                                    <select name="thanh pho" class="form-control" id="province">
                                                        <option value="0">Vui lòng chọn tỉnh/thành phố</option>
                                                        <%
                                                            AddressDAO addressDAO = new AddressDAO();
                                                            List<province> provinceList = addressDAO.getAllProvince();
                                                            for (province tp : provinceList) {
                                                        %>
                                                        <option value="<%=tp.getName()%>"><%=tp.getName()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div>
                                                <label>Quận/Huyện</label>
                                                <div>
                                                    <select name="quan" class="form-control" id="district">
                                                        <option value="0">Vui lòng chọn quận/huyện</option>

                                                    </select> 
                                                </div>
                                            </div>
                                            <div>
                                                <label>Phường/Xã</label>
                                                <div>
                                                    <select name="phuong" class="form-control" id="ward" >
                                                        <option value="0">Vui lòng chọn phường/xã</option>

                                                    </select> 
                                                </div>
                                            </div>
                                            <div>
                                                <label>Địa chỉ nhà cụ thể</label>
                                                <input class="form-control" type="text" name="so nha" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span>Số điện thoại</span> <input type="text" name="phone"
                                                                      class="form-control">
                                </div>
                                <div class="form-group">
                                    <span>Hình thức thanh toán </span> 
                                    <select name="payment" class="form-control">
                                        <option value="">--Chọn--</option>
                                        <option value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</option>
                                        <option value="Thanh toán qua ví momo">Thanh toán qua ví momo</option>
                                        <option value="Thanh toán qua tài khoản ngân hàng">Thanh toán qua tài khoản ngân hàng</option>
                                    </select>
                                </div>
                                <input class="btn btn-success" type="submit" value="Checkout">
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br><br><br>


        <script type="text/javascript">
            $(document).ready(function () {
                $('#province').change(function (event) {
                    var pro = $('#province').val();
                    $.ajax({
                        type: "GET",
                        data: {proname: pro},
                        url: "DistrictSer",
                        success: function (responseJson) {
                            var $dis = $('#district');
                            $dis.find('option').remove();
                            $.each(responseJson, function (key, value) {
                                $('<option>').val(value).text(value).appendTo($dis);
                            });
                        }
                    })
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#district').change(function (event) {
                    var dis = $('#district').val();
                    $.ajax({
                        type: "GET",
                        data: {disname: dis},
                        url: "WardSer",
                        success: function (responseJson) {
                            var $war = $('#ward');
                            $war.find('option').remove();
                            $.each(responseJson, function (key, value) {
                                $('<option>').val(value).text(value).appendTo($war);
                            });
                        }
                    })
                });
            });
        </script>
        <script>
            function autocomplete(inp, arr) {
                /*the autocomplete function takes two arguments,
                 the text field element and an array of possible autocompleted values:*/
                var currentFocus;
                /*execute a function when someone writes in the text field:*/
                inp.addEventListener("input", function (e) {
                    var a, b, i, val = this.value;
                    /*close any already open lists of autocompleted values*/
                    closeAllLists();
                    if (!val) {
                        return false;
                    }
                    currentFocus = -1;
                    /*create a DIV element that will contain the items (values):*/
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    /*append the DIV element as a child of the autocomplete container:*/
                    this.parentNode.appendChild(a);
                    /*for each item in the array...*/
                    for (i = 0; i < arr.length; i++) {
                        /*check if the item starts with the same letters as the text field value:*/
                        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                            /*create a DIV element for each matching element:*/
                            b = document.createElement("DIV");
                            /*make the matching letters bold:*/
                            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                            b.innerHTML += arr[i].substr(val.length);
                            /*insert a input field that will hold the current array item's value:*/
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                            /*execute a function when someone clicks on the item value (DIV element):*/
                            b.addEventListener("click", function (e) {
                                /*insert the value for the autocomplete text field:*/
                                inp.value = this.getElementsByTagName("input")[0].value;
                                /*close the list of autocompleted values,
                                 (or any other open lists of autocompleted values:*/
                                closeAllLists();
                            });
                            a.appendChild(b);
                        }
                    }
                });
                /*execute a function presses a key on the keyboard:*/
                inp.addEventListener("keydown", function (e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x)
                        x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                        /*If the arrow DOWN key is pressed,
                         increase the currentFocus variable:*/
                        currentFocus++;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 38) { //up
                        /*If the arrow UP key is pressed,
                         decrease the currentFocus variable:*/
                        currentFocus--;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 13) {
                        /*If the ENTER key is pressed, prevent the form from being submitted,*/
                        e.preventDefault();
                        if (currentFocus > -1) {
                            /*and simulate a click on the "active" item:*/
                            if (x)
                                x[currentFocus].click();
                        }
                    }
                });
                function addActive(x) {
                    /*a function to classify an item as "active":*/
                    if (!x)
                        return false;
                    /*start by removing the "active" class on all items:*/
                    removeActive(x);
                    if (currentFocus >= x.length)
                        currentFocus = 0;
                    if (currentFocus < 0)
                        currentFocus = (x.length - 1);
                    /*add class "autocomplete-active":*/
                    x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {
                    /*a function to remove the "active" class from all autocomplete items:*/
                    for (var i = 0; i < x.length; i++) {
                        x[i].classList.remove("autocomplete-active");
                    }
                }
                function closeAllLists(elmnt) {
                    /*close all autocomplete lists in the document,
                     except the one passed as an argument:*/
                    var x = document.getElementsByClassName("autocomplete-items");
                    for (var i = 0; i < x.length; i++) {
                        if (elmnt != x[i] && elmnt != inp) {
                            x[i].parentNode.removeChild(x[i]);
                        }
                    }
                }
                /*execute a function when someone clicks in the document:*/
                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
            }

            /*An array containing all the country names in the world:*/
            var countries = [];
            <%
                CustomerDAO dao = new CustomerDAO();
                List<Customer> list = dao.getAll();
                for(Customer cus: list){
            %>
                countries.push("<%=cus.getName()%>-<%=cus.getId()%>");
             <%
                 }
             %>
            /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
            autocomplete(document.getElementById("myInput"), countries);
        </script>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>