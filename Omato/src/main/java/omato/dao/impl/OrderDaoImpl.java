package omato.dao.impl;

import omato.dao.OrderDao;
import omato.pojo.Order;
import omato.pojo.TrackYourOrder;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

//@Repository
public class OrderDaoImpl implements OrderDao {
//    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Order> getAllOrder(String username) {
        String query = "SELECT o.id AS order_id, o.username, p.product_id, p.product_name, p.product_price, p.product_category, p.product_imageUrl, o.created_at, o.quantity FROM orders o JOIN product p ON o.product_id = p.product_id where username=?";
        return jdbcTemplate.query(query,new BeanPropertyRowMapper<>(Order.class),username);
    }

    @Override
    public void addToCart(Order order) {
        String query = "INSERT INTO orders (username, product_id) VALUES (?, ?)";
        jdbcTemplate.update(query, order.getUsername(), order.getProduct_id());
    }

    @Override
    public void incrementQuanity(Order order) {
        String query = "UPDATE orders SET quantity = ? + 1 WHERE username = ? AND product_id = ?";
        jdbcTemplate.update(query,order.getQuantity(),order.getUsername(),order.getProduct_id());
    }

    @Override
    public void decrementQuanity(Order order) {
        String query = "UPDATE orders SET quantity = ?-1  WHERE username = ? AND product_id = ?";
        jdbcTemplate.update(query,order.getQuantity(),order.getUsername(),order.getProduct_id());
    }

    @Override
    public void deleteFromCart(Order order) {
        String query = "delete from orders where username=? and product_id=?";
        jdbcTemplate.update(query,order.getUsername(),order.getProduct_id());
    }

    @Override
    public void deleteCart(String userName) {
        String query = "delete from orders where username=?";
        jdbcTemplate.update(query,userName);
    }

    @Override
    public List<TrackYourOrder> trackYourAllOrder(String userName) {
        String query = " select * from track where username=?";
        return jdbcTemplate.query(query,new BeanPropertyRowMapper<>(TrackYourOrder.class),userName);
    }

    @Override
    public List<TrackYourOrder> trackYouOrderProduct(String orderId) {
        String query = " SELECT t.Order_id, t.username, p.product_name, p.product_price, p.product_category, p.product_imageUrl, t.created_at, t.quantity FROM track t JOIN product p ON t.product_id = p.product_id WHERE t.Order_id =?";
        return jdbcTemplate.query(query,new BeanPropertyRowMapper<>(TrackYourOrder.class),orderId);
    }

    @Override
    public void insertOrderDetailsInTrack(TrackYourOrder trackYourOrder) {
        String query = "INSERT INTO track (Order_id, username, product_id,  quantity) SELECT ?  AS Order_id, username, product_id,  quantity FROM orders WHERE username =?";
        jdbcTemplate.update(query,trackYourOrder.getOrderId(),trackYourOrder.getUsername());
    }



    @Override
    public Order duplicateAddToCart(String username, int product_id) {
        String query = "select * from orders where username=? and product_id=?";
        return jdbcTemplate.queryForObject(query,new BeanPropertyRowMapper<>(Order.class),username,product_id);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}



//CREATE TABLE orders (
//        order_id INT NOT NULL AUTO_INCREMENT,
//        userName VARCHAR(255) NOT NULL,
//product_id INT NOT NULL,
//product_name VARCHAR(255) NOT NULL,
//product_price DECIMAL(10,2) NOT NULL,
//product_category VARCHAR(50) NOT NULL,
//product_imageUrl VARCHAR(5000),
//product_quantity INT NOT NULL DEFAULT 1,
//created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
//PRIMARY KEY (order_id),
//FOREIGN KEY (product_id) REFERENCES product(product_id)
//        );


//CREATE TABLE track (
//        Order_id VARCHAR(255) NOT NULL,
//username VARCHAR(255) NOT NULL,
//product_id INT NOT NULL,
//created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
//quantity INT NOT NULL DEFAULT 1
//        );