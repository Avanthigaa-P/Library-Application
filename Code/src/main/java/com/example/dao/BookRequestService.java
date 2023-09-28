package com.example.dao;

import com.example.database.DatabaseConfig;
import com.example.model.BookRequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRequestService {

    public void saveBookRequest(String bookTitle, String studentId) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "INSERT INTO book_requests (book_title, student_id, request_status) VALUES (?, ?, 'Pending')";
            statement = connection.prepareStatement(query);
            statement.setString(1, bookTitle);
            statement.setString(2, studentId);

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }

    public void updateRequestStatus(int requestId, String status) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "UPDATE book_requests SET request_status = ? WHERE request_id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, requestId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }

    public List<BookRequest> getAllBookRequests() {
        List<BookRequest> bookrequestlist = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "SELECT * FROM book_requests";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int request_id = resultSet.getInt("request_id");
                String book_title = resultSet.getString("book_title");
                String student_id = resultSet.getString("student_id");
                String request_status = resultSet.getString("request_status");
                BookRequest bookrequest = new BookRequest(book_title, student_id, request_status);
                bookrequest.setId(request_id);
                bookrequestlist.add(bookrequest);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
        return bookrequestlist;
    }

    public List<BookRequest> getAllBookRequests(String Id) {
        List<BookRequest> bookrequestlist = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConfig.getConnection();
            String query = "SELECT * FROM book_requests WHERE student_id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, Id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int request_id = resultSet.getInt("request_id");
                String book_title = resultSet.getString("book_title");
                String student_id = resultSet.getString("student_id");
                String request_status = resultSet.getString("request_status");
                BookRequest bookrequest = new BookRequest(book_title, student_id, request_status);
                bookrequest.setId(request_id);
                bookrequestlist.add(bookrequest);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
        return bookrequestlist;
    }
}
