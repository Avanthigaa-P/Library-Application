<%@ page import="com.example.model.Member" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Server Application</title>
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

</head>



<body class="main" style="padding-top:5px;padding-bottom:5px">
<%
    Member loggedInMember = (Member) session.getAttribute("loggedInMember");
    String username = loggedInMember != null ? loggedInMember.getUsername() : "Unknown User";
    Integer identy = (Integer) loggedInMember.getId();
    String role = loggedInMember.getRole();
%>

  <div class="center">
            <div class="row">
                <div class="column left" style="background-color:#85a3e0"><!-- b3e0ff -->
                  <div class="img-center-register"><img src ="https://cdn-icons-png.flaticon.com/128/2279/2279250.png" style="width: 80%;height: auto;padding-left:60px;"></div>
                </div>
                <div class="column right" style="background-color:white;">
                    <div>


			<form action="member-servlet" method="post">
                            <input type="hidden" id="updateData" name="updateData">


                            <label for="identy">Id</label>
                           <input type="identy" name="identy"  id="identy" value = "<%=identy %>" class="form-control" required="required"/>


                          <label for="username">Username</label>
                          <input type="username" name="username"  id="id" placeholder="Your Username ID.." class="form-control" required="required"/>

                          <label for="password">Password</label>
                          <input type="password" id="password" name="password" placeholder="Your Password.." class="form-control" required="required"/>
                           <input type="hidden" name="role"  id="role" value = "<%=role %>" />


                            <input type="hidden" name="action" value="update">


                            <input type="submit" value="Update" onclick="prepareBookData();">
                            <input type="reset" value="Reset">
                          </form>

                      </div>
                </div>
              </div>
        </div>


        <script>
            function prepareBookData() {
                var identy = document.getElementsByName("identy")[0].value;
                var username = document.getElementsByName("username")[0].value;
                var password = document.getElementsByName("password")[0].value;
                var role = document.getElementsByName("role")[0].value;
                var data = {
                    identy: identy,
                    username: username,
                    password: password,
                    role : role
                };
                document.getElementById("updateData").value = JSON.stringify(data);
            }
        </script>


</body>
</html>