package omato.validator;

import omato.pojo.OrderDetails;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AddressValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        OrderDetails orderDetails = (OrderDetails) o;
        String name = orderDetails.getName()+" ";
        String address=orderDetails.getAddress()+" ";
        String city;
        String landmark;
        String pincode=""+orderDetails.getPincode();
        String mobile=""+orderDetails.getMobile();
        String email=orderDetails.getEmail()+" ";
        ValidationUtils.rejectIfEmpty(errors, "name", "name.empty", "* Name cannot be empty");
        if (Character.isLowerCase(name.charAt(0))) {
            errors.rejectValue("name","name.error","Name 1st Letter should be capital");
        }
        ValidationUtils.rejectIfEmpty(errors, "address", "address.empty", "* Address cannot be empty");
        if(address.length()<5){
            errors.rejectValue("address","address.error", "Address contain minimum 5 character");
        }
        ValidationUtils.rejectIfEmpty(errors, "city", "city.empty", "* City cannot be empty");
        ValidationUtils.rejectIfEmpty(errors, "landmark", "landmark.empty", "* Landmark cannot be empty");
        ValidationUtils.rejectIfEmpty(errors, "pincode", "pincode.empty", "* Pincode cannot be empty");
        if(orderDetails.getPincode()==0 || pincode.length()!=6){
            errors.rejectValue("pincode","pincode.error","Enter valid Pincode");
        }
        ValidationUtils.rejectIfEmpty(errors, "mobile", "mobile.empty", "* Mobile cannot be empty");
        if(orderDetails.getMobile()==0 || mobile.length()!=10 || !mobile.startsWith("6") && !mobile.startsWith("7") && !mobile.startsWith("8") && !mobile.startsWith("9")){
            errors.rejectValue("mobile","mobile.error","Enter Valid Mobile Number which is start's from 6,7,8,9");
        }
        ValidationUtils.rejectIfEmpty(errors, "email", "email.empty", "* Email cannot be empty");
        if(!email.contains("@")){
            errors.rejectValue("email","email.error","Email contain @ ");
        }

    }
}
