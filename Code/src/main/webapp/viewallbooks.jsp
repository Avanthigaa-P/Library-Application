<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Book" %>
<%@ page import="com.example.model.Member" %>

<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="main">
<%
    Member loggedInMember = (Member) session.getAttribute("loggedInMember");
    String username = loggedInMember != null ? loggedInMember.getUsername() : "Unknown User";
    Integer id = (Integer) loggedInMember.getId();
%>
    <h2 style = "margin-top:60px;padding-left:200px">View All Books</h2>
<div class="sidenav">
        <ul>
                    <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(id);%></span></p>
                    </div>
                    <li><a href="studentdashboard.jsp">Dashboard</a></li>

                    <li><a href="#">View All Books</a></li>

                    <li><a href="update.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="maincentral">

    <table style="width: 100%">
           <thead>
               <tr>
                   <th>ID</th>
                   <th>Title</th>
                   <th>Author</th>
                   <th>Publication Date</th>
                   <th>Availability</th>
               </tr>
           </thead>
           <tbody id="bookTableBody"></tbody>
       </table>

       <script>
           $(document).ready(function() {
               loadBooks();
           });

           function loadBooks() {
               $.ajax({
                   url: "book-servlet?action=view",
                   type: "GET",
                   dataType: "json",
                   success: function(data) {
                       var tableBody = $("#bookTableBody");
                       tableBody.empty();
                       for (var i = 0; i < data.length; i++) {
                           var book = data[i];
                           var row = "<tr>";
                           row += "<td>" + book.id + "</td>";
                           row += "<td>" + book.title + "</td>";
                           row += "<td>" + book.author + "</td>";
                           row += "<td>" + book.publicationDate + "</td>";
                           row += "<td>" + book.availability + "</td>";
                           row += "</tr>";
                           tableBody.append(row);
                       }
                   },
                   error: function(xhr, status, error) {
                       console.log("Error loading books: " + error);
                   }
               });
           }
       </script>
</body>
</html>