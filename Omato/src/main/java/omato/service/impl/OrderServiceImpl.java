package omato.service.impl;

import omato.dao.OrderDao;
import omato.pojo.Order;
import omato.pojo.TrackYourOrder;
import omato.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//@Service
public class OrderServiceImpl implements OrderService {
//    @Autowired
    private OrderDao orderDao;
    @Override
    public List<Order> getAllOrder(String username) {
        return orderDao.getAllOrder(username);
    }

    @Override
    public void addToCart(Order order) {
        orderDao.addToCart(order);
    }

    @Override
    public void incrementQuanity(Order order) {
        orderDao.incrementQuanity(order);
    }

    @Override
    public void decrementQuanity(Order order) {
        orderDao.decrementQuanity(order);
    }

    @Override
    public double subtotal(String username) {
        double subtotal=0;
        for(Order order1:orderDao.getAllOrder(username)){
            subtotal +=order1.getProduct_price()*order1.getQuantity();
        }
        return subtotal;
    }

    @Override
    public double totalItems(String username) {
        double totalItems=0;
        for(Order order1:orderDao.getAllOrder(username)){
            totalItems++;
        }
        return totalItems;
    }

    @Override
    public double subtotalInTrack(String orderId) {
        double subtotal=0;
        for(TrackYourOrder trackYourOrder:orderDao.trackYouOrderProduct(orderId)){
            subtotal +=trackYourOrder.getProduct_price()*trackYourOrder.getQuantity();
        }
        return subtotal;
    }

    @Override
    public double totalItemsInTrack(String orderId) {
        double totalItems=0;
        for(TrackYourOrder trackYourOrder:orderDao.trackYouOrderProduct(orderId)){
            totalItems++;
        }
        return totalItems;
    }

    @Override
    public void deleteFromCart(Order order) {
        orderDao.deleteFromCart(order);
    }

    @Override
    public void deleteCart(String userName) {
        orderDao.deleteCart(userName);
    }

    @Override
    public List<TrackYourOrder> trackYourAllOrder(String userName) {
        return orderDao.trackYourAllOrder(userName);
    }

    @Override
    public List<TrackYourOrder> trackYouOrderProduct(String orderId) {
        return orderDao.trackYouOrderProduct(orderId);
    }

    @Override
    public void insertOrderDetailsInTrack(TrackYourOrder trackYourOrder) {
        orderDao.insertOrderDetailsInTrack(trackYourOrder);
    }

    @Override
    public Order duplicateAddToCart(String username, int product_id) {
        try{
            return orderDao.duplicateAddToCart(username,product_id);
        }catch (Exception e){
            return null;
        }
    }


    public OrderDao getOrderDao() {
        return orderDao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
}
