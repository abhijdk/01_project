package omato.controller;

import omato.pojo.Order;
import omato.pojo.OrderDetails;
import omato.pojo.TrackYourOrder;
import omato.service.OrderService;
import omato.service.ProductService;
import omato.validator.AddressValidator;
import omato.validator.UpiNumberValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashSet;
import java.util.Random;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;
    @Autowired
    private AddressValidator addressValidator;
    @Autowired
    private UpiNumberValidator upiNumberValidator;
    int randomOtp;

    // Handler to display all products to the user
    @RequestMapping("/user/user")
    private String user(Model model, Principal principal) {
        model.addAttribute("view", productService.getAllProduct());
        model.addAttribute("name", principal.getName().toUpperCase());
        return "foodView";
    }

    /*
     * Handler to display all products (all categories) to the user
     */
    @RequestMapping("/user/allFoodMenu")
    public String allFoodMenu(Model model) {
        model.addAttribute("view", productService.getAllProduct());
        return "foodView";
    }

    /*
     * Handler to display products according to the specified category
     */
    @RequestMapping("/user/foodMenuAccordingToCategory")
    public String foodMenuAccordingToCategory(Model model, @RequestParam String product_category) {
        model.addAttribute("view", productService.getProductAccordingToCategory(product_category));
        return "foodView";
    }

    /*
     * Handler to display products according to the search
     */
    @RequestMapping("/user/search")
    public String foodMenuAccordingToSearch(Model model, @RequestParam String search) {
        model.addAttribute("view", productService.getAllProductAccordingToSearch(search));
        return "foodView";
    }

    // Handler to display the user's shopping cart
    @RequestMapping("/user/cartView")
    private String cartView(Model model, Principal principal) {
        model.addAttribute("view", orderService.getAllOrder(principal.getName()));
        model.addAttribute("subtotal", orderService.subtotal(principal.getName()));
        model.addAttribute("totalItems", orderService.totalItems(principal.getName()));
        return "cartView";
    }

    // Handler to add an item to the user's shopping cart
    @RequestMapping("/user/addToCart")
    private String addToCart(@ModelAttribute Order order, Principal principal) {
        if (orderService.duplicateAddToCart(principal.getName(), order.getProduct_id()) == null) {
            order.setUsername(principal.getName());
            orderService.addToCart(order);
            return "redirect:/user/cartView";
        } else {
            order.setQuantity(1);
            order.setUsername(principal.getName());
            orderService.incrementQuanity(order);
            return "redirect:/user/cartView";
        }
    }

    // Handler to increment the quantity of an item in the user's shopping cart
    @RequestMapping("/user/increment")
    private String increment(@ModelAttribute Order order) {
        orderService.incrementQuanity(order);
        return "redirect:/user/cartView";
    }

    // Handler to decrement the quantity of an item in the user's shopping cart
    @RequestMapping("/user/decrement")
    private String decrement(@ModelAttribute Order order) {
        if (order.getQuantity() <= 1) {
            orderService.deleteFromCart(order);
            return "redirect:/user/cartView";
        } else {
            orderService.decrementQuanity(order);
            return "redirect:/user/cartView";
        }
    }

    // Handler to delete an item from the user's shopping cart
    @RequestMapping("/user/deleteFromCart")
    private String deleteFromCart(@ModelAttribute Order order) {
        orderService.deleteFromCart(order);
        return "redirect:/user/cartView";
    }

    /*
     * Handler to display the address form for proceeding to buy
     */
    @RequestMapping("/user/proceedToBuy_TakeAddressDetails")
    public String proceedToBuy(@RequestParam("subtotal") String subtotal, @RequestParam("totalItems") String totalItems, Model model, @ModelAttribute("orderDetails") OrderDetails orderDetails) {
        System.out.println(orderDetails.getCity());
        if (subtotal.equals("0.0") || subtotal.equals("")) {
            model.addAttribute("error", "Your Cart is Empty, You need to add some items in your cart, After that you will able to do ProceedToBuy");
            return "cartView";
        } else {
            model.addAttribute("subtotal", subtotal);
            model.addAttribute("totalItems", totalItems);
            return "proceedToBuy_TakeAddressDetails";
        }
    }

    /*
     * Handler to display payment options
     */
    @RequestMapping("/user/paymentOption")
    public String paymentOption(@RequestParam("subtotal") String subtotal, @RequestParam("totalItems") String totalItems, Model model, @ModelAttribute("orderDetails") OrderDetails orderDetails, BindingResult bindingResult) {
        addressValidator.validate(orderDetails, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("subtotal", subtotal);
            model.addAttribute("totalItems", totalItems);
            return "proceedToBuy_TakeAddressDetails";
        }
        Double subTotal = Double.parseDouble(subtotal);
        if (orderDetails.getDeliveryType().equals("standard")) {
            subTotal += 30.00;
        }
        model.addAttribute("subtotal", subTotal);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("orderDetails", orderDetails);
        return "paymentOption";
    }

    /*
     * Handler to process the selected payment option
     * payment option like upi,phonepe,...,creditcard,...,Cash on Delivery etc
     */
    @RequestMapping("/user/processPayment")
    public String processPayment(@ModelAttribute OrderDetails orderDetails,@RequestParam String paymentOption, Model model, @RequestParam("subtotal") String subtotal, @RequestParam("totalItems") String totalItems, Principal principal, HttpSession httpSession, TrackYourOrder trackYourOrder) {
        model.addAttribute("subtotal", subtotal);
        model.addAttribute("totalItems", totalItems);
        if (paymentOption.equals("upi") || paymentOption.equals("phonePe") || paymentOption.equals("paytm") || paymentOption.equals("gPay")) {
            model.addAttribute("view", paymentOption.toUpperCase());
            return "upiForm";
        } else if (paymentOption.equals("debitCard") || paymentOption.equals("creditCard")) {
            model.addAttribute("view", paymentOption.toUpperCase());
            return "cardForm";
        } else {
            /**
             * If the user heat Cash on Delivery button
             * at that time it directly goes to succes page*/
            model.addAttribute("view", paymentOption.toUpperCase());
            model.addAttribute("orderId", httpSession.getId());

            // Get the current local date and time
            LocalDateTime currentDateTime = LocalDateTime.now();
            // Define a format for displaying the date and time
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            // Format the local date and time
            String formattedDateTime = currentDateTime.format(formatter);

            model.addAttribute("time", formattedDateTime);
            model.addAttribute("readyTheCash", "Ready the cash (" + subtotal + ") at the time of delivery");


            trackYourOrder.setOrderId(httpSession.getId());
            trackYourOrder.setUsername(principal.getName());
            orderService.insertOrderDetailsInTrack(trackYourOrder);
            orderService.deleteCart(principal.getName());
            return "success";
        }
    }

    /*
     * Handler to display the OTP form
     */
    @RequestMapping("/user/otp")
    public String otp(@ModelAttribute OrderDetails orderDetails, Model model, @RequestParam("subtotal") String subtotal, @RequestParam("totalItems") String totalItems, BindingResult bindingResult) {
       upiNumberValidator.validate(orderDetails,bindingResult);
       if(bindingResult.hasErrors()){
           return "upiForm";
       }
        model.addAttribute("subtotal", subtotal);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("view", orderDetails.getMobile());

        Random random = new Random();
        randomOtp = random.nextInt(900000) + 100000;
        System.out.println("Your Otp for your Order is "+randomOtp);

        return "otp";
    }

    /*
     * Handler to display the order success page
     */
    @RequestMapping("/user/success")
    public String success(Model model, @RequestParam("mobile") String mobile, @RequestParam("subtotal") String subtotal, @RequestParam("otp") int otp, @RequestParam("totalItems") String totalItems, HttpSession httpSession, Principal principal, TrackYourOrder trackYourOrder) {
        if (randomOtp != otp) {
            model.addAttribute("subtotal", subtotal);
            model.addAttribute("totalItems", totalItems);
            model.addAttribute("view", mobile);
            model.addAttribute("error", "Invalid Otp, Before Enter Otp, You need to verify 2nd Time");
            return "otp";
        } else {
            model.addAttribute("subtotal", subtotal);
            model.addAttribute("totalItems", totalItems);
            model.addAttribute("orderId", httpSession.getId());

            // Get the current local date and time
            LocalDateTime currentDateTime = LocalDateTime.now();
            // Define a format for displaying the date and time
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            // Format the local date and time
            String formattedDateTime = currentDateTime.format(formatter);

            model.addAttribute("time", formattedDateTime);

            trackYourOrder.setOrderId(httpSession.getId());
            trackYourOrder.setUsername(principal.getName());
            orderService.insertOrderDetailsInTrack(trackYourOrder);
            orderService.deleteCart(principal.getName());
            return "success";
        }
    }

    /*
     * After food order, user track the order
     */
    @RequestMapping("/user/trackYouOrder")
    public String trackYouOrder(Principal principal, Model model) {
        Set<String> set = new LinkedHashSet<>();
        for (TrackYourOrder trackYourOrder : orderService.trackYourAllOrder(principal.getName())) {
            set.add(trackYourOrder.getOrderId());
        }
        model.addAttribute("view", set);
        return "trackYourOrder";
    }

    /*
     * UserController track the order details (in one orderId How may product & that product price show)
     */
    @RequestMapping("/user/trackYouOrderProduct")
    public String trackYouOrderProduct(Principal principal, Model model, @RequestParam("orderId") String orderId) {
        model.addAttribute("view", orderService.trackYouOrderProduct(orderId));
        model.addAttribute("subtotal", orderService.subtotalInTrack(orderId));
        model.addAttribute("totalItems", orderService.totalItemsInTrack(orderId));
        return "trackYouOrderProduct";
    }
}
