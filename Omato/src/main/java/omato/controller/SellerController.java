package omato.controller;

import omato.pojo.Product;
import omato.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class SellerController {
    @Autowired
    ProductService productService;

    /*
     * Handler to display the admin dashboard with all product avalable in the database
     */
    @RequestMapping("/admin/admin")
    public String admin(Model model, Principal principal){
        model.addAttribute("view",productService.getAllProduct());
        model.addAttribute("name",principal.getName().toUpperCase());
        return "foodViewForAdmin";
    }

    /*
     * Handler to display the form for adding a new product
     */
    @RequestMapping("admin/addProduct")
    public String addProduct(){
        return "addProduct";
    }

    /*
     * Handler to add a new product to the database
     */
    @RequestMapping("/admin/addProductToDb")
    public String addProductToDb(@ModelAttribute("product") Product product){
        productService.addProduct(product);
        return "redirect:/admin/admin";
    }
}
