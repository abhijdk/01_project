package omato.service;

import omato.pojo.Order;
import omato.pojo.TrackYourOrder;

import java.util.List;

public interface OrderService {

    /*
     * Retrieves a list of all orders associated with a specific user.
     *
     * @param username The username used to retrieve all orders associated with that particular user from the database.
     * @return List<Order> A list containing all orders associated with the specified user.
     */
    public List<Order> getAllOrder(String username);

    /*
     * Adds a new order to the user's shopping cart.
     *
     * @param order The Order object representing the details of the new order to be added to the shopping cart.
     */
    public void addToCart(Order order);

    /*
     * Increments the quantity of a product in the user's shopping cart.
     *
     * @param order The Order object containing the username and product ID to identify the product in the shopping cart.
     */
    public void incrementQuanity(Order order);

    /*
     * Decrements the quantity of a product in the user's shopping cart.
     *
     * @param order The Order object containing the username and product ID to identify the product in the shopping cart.
     */
    public void decrementQuanity(Order order);

    /*
     * Calculates the subtotal of the items in the user's shopping cart.
     *
     * @param username The username used to retrieve all product prices associated with the user's shopping cart.
     * @return double The subtotal of the items in the shopping cart.
     */
    public double subtotal(String username);

    /*
     * Calculates the total number of items in the user's shopping cart.
     *
     * @param username The username used to retrieve all items associated with the user's shopping cart.
     * @return double The total number of items in the shopping cart.
     */
    public double totalItems(String username);

    /*
     * Calculates the subtotal of items in a tracked order.
     *
     * @param orderId The order ID used to retrieve all product prices associated with the tracked order.
     * @return double The subtotal of the items in the tracked order.
     */
    public double subtotalInTrack(String orderId);

    /*
     * Calculates the total number of items in a tracked order.
     *
     * @param orderId The order ID used to retrieve all items associated with the tracked order.
     * @return double The total number of items in the tracked order.
     */
    public double totalItemsInTrack(String orderId);

    /*
     * Deletes a product from the user's shopping cart.
     *
     * @param order The Order object containing the username and product ID to identify the product in the shopping cart.
     */
    public void deleteFromCart(Order order);

    /*
     * Deletes the entire shopping cart of a user, after a successful order.
     *
     * @param userName The username used to delete all products added to the cart by the user.
     */
    public void deleteCart(String userName);

    /*
     * Retrieves a list of all tracked orders for a specific user.
     *
     * @param userName The username used to retrieve all tracked orders associated with that particular user.
     * @return List<TrackYourOrder> A list containing order details for the specified user.
     */
    public List<TrackYourOrder> trackYourAllOrder(String userName);

    /*
     * Retrieves a list of products associated with a tracked order.
     *
     * @param orderId The order ID used to retrieve all products associated with the tracked order.
     * @return List<TrackYourOrder> A list containing order details for the specified order ID.
     */
    public List<TrackYourOrder> trackYouOrderProduct(String orderId);

    /*
     * Inserts order details into the tracking system.
     *
     * @param trackYourOrder The TrackYourOrder object containing details of the order to be inserted into the tracking system.
     */
    public void insertOrderDetailsInTrack(TrackYourOrder trackYourOrder);

    /*
     * If the particular product is already added to the cart, it increments the quantity by 1.
     * Otherwise, inserts order details into the cart.
     *
     * @param username The username used to retrieve the user's cart.
     * @param product_id The product ID used to identify the product.
     * @return Order The Order object representing the updated or newly added order.
     */
    public Order duplicateAddToCart(String username, int product_id);

}
