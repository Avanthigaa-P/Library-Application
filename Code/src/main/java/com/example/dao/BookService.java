package com.example.dao;

import com.example.database.DatabaseConfig;
import com.example.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookService {

    public void saveBook(String title, String author, String publicationDate, String availability) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "INSERT INTO book (title, author, publication_date, availability) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setString(3, publicationDate);
            statement.setString(4, availability);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }

    public void updateBook(int id, String title, String author, String publicationDate, String availability) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConfig.getConnection();
            String query = "UPDATE book SET title=?, author=?, publication_date=?, availability=? WHERE id=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setString(3, publicationDate);
            statement.setString(4, availability);
            statement.setInt(5, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
    }

    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConfig.getConnection();
            String query = "SELECT * FROM book";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                String publicationDate = resultSet.getString("publication_date");
                String availability = resultSet.getString("availability");
                Book book = new Book(title, author, publicationDate, availability);
                book.setId(id);
                books.add(book);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConfig.closeResultSet(resultSet);
            DatabaseConfig.closeStatement(statement);
            DatabaseConfig.closeConnection(connection);
        }
        return books;
    }
}
