package com.example.filters;

import javax.servlet.*;
import java.io.IOException;

public class LoginInputValidationFilter implements Filter {

    private static final String USERNAME_REGEX = "^[a-zA-Z0-9]{8,}$";
    private static final String PASSWORD_REGEX = "^(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (username == null) {
            request.setAttribute("errorMsg", "Username is null");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }



        if (password == null) {
            request.setAttribute("errorMsg", "Username is null");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }



        if (role == null) {
            request.setAttribute("errorMsg", "Role is null");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        chain.doFilter(request, response);
    }


}
