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
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">Admin Portal</p>
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(id);%></span></p>

                    </div>
                    <li><a href="#">Dashboard</a></li>

                    <li><a href="addbook.jsp">Add Book</a></li>
                    <li><a href="viewbookrequests.jsp">View Books Requests</a></li>
                    <li><a href="manageusers.jsp">Manage users </a></li>
                    <li><a href="update.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
 </div>

 <div class="maincentral" style="height:600px;margin-top:75px;margin-bottom:60px">
         <div class="warpper" data-aos="fade-up">
             <input class="radio" id="one" name="group" type="radio" checked>
             <input class="radio" id="two" name="group" type="radio">

 	    <div class="tabs">
             <label class="tab" id="one-tab" for="one">View All Books</label>
             <label class="tab" id="two-tab" for="two">Update Book</label>
 	    </div>

         <div class="panels">

 			<div class="panel" id="one-panel">

                <table style = "width : 100%">
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

 			</div>

 			<div class="panel" id="two-panel">
                    <form action="book-servlet" method="post">
                            <input type="hidden" id="updateBookData" name="updateBookData">
                            Id: <input type="text" name="id"><br>

                            Title: <input type="text" name="title"><br>
                            Author: <input type="text" name="author"><br>
                            Publication Date: <input type="text" name="publicationDate"><br>
                            Availability:
                            <select name="availability">
                                <option value="yes">Yes</option>
                                <option value="no">No</option>
                            </select><br>
                            <input type="hidden" name="action" value="update">

                            <input type="submit" value="Update Book" onclick="prepareBookData()">
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

<script>
        function prepareBookData() {
            var id = document.getElementsByName("id")[0].value;
            var title = document.getElementsByName("title")[0].value;
            var author = document.getElementsByName("author")[0].value;
            var publicationDate = document.getElementsByName("publicationDate")[0].value;
            var availability = document.getElementsByName("availability")[0].value;
            var book = {
                id:id,
                title: title,
                author: author,
                publicationDate: publicationDate,
                availability: availability
            };



            document.getElementById("updateBookData").value = JSON.stringify(book);
        }
    </script>

</body>
</html>