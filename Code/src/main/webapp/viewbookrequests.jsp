
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Book" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.model.Member" %>

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
    <h2 style = "margin-top:60px;padding-left:200px">BookRequests</h2>

    <div class="sidenav">
        <ul>
                    <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(id);%></span></p>
                    </div>
                    <li><a href="admindashboard.jsp">Dashboard</a></li>
                    <li><a href="addbook.jsp">Add Book</a></li>
                    <li><a href="#">View Books Requests</a></li>
                    <li><a href="manageusers.jsp">Manage users </a></li>
                    <li><a href="update.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="maincentral">

    <table style="width: 100%">
        <thead>
            <tr>
                <th>Request Id</th>
                <th>Book Title</th>
                <th>Student Id</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody id="bookTableBody"></tbody>
    </table>
    </div>
    <script>
        $(document).ready(function() {
            loadBooks();
        });
        function loadBooks() {
            $.ajax({
                url: "book-request-servlet?action=viewAll",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    var tableBody = $("#bookTableBody");
                    tableBody.empty();
                    for (var i = 0; i < data.length; i++) {
                        var book = data[i];
                        var row = "<tr>";
                        row += "<td>" + book.requestId + "</td>";

                        row += "<td>" + book.bookTitle + "</td>";
                        row += "<td>" + book.studentId + "</td>";
                        row += "<td>" + book.requestStatus + "</td>";
                        row += "<td><input type='submit' value='Approve' onclick='approveRequest(" + book.requestId + ")'></td>";
                        row += "<td><input type='submit' value='Deny' onclick='denyRequest(" + book.requestId + ")'></td>";

                        row += "</tr>";
                        tableBody.append(row);
                    }
                },
                error: function(xhr, status, error) {
                    console.log("Error loading books: " + error);
                }
            });
        }

        function approveRequest(requestId) {
                    $.ajax({
                        url: "book-request-servlet?action=approve",
                        type: "POST",
                        data: { requestId: requestId },
                        success: function(response) {
                            console.log(response);
                            // Reload the book requests after approval
                            loadBooks();
                        },
                        error: function(xhr, status, error) {
                            console.log("Error approving request: " + error);
                        }
                    });
                }


        function denyRequest(requestId) {
                            $.ajax({
                                url: "book-request-servlet?action=deny",
                                type: "POST",
                                data: { requestId: requestId },
                                success: function(response) {
                                    console.log(response);
                                    // Reload the book requests after approval
                                    loadBooks();
                                },
                                error: function(xhr, status, error) {
                                    console.log("Error approving request: " + error);
                                }
                            });
                        }


    </script>
</body>
</html>