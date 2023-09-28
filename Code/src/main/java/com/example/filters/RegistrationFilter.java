package com.example.filters;

import javax.servlet.*;
import java.io.IOException;
import java.util.regex.Pattern;

public class RegistrationFilter implements Filter {

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
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }

        /*if (username.length() < 8 || !Pattern.compile(USERNAME_REGEX).matcher(username).matches()) {
            request.setAttribute("errorMsg", "Invalid username. Minimum 8 characters or special character not found");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }*/

        if (password == null) {
            request.setAttribute("errorMsg", "Username is null");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }

        /*
        if(password.length() < 8 || !Pattern.compile(PASSWORD_REGEX).matcher(username).matches()) {
            request.setAttribute("errorMsg", "Invalid password. Minimum 8 characters, one capital letter, and one special character required");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }*/

        if (role == null) {
            request.setAttribute("errorMsg", "Role is null");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
            return;
        }

        chain.doFilter(request, response);
    }


}