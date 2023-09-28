package com.example.controller;

import com.example.database.DatabaseConfig;
import com.example.model.Admin;
import com.example.model.Staff;
import com.example.model.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pswrd = request.getParameter("password");
        String role = request.getParameter("role");


        if (role.equals("student")) {
            Student student = new Student(username, pswrd);
            saveStudentData(student);
        } else if (role.equals("staff")) {
            Staff staff = new Staff(username, pswrd);
            saveStaffData(staff);
        } else if (role.equals("admin")) {
            Admin admin = new Admin(username, pswrd);
            saveAdminData(admin);
        }

        response.sendRedirect("login.jsp");

    }

    private void saveStudentData(Student student) {
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = DatabaseConfig.getConnection();

            String query = "INSERT INTO students (name, password) VALUES (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, student.getUsername());
            statement.setString(2, student.getPassword());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }

    private void saveStaffData(Staff staff) {
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = DatabaseConfig.getConnection();
            String query = "INSERT INTO staffs (name, password) VALUES (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, staff.getUsername());
            statement.setString(2, staff.getPassword());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }
    private void saveAdminData(Admin admin) {
        Connection connection = null;
        PreparedStatement statement = null;
        try{

            connection = DatabaseConfig.getConnection();
            String query = "INSERT INTO admin (name, password) VALUES (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, admin.getUsername());
            statement.setString(2, admin.getPassword());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }
}