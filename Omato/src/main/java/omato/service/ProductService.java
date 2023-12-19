package omato.service;

import omato.pojo.Product;

import java.util.List;

public interface ProductService {

    /*
     * Adds a new product to the system.
     *
     * @param product The Product object representing the details of the new product to be added.
     */
    public void addProduct(Product product);

    /*
     * Retrieves information about a single product based on its unique identifier.
     *
     * @param product_id The unique identifier of the product.
     * @return Product The Product object containing details of the specified product.
     */
    public Product getSingleProduct(int product_id);

    /*
     * Retrieves a list of products belonging to a specific category.
     *
     * @param product_category The category for which products are to be retrieved.
     * @return List<Product> A list containing all products belonging to the specified category.
     */
    public List<Product> getProductAccordingToCategory(String product_category);

    /*
     * Retrieves a list of all products in the system.
     *
     * @return List<Product> A list containing all products in the system.
     */
    public List<Product> getAllProduct();

    /*
     * Retrieves a list of products based on a search query.
     *
     * @param search The search query used to filter products.
     * @return List<Product> A list containing products that match the search query.
     */
    public List<Product> getAllProductAccordingToSearch(String search);
}
