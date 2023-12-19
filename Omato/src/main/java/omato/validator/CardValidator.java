package omato.validator;

import omato.pojo.Card;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Controller
public class CardValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        Card card=(Card) o;

         String cardNumber;
         String expiryDate;
         String cvv;
        ValidationUtils.rejectIfEmpty(errors,"cardNumber","cardNumber.empty","* Card Number is Mandatory");
    }
}
