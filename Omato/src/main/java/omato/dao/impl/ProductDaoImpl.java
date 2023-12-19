package omato.dao.impl;

import omato.dao.ProductDao;
import omato.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

//@Repository
public class ProductDaoImpl implements ProductDao {
//    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public List<Product> getAllProduct() {
        String query = "select * from product";
        return jdbcTemplate.query(query,new BeanPropertyRowMapper<>(Product.class));
    }

    @Override
    public List<Product> getAllProductAccordingToSearch(String search) {
        String query = "SELECT * FROM product WHERE product_name  LIKE ?";
        return jdbcTemplate.query(query,new BeanPropertyRowMapper<>(Product.class),"%"+search+"%");
    }

    @Override
    public Product getSingleProduct(int product_id) {
        String query = "select * from product where product_id=?";
        return jdbcTemplate.queryForObject(query,new BeanPropertyRowMapper<>(Product.class),product_id);
    }

    @Override
    public void addProduct(Product product) {
        String query="insert into product (product_name,product_price,product_category,product_imageUrl) values(?,?,?,?)";
        jdbcTemplate.update(query,product.getProduct_name(),product.getProduct_price(),product.getProduct_category(),product.getProduct_imageUrl());
    }

    @Override
    public List<Product> getProductAccordingToCategory(String product_category) {
        String query = "select * from product where product_category=?";
        return jdbcTemplate.query(query,new BeanPropertyRowMapper<>(Product.class),product_category);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}

//CREATE TABLE product (
//        product_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
//        product_name VARCHAR(255) NOT NULL,
//product_price DECIMAL(10,2) NOT NULL,
//product_category VARCHAR(50) NOT NULL,
//product_imageUrl VARCHAR(5000)
//);
