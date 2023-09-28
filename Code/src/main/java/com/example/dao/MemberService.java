package com.example.dao;

import com.example.database.DatabaseConfig;
import com.example.model.Member;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberService implements MemberInterface {

    @Override
    public Member getUser(String username, String password, String role) {
        Member member = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            connection = DatabaseConfig.getConnection();
            String query = null;
            if (role.equals("student")) {
                query = "SELECT * FROM students WHERE name = ? AND password = ?";
            } else if (role.equals("staff")) {
                query = "SELECT * FROM staffs WHERE name = ? AND password = ?";
            } else if (role.equals("admin")) {
                query = "SELECT * FROM admin WHERE name = ? AND password = ?";
            }

            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String retrievedUsername = resultSet.getString("name");
                String pswrd = resultSet.getString("password");


                member = new Member(id, retrievedUsername, password,role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }

        return member;
    }

    public List<Member> getAllStudents() {
        List<Member> studentlist = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "SELECT * FROM students";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String password = resultSet.getString("password");

                Member student = new Member(name,password,"student");
                student.setId(id);

                studentlist.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }


        return studentlist;
    }

    public List<Member> getAllStaff() {
        List<Member> stafflist = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "SELECT * FROM staffs";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String password = resultSet.getString("password");

                Member staff = new Member(name,password,"staff");
                staff.setId(id);
                stafflist.add(staff);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
        return stafflist;
    }

    public void deleteStudent(int studentId) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "DELETE FROM students WHERE id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, studentId);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }

    }

    public void deleteStaff(int staffId) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "DELETE FROM staffs WHERE id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, staffId);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }

    public void update(int id, String name, String password,String role) {
        Connection connection = null;
        PreparedStatement statement = null;
        if(role.equals("student")){

            try {
                connection = DatabaseConfig.getConnection();
                String query = "UPDATE students SET name=?, password=? WHERE id=?";
                statement = connection.prepareStatement(query);
                statement.setString(1, name);
                statement.setString(2, password);
                statement.setInt(3, id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DatabaseConfig.closeStatement(statement);
                DatabaseConfig.closeConnection(connection);
            }

        }
        else if(role.equals("staff")){

            try {
                connection = DatabaseConfig.getConnection();
                String query = "UPDATE staffs SET name=?, password=? WHERE id=?";
                statement = connection.prepareStatement(query);
                statement.setString(1, name);
                statement.setString(2, password);
                statement.setInt(3, id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DatabaseConfig.closeStatement(statement);
                DatabaseConfig.closeConnection(connection);
            }

        }
    }
}
