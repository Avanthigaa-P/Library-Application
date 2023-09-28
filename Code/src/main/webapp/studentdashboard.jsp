<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Member" %>

<%@ page import="com.example.model.Book" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
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
    <h2 style = "margin-top:60px;padding-left:200px">Welcome <%= username %> !!</h2>


<div class="sidenav">
        <ul>
                    <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">Student Portal</p>

                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(id);%></span></p>
                    </div>
                    <li><a href="#">Dashboard</a></li>

                    <li><a href="viewallbooks.jsp">View All Books</a></li>

                    <li><a href="update.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
 <div class="maincentral" style="height:500px;margin-top:75px;margin-bottom:60px">
        <div class="warpper" data-aos="fade-up">
            <input class="radio" id="one" name="group" type="radio" checked>
            <input class="radio" id="two" name="group" type="radio">

	    <div class="tabs">
            <label class="tab" id="one-tab" for="one">Your Bookings</label>
            <label class="tab" id="two-tab" for="two">Request for a Book</label>
	    </div>

        <div class="panels">

			<div class="panel" id="one-panel">

                 <table style="width: 100%">
                        <thead>
                            <tr>
                                <th>Request ID</th>
                                <th>Book Title</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="bookTableBody"></tbody>
                 </table>

			</div>

			<div class="panel" id="two-panel">

			         <form action="book-request-servlet?action=create" method="post">
                        <input type="hidden" id="bookData" name="bookData">
                        Student ID: <input type="text" name="studentId" value = "<%=id %>"><br>

                        Book Title: <input type="text" name="bookTitle"><br>
                        <input type="submit" value="Request Book" onclick="prepareBookData()">
                    </form>
            </div>



		</div>
        </div>
        </div>




    <script>
        $(document).ready(function() {
            loadBooks();
        });
        function loadBooks() {
            $.ajax({
                url: "book-request-servlet?action=viewById",
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
                        row += "<td>" + book.requestStatus + "</td>";

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


         <script>
                function prepareBookData() {
                    var bookTitle = document.getElementsByName("bookTitle")[0].value;
                    var studentId = document.getElementsByName("studentId")[0].value;

                    var book = {
                        bookTitle: bookTitle,
                        studentId: studentId
                    };
                    document.getElementById("bookData").value = JSON.stringify(book);
                }
            </script>

</body>
</html>