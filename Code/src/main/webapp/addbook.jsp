<%@ page import="com.example.model.Member" %>

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
<div class="sidenav">
        <ul>
                    <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(id);%></span></p>
                    </div>
                    <li><a href="admindashboard.jsp">Dashboard</a></li>

                    <li><a href="#">Add Book</a></li>
                    <li><a href="viewbookrequests.jsp">Books Request</a></li>
                    <li><a href="manageusers.jsp">Manage users </a></li>
                    <li><a href="update.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
 </div>

    <h2 style = "margin-top:80px;padding-left:550px">Add Book</h2>

 <div class="maincentral" style="height:480px;margin-top:105px;margin-bottom:100px;padding-top:50px;padding-left:50px;padding-bottom:50px;padding-right:50px;">

    <form action="book-servlet" method="post">
        <input type="hidden" id="bookData" name="bookData">
        Title: <input type="text" name="title"><br>
        Author: <input type="text" name="author"><br>
        Publication Date: <input type="text" name="publicationDate"><br>
        Availability:
        <select name="availability">
            <option value="yes">Yes</option>
            <option value="no">No</option>
        </select><br>
        <input type="hidden" name="action" value="add">

        <input type="submit" value="Add Book" onclick="prepareBookData()">
    </form>
    </div>
    <script>
        function prepareBookData() {
            var title = document.getElementsByName("title")[0].value;
            var author = document.getElementsByName("author")[0].value;
            var publicationDate = document.getElementsByName("publicationDate")[0].value;
            var availability = document.getElementsByName("availability")[0].value;
            var book = {
                title: title,
                author: author,
                publicationDate: publicationDate,
                availability: availability
            };
            document.getElementById("bookData").value = JSON.stringify(book);
        }
    </script>
</body>
</html>