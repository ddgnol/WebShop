
package Model;


public class orderCart {
    String idCustomer;
    String idPro;
    String namePro;
    int price;
    int status;
    
    public orderCart(){
        
    }
    
    public orderCart(String idCustomer, String idPro, int Status){
        this.idCustomer=idCustomer;
        this.idPro=idPro;
        this.status=Status;
    }
    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getIdPro() {
        return idPro;
    }

    public void setIdPro(String idPro) {
        this.idPro = idPro;
    }

    public int getStatus() {
        return status;
    }

    public String getNamePro() {
        return namePro;
    }

    public void setNamePro(String namePro) {
        this.namePro = namePro;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
