package omato.dao.impl;

import omato.controller.UserController;
import omato.dao.SecurityDao;
import omato.pojo.SignUp;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

//@Controller
public class SecurityDaoImpl implements SecurityDao {
//    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public SignUp getSingleLoginData(String userName) {
        String query = "select * from admin where username=?";
        return jdbcTemplate.queryForObject(query,new BeanPropertyRowMapper<>(SignUp.class),userName);
    }

    @Override
    public void signUp(SignUp signUp) {
        String query = " insert into admin values (?,?,?,?)";
        jdbcTemplate.update(query,signUp.getName(),signUp.getUsername(),signUp.getPassword(),signUp.getRole());
    }

    @Override
    public UserController singleUserAccordingToUsername(String username) {
        String query = "select * from admin where username=?";
        return jdbcTemplate.queryForObject(query,new BeanPropertyRowMapper<>(UserController.class),username);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}


//CREATE TABLE admin (
//        name VARCHAR(255) NOT NULL,
//username VARCHAR(50) PRIMARY KEY,
//password VARCHAR(255) NOT NULL,
//role VARCHAR(50) NOT NULL
//);


//CREATE TABLE invalidlogin (
//        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
//        username VARCHAR(255) NOT NULL,
//attempted INT NOT NULL,
//created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//);
