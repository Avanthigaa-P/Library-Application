<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Client-Server Application</title>
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<body class="main">
     <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
        <% if (errorMsg != null) { %>
            <p style="color: red;"><%= errorMsg %></p>
        <% } %>
<section id="title-d">
	<h3 id="title-d" style="margin-top:4%;margin-left:25%;">Please Enter Your Credentials</h3>
        </section>
        <div class="center" style="margin-bottom:9%" data-aos="fade-up" data-aos-delay="100">
            <div class="row">
                <div class="column left" style="background-color:rgb(70,130,180)">
                  <div class="img-center-signin"><img src ="https://cdn-icons-png.flaticon.com/512/944/944948.png" style="width: 75%;height: auto;padding-left:90px;padding-top:40px;"></div>
                </div>
                <div class="column right" style="background-color:white;">
                    <div style="padding-top: 30px;padding-bottom: 30px;padding-left: 10px;padding-right: 10px">

							<input type="hidden" id = status value="<%= request.getAttribute("status") %>">

							 <form action="login-servlet" method="post">


                                                   <label for="identy">Id</label>
                                           	       <input type="identy" name="identy"  id="identy" placeholder="Your  ID.." class="form-control" required="required"/>


							                          <label for="name">Username</label>
							                          <input type="username" name="username"  id="id" placeholder="Your Username ID.." class="form-control" required="required"/>

							                          <label for="password">Password</label>
							                          <input type="password" id="password" name="password" placeholder="Your Password.." class="form-control" required="required"/>

							                          <label for="role">Role</label>
							                             <select name="role">
                                                                        <option value="student">Student</option>
                                                                        <option value="staff">Staff</option>
                                                                        <option value="admin">Admin</option>
                                                        </select>
							                          <input type="submit" value="Login">

						                            <center><a href="registration.jsp">BACK</a></center>
							                        </form>

							                         </div>
                </div>

              </div>

        </div>


        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                <script>
        AOS.init();
        </script>

                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
						  <link rel="stylesheet" href="alert/dist/sweetalert.css">

                          <script type="text/javascript">
                            var status = document.getElementById("status").value;
                            if(status == "failed")
                            	swal("Sorry","Wrong Username or Password","failed");
                          </script>

</body>
</html>



