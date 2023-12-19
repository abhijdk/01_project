package omato.dao;

import omato.controller.UserController;
import omato.pojo.SignUp;

public interface SecurityDao {

    // Retrieves login information for a specific user from the database
    public SignUp getSingleLoginData(String userName);

    // Stores the signup information of a new user in the database
    public void signUp(SignUp signUp);

    // Retrieves user information from the database based on their username
    public UserController singleUserAccordingToUsername(String username);
}
