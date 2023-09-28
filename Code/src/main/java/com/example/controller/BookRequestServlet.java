package com.example.controller;

import com.example.dao.BookRequestService;
import com.example.model.BookRequest;
import com.example.model.Member;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import java.util.List;

public class BookRequestServlet extends HttpServlet {

    BookRequestService bookRequestService;

    @Override
    public void init() throws ServletException {
        bookRequestService = new BookRequestService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("viewAll")) {
                List<BookRequest> bookrequest = bookRequestService.getAllBookRequests();
                String json = new Gson().toJson(bookrequest);
                response.setContentType("application/json");
                response.getWriter().write(json);
            }
            else if(action.equals("viewById")){

                HttpSession session = request.getSession();

                Member loggedInMember = (Member) session.getAttribute("loggedInMember");
                String Id = String.valueOf(loggedInMember.getId());

                List<BookRequest> bookrequest = bookRequestService.getAllBookRequests(Id);
                String json = new Gson().toJson(bookrequest);
                response.setContentType("application/json");
                response.getWriter().write(json);
            }
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("create")) {
                String bookData = request.getParameter("bookData");
                Gson gson = new Gson();
                BookRequest bookrequest = gson.fromJson(bookData, BookRequest.class);
                String bookTitle = bookrequest.getBookTitle();
                String studentId = bookrequest.getStudentId();
                bookRequestService.saveBookRequest(bookTitle, studentId);
                response.sendRedirect("studentdashboard.jsp");

            }

            else if(action.equals("approve")) {
                int requestId = Integer.parseInt(request.getParameter("requestId"));

                bookRequestService.updateRequestStatus(requestId, "Approved");

                response.sendRedirect("admindashboard.jsp");
            }

            else if(action.equals("deny")) {
                int requestId = Integer.parseInt(request.getParameter("requestId"));

                bookRequestService.updateRequestStatus(requestId, "Denied");

                response.sendRedirect("admindashboard.jsp");
            }
        }
    }


}