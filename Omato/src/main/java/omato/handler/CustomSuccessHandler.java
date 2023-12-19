package omato.handler;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    // RedirectStrategy for handling URL redirection after successful authentication
    RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // Set session timeout to 30 seconds
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(300);

        // Get user authorities (roles)
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        // Check user role and redirect accordingly
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                // Redirect admin users to the admin page
                redirectStrategy.sendRedirect(request, response, "/admin/admin");
            } else if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
                // Redirect regular users to the user page
                redirectStrategy.sendRedirect(request, response, "/addToCart_login");
            } else {
                // Redirect others to a default placeholder (#)
                redirectStrategy.sendRedirect(request, response, "#");
            }
        }
    }
}
