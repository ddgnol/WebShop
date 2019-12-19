
package Model;
public class Product {
    String id;
    String name;
    String category;
    int price;
    String describe;
    String img;
    int quantity;

    public Product(String id, String name, String category, int price, String describe, String img, int quantity){
        this.id=id;
        this.category=category;
        this.describe=describe;
        this.img=img;
        this.name=name;
        this.price=price;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    public Product(){
        
    }
//    public Product(String id, String name, String category, int price, String describe, String img){
//        this.id=id;
//        this.category=category;
//        this.describe=describe;
//        this.img=img;
//        this.name=name;
//        this.price=price;
//    }
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
