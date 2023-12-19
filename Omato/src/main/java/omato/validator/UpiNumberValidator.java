package omato.validator;

import omato.pojo.OrderDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Controller
public class UpiNumberValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        OrderDetails orderDetails=(OrderDetails) o;
        String mobile=""+orderDetails.getMobile();
        if(orderDetails.getMobile()==0){
            errors.rejectValue("mobile","mobile.error","You need to give Mobile number for payment");
        }  else if(mobile.length()!=10 ){
            errors.rejectValue("mobile","mobile.error","Enter Valid 10 digit Mobile Number ");
        }  else if(!mobile.startsWith("6") && !mobile.startsWith("7") && !mobile.startsWith("8") && !mobile.startsWith("9")){
            errors.rejectValue("mobile","mobile.error","Enter Valid Mobile Number which is start's from 6,7,8,9");
        }
    }
}
