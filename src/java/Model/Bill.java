/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author DELL LATITUDE
 */
public class Bill {
    int id;
    String id_cus;
    int price;
    String status;
    String address;
    String phone;
    String payment;
    String order_day;

    public String getOrder_day() {
        return order_day;
    }

    public void setOrder_day(String order_day) {
        this.order_day = order_day;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getId_cus() {
        return id_cus;
    }

    public void setId_cus(String id_cus) {
        this.id_cus = id_cus;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
