package omato.security.impl;

import omato.controller.UserController;
import omato.dao.SecurityDao;
import omato.pojo.SignUp;
import omato.security.SecurityService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

//@Service
public class SecurityServiceImpl implements SecurityService {
//    @Autowired
    private SecurityDao securityDao;
    @Override
    public SignUp getSingleLoginData(String userName) {
        try {
            return securityDao.getSingleLoginData(userName);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public void signUp(SignUp signUp) {
        BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();
        String encode = bCryptPasswordEncoder.encode(signUp.getPassword());
        signUp.setPassword(encode);
        securityDao.signUp(signUp);
    }

    @Override
    public UserController singleUserAccordingToUsername(String username) {
        try {
            return securityDao.singleUserAccordingToUsername(username);
        }catch (Exception e){
            return null;
        }
    }

    public SecurityDao getSecurityDao() {
        return securityDao;
    }

    public void setSecurityDao(SecurityDao securityDao) {
        this.securityDao = securityDao;
    }
}
