package omato.service.impl;

import omato.dao.ProductDao;
import omato.pojo.Product;
import omato.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//@Service
public class ProductServiceImpl implements ProductService {
//    @Autowired
    private ProductDao productDao;

    @Override
    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    @Override
    public Product getSingleProduct(int product_id) {
        return productDao.getSingleProduct(product_id);
    }

    @Override
    public List<Product> getProductAccordingToCategory(String product_category) {
        return productDao.getProductAccordingToCategory(product_category);
    }

    @Override
    public List<Product> getAllProduct() {
        return productDao.getAllProduct();
    }

    @Override
    public List<Product> getAllProductAccordingToSearch(String search) {
        return productDao.getAllProductAccordingToSearch(search);
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
}
