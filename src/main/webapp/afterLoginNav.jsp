<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.myproject.entities.User"%>
    <%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#navbarText li a{
color:white;
}
#navbarText li a:hover{
text-decoration:underline;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Wanna Talk</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item ">
				<a class="nav-link" href="profile.jsp">All Post</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="details.jsp"><span
						class="fa fa-user-circle"></span><%=" Hi," + user.getFirstname() + " " + user.getLastname()%></a>

				</li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-plus"></span> logout</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>