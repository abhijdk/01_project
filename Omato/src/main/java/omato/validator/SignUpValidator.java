package omato.validator;

import omato.pojo.SignUp;
import omato.security.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.validation.ConstraintViolation;
import javax.validation.executable.ExecutableValidator;
import javax.validation.metadata.BeanDescriptor;
import java.util.Set;

//@Component
public class SignUpValidator implements Validator {

//    @Autowired
    SecurityService securityService;


    @Override
    public boolean supports(Class<?> aClass) {
        return false; // Not used in this example
    }
    @Override
    public void validate(Object o, Errors errors) {
        SignUp signUp = (SignUp) o;
        String name = signUp.getName() + " ";
        String username = signUp.getUsername() + " ";
        String password = signUp.getPassword() + " ";
        String role = signUp.getRole();

        // Validation for empty name field
        ValidationUtils.rejectIfEmpty(errors, "name", "name.empty");
        // Validation for name starting with a lowercase letter
        if (Character.isLowerCase(name.charAt(0))) {
            errors.rejectValue("name", "signup.name", "Invalid");
        }

        // Validation for empty username field
        ValidationUtils.rejectIfEmpty(errors, "username", "username.empty");
        // Validation for existing username
        if (securityService.singleUserAccordingToUsername(signUp.getUsername()) != null) {
            errors.rejectValue("username", "username.exist", "Exist");
        }

        // Validation for empty password field
        ValidationUtils.rejectIfEmpty(errors, "password", "password.empty");

    }

    public SecurityService getSecurityService() {
        return securityService;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }
}
