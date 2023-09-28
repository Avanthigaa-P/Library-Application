package com.example.controller;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String role = request.getParameter("role");

            if (role.equals("student")) {
                response.sendRedirect("studentdashboard.jsp");
            } else if (role.equals("staff")) {
                response.sendRedirect("staffdashboard.jsp");
            } else if (role.equals("admin")) {
                response.sendRedirect("admindashboard.jsp");
            }

    }


}