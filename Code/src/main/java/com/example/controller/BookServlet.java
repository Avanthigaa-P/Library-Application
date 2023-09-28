package com.example.controller;

import com.example.dao.BookService;
import com.example.model.Book;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends HttpServlet {

    private BookService bookService;

    public void init() {
        bookService = new BookService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String bookData = request.getParameter("bookData");
            Gson gson = new Gson();
            Book book = gson.fromJson(bookData, Book.class);
            String title = book.getTitle();
            String author = book.getAuthor();
            String publicationDate = book.getPublicationDate();
            String availability = request.getParameter("availability");
            bookService.saveBook(title, author, publicationDate, availability);
        } else if ("update".equals(action)) {
            String updateBookData = request.getParameter("updateBookData");
            Gson gson = new Gson();
            Book book = gson.fromJson(updateBookData, Book.class);
            int id = book.getId();
            String title = book.getTitle();
            String author = book.getAuthor();
            String publicationDate = book.getPublicationDate();
            String availability = request.getParameter("availability");
            bookService.updateBook(id, title, author, publicationDate, availability);
        }

        response.sendRedirect("admindashboard.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = bookService.getAllBooks();
        String json = new Gson().toJson(books);
        response.setContentType("application/json");
        response.getWriter().write(json);
    }


}
