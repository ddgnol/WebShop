
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

                                <form action="CheckOut" method="POST">
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
        $(document).ready(function(){
                $('#province').change(function(event){
                                var pro = $('#province').val();
                                $.ajax({
                                        type: "GET",
                                        data: {proname: pro},
                                        url: "DistrictSer",
                                        success: function(responseJson){
                                                var $dis = $('#district');
                                                $dis.find('option').remove();
                                                $.each(responseJson, function(key,value){
                                                        $('<option>').val(value).text(value).appendTo($dis);
                                                });
                                        }
                                })
                });     
        });
            </script>
            
            <script type="text/javascript">
        $(document).ready(function(){
                $('#district').change(function(event){
                                var dis = $('#district').val();
                                $.ajax({
                                        type: "GET",
                                        data: {disname: dis},
                                        url: "WardSer",
                                        success: function(responseJson){
                                                var $war = $('#ward');
                                                $war.find('option').remove();
                                                $.each(responseJson, function(key, value){
                                                        $('<option>').val(value).text(value).appendTo($war);
                                                });
                                        }
                                })
                });     
        });
            </script>
            
            
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>