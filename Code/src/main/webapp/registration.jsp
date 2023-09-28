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
	<h3 id="title-d" style="margin-top:8%;margin-left:35%;">Library Application</h3>
        </section>
<div class="center">
            <div class="row">
                <div class="column left" style="background-color:rgb(70,130,180)"><!-- b3e0ff -->
                  <div class="img-center-register"><img src ="https://cdn-icons-png.flaticon.com/512/753/753210.png" style="width: 80%;height: 80%;padding-left:80px;padding-top:180px;"></div>
                </div>
                <div class="column right" style="background-color:white;">
                    <div>

						<input type="hidden" id = status value="<%= request.getAttribute("status") %>">
                        <form action="registration-servlet" method="post">

                            <label for="name">Name</label>
                            <input type="text" id="name" name="username" required="required" placeholder="Your name.."  class="form-control" >

                            <label for="nname">Nick Name</label>
                            <input type="text" id="nname" name="nname" required="required" placeholder="Your name.."  class="form-control ">


                            <label for="email">E-Mail ID</label>
                            <input type="email" id="email" name="email" required="required" placeholder="Your name.."  class="form-control ">



                            <label for="p1">Password </label>
                            <input type="password" id="password" name="password" required="required" placeholder="Your name.."  class="form-control">

                             Role: <select name="role">
                                        <option value="student">Student</option>
                                        <option value="staff">Staff</option>
                                        <option value="admin">Admin</option>
                                    </select>



                            <input type="submit" value="Register" onclick="return confirm('Please check everything before submitting');">
                          </form>
                      <br>
                      <p><b>Already a member? </b> <a href="login.jsp"> Sign In here</a>.</p>

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
                            if(status == "success")
                            	swal("Congrats","Account Created Successfully","Success");
                          </script>

</body>
</html>



