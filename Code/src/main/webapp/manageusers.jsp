
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.model.Student" %>
<%@ page import="com.example.model.Staff" %>
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
    <h2 style = "margin-top:60px;padding-left:200px">Manage Users</h2>

    <div class="sidenav">
        <ul>
                    <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(id);%></span></p>
                    </div>
                    <li><a href="admindashboard.jsp">Dashboard</a></li>
                    <li><a href="addbook.jsp">Add Book</a></li>
                    <li><a href="viewbookrequests.jsp">View Books Requests</a></li>
                    <li><a href="#">Manage users </a></li>
                    <li><a href="update.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="maincentral">
 <div class="warpper" data-aos="fade-up">
             <input class="radio" id="one" name="group" type="radio" checked>
             <input class="radio" id="two" name="group" type="radio">

 	    <div class="tabs">
             <label class="tab" id="one-tab" for="one">Students</label>
             <label class="tab" id="two-tab" for="two">Staffs</label>
 	    </div>

         <div class="panels">

 			<div class="panel" id="one-panel">
                <table style="width: 100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody id="studentTableBody"></tbody>
                </table>

            </div>

                <div class="panel" id="two-panel">

                     <h3>Staffs</h3>
                            <table style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Role</th>
                                        <th>Action</th>

                                    </tr>
                                </thead>
                                <tbody id="staffTableBody"></tbody>
                            </table>
                </div>
            </div>


    </div>
   <script>
           $(document).ready(function() {
               loadStudents();
               loadStaff();
           });

           function loadStudents() {
               $.ajax({
                   url: "member-servlet?action=viewStudents",
                   type: "GET",
                   dataType: "json",
                   success: function(data) {
                       var tableBody = $("#studentTableBody");
                       tableBody.empty();
                       for (var i = 0; i < data.length; i++) {
                           var student = data[i];
                           var row = "<tr>";
                           row += "<td>" + student.id + "</td>";
                           row += "<td>" + student.username + "</td>";
                           row += "<td>" + student.role + "</td>";
                           row += "<td><input type='submit' value='Remove' onclick='deleteStudent(" + student.id + ")'></td>";
                           row += "</tr>";
                           tableBody.append(row);
                       }
                   },
                   error: function(xhr, status, error) {
                       console.log("Error loading students: " + error);
                   }
               });
           }

           function loadStaff() {
               $.ajax({
                   url: "member-servlet?action=viewStaff",
                   type: "GET",
                   dataType: "json",
                   success: function(data) {
                       var tableBody = $("#staffTableBody");
                       tableBody.empty();
                       for (var i = 0; i < data.length; i++) {
                           var staff = data[i];
                           var row = "<tr>";
                           row += "<td>" + staff.id + "</td>";
                           row += "<td>" + staff.username + "</td>";
                           row += "<td>" + student.role + "</td>";
                           row += "<td><input type='submit' value='Remove' onclick='deleteStaff(" + staff.id + ")'></td>";
                           row += "</tr>";
                           tableBody.append(row);
                       }
                   },
                   error: function(xhr, status, error) {
                       console.log("Error loading staff: " + error);
                   }
               });
           }

           function deleteStaff(staffId) {
                       $.ajax({
                           url: "member-servlet?action=deleteStaff",
                           type: "POST",
                           data: { staffId: staffId },
                           success: function(response) {
                               console.log(response);
                               loadStaffs(); // Reload the staffs after deletion
                           },
                           error: function(xhr, status, error) {
                               console.log("Error deleting staff: " + error);
                           }
                       });
                   }

                   function deleteStudent(studentId) {
                       $.ajax({
                           url: "member-servlet?action=deleteStudent",
                           type: "POST",
                           data: { studentId: studentId },
                           success: function(response) {
                               console.log(response);
                               loadStudents(); // Reload the students after deletion
                           },
                           error: function(xhr, status, error) {
                               console.log("Error deleting student: " + error);
                           }
                       });
                   }
       </script>
</body>
</html>