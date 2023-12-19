package omato.security;

import omato.controller.UserController;
import omato.pojo.SignUp;

public interface SecurityService {

    /*
     * Retrieves login information for a specific user.
     *
     * @param userName The username of the user for whom login information is to be retrieved.
     * @return SignUp The SignUp object containing login information for the specified user.
     */
    public SignUp getSingleLoginData(String userName);

    /*
     * Registers a new user by storing their signup information.
     *
     * @param signUp The SignUp object representing the details of the new user to be registered.
     */
    public void signUp(SignUp signUp);

    /*
     * Retrieves user information based on their username.
     *
     * @param username The username of the user for whom information is to be retrieved.
     * @return UserController The UserController object containing information for the specified user.
     */
    public UserController singleUserAccordingToUsername(String username);
}
