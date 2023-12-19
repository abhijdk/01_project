package omato.controller;

import omato.pojo.Order;
import omato.pojo.SignUp;
import omato.security.SecurityService;
import omato.service.OrderService;
import omato.validator.AddressValidator;
import omato.validator.SignUpValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class LoginController {
    @Autowired
    private SecurityService securityService;
    @Autowired
    private SignUpValidator signUpValidator;
    @Autowired
    private OrderService orderService;
    int product_id;

    /*
     * before login when we try to add to card
     * at that time this handler going to login
     * then add an item to the user's shopping cart*/
    @RequestMapping("/addToCart_login")
    private String addToCart(@ModelAttribute Order order, Principal principal) {
        if (order.getProduct_id() > 0 && principal == null) {
            product_id = order.getProduct_id();
            return "login";
        } else {
            order.setProduct_id(product_id);
            return "redirect:/user/addToCart?product_id=" + product_id;
        }
    }

    /*
     * Handler to display the Custom login page
     */
    @RequestMapping("/login")
    public String login(@ModelAttribute Order order) {

        return "login";
    }

    /*
     * Handler to handle logout and display the Custom login page
     */
    @RequestMapping("/logoutDone")
    public String logout() {
        return "login";
    }

    /*
     * Handler to display the sign-up form
     */
    @RequestMapping("/signup")
    public String signup(@ModelAttribute  SignUp signUp) {
        return "signUpForm";
    }

    /*
     * Handler to process the sign-up form submission
     */
    @RequestMapping(value = "/processSignup", method = RequestMethod.POST)
    public String processSignup(@ModelAttribute SignUp signUp, Model model, BindingResult bindingResult) {
        signUpValidator.validate(signUp, bindingResult);
        if (bindingResult.hasErrors()) { //If something error occers in signup it redirect to signUpForm again
            return "signUpForm";
        }
        securityService.signUp(signUp);
        return "login";
    }
}
