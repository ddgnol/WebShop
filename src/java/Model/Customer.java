/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

public class Customer {
   String id;
   String name;
   String phoneNum;
   String email;
   String dateOfBirth;
   String address;
   
   public Customer(){
       
   }
   public Customer(String id, String name,   String phoneNum,   String email,   String dateOfBirth,   String address){
       this.address=address;
       this.id=id;
       this.dateOfBirth= dateOfBirth;
       this.email=email;
       this.name=name;
       this.phoneNum=phoneNum;
   }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
   
}
