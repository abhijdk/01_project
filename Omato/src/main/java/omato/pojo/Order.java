package omato.pojo;

import java.sql.Timestamp;

public class Order {
    private int order_id;
    private String username;
    private int product_id;
    private String product_name;
    private double product_price;
    private String product_category;
    private String product_imageUrl;
    private Timestamp created_at;
    private int quantity;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public String getProduct_imageUrl() {
        return product_imageUrl;
    }

    public void setProduct_imageUrl(String product_imageUrl) {
        this.product_imageUrl = product_imageUrl;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", username='" + username + '\'' +
                ", product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", product_price=" + product_price +
                ", product_category='" + product_category + '\'' +
                ", product_imageUrl='" + product_imageUrl + '\'' +
                ", created_at=" + created_at +
                ", quantity=" + quantity +
                '}';
    }
}
