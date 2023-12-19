package omato.controller;

/*
 * This controller is only for Customer use.
 * In this controller, the customer can see the food and order the food.
 */

import omato.pojo.Product;
import omato.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

@Controller
public class FoodController {
    @Autowired
    private ProductServiceImpl productService; // By using this, we can access all the methods available in this class

    /*
     * Handler to display all the products to the customer
     * All the products mean all categories
     */
    @RequestMapping("/allFoodMenu")
    public ModelAndView allFoodMenu() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("view", productService.getAllProduct());
        modelAndView.setViewName("foodView0");
        return modelAndView;
    }

    /*
     * Handler to display products according to the specified category
     */
    @RequestMapping("/foodMenuAccordingToCategory")
    public String foodMenuAccordingToCategory(Model model, @RequestParam String product_category) {
        model.addAttribute("view", productService.getProductAccordingToCategory(product_category));
        return "foodView0";
    }
}
