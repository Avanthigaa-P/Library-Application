package com.example.controller;

import com.example.dao.MemberService;
import com.example.model.Book;
import com.example.model.BookRequest;
import com.example.model.Member;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.json.JSONObject;

@WebServlet("/member-servlet")
public class MemberServlet extends HttpServlet {
    private MemberService memberService; // Assume you have a UserDAO to interact with the database

    @Override
    public void init() throws ServletException {
        // Initialize your UserDAO implementation
        memberService = new MemberService(); // Initialize your UserDAO implementation
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("viewStudents")) {
                List<Member> students = memberService.getAllStudents(); // Fetch students from the database

                Gson gson = new Gson();
                String studentsJson = gson.toJson(students);

                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(studentsJson);
                out.flush();
            } else if (action.equals("viewStaff")) {
                List<Member> staffList = memberService.getAllStaff(); // Fetch staff from the database

                Gson gson = new Gson();
                String staffJson = gson.toJson(staffList);

                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(staffJson);
                out.flush();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {

            if(action.equals("update")) {

                String updateData = request.getParameter("updateData");
                JSONObject json = new JSONObject(updateData);
                int id = json.getInt("identy");
                Gson gson = new Gson();
                Member member = gson.fromJson(updateData, Member.class);

                String name = member.getUsername();
                String password = member.getPassword();
                String role = member.getRole();


                memberService.update(id, name,password,role);
                response.getWriter().write("Updation successful");
                if(role.equals("student")) {
                    response.sendRedirect("studentdashboard.jsp");
                }else if(role.equals("admin")){
                    response.sendRedirect("admindashboard.jsp");
                }else{
                    response.sendRedirect("staffdashboard.jsp");
                }

            }

            else if (action.equals("deleteStudent")) {
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                memberService.deleteStudent(studentId);
                response.getWriter().write("Staff deleted successfully");
                response.sendRedirect("manageusers.jsp");

            }

            else if(action.equals("deleteStaff")) {
                int staffId = Integer.parseInt(request.getParameter("staffId"));
                memberService.deleteStaff(staffId);
                response.getWriter().write("Staff deleted successfully");
                response.sendRedirect("manageusers.jsp");
            }

        }
    }
}