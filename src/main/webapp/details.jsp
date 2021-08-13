<%@page import="com.myproject.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.myproject.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.myproject.dao.*"%>
<%@page import="com.myproject.*"%>
<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/details.css">
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
	<!-- profile  -->
	<div class="main">

		<!--Follower Following Buttons-->
		<div class="buttons text-center">
			<div class="alert alert-dark" role="alert">
				<h2>PROFILE</h2>
			</div>

			<a>
				<button class="btn btn-warning btn-lg" data-toggle="modal" data-target="#getfollowingNames" style="width: 20%;">
					<i class="far fa-user">&nbsp;</i>Following
					<button class="btn btn-light btn-sm"><%=user.getFollowing() %></button>
				</button>
				
			</a>
			 
				<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#getfollowerNames" style="width: 20%;" >
					<i class="fas fa-users">&nbsp;</i> Followers
					<button class="btn btn-light btn-sm"><%=user.getFollowers() %></button>
				</button>
		
		</div>
		
		
 <div class="modal fade" id="getfollowingNames" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Followings</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<%	
       		UserDao ud = new UserDao(ConnectionProvider.getConnection());
			FollowDao fd = new FollowDao(ConnectionProvider.getConnection());
			List<Integer> list = fd.getAllFollowingId(user.getId());
			for(int l:list)
			{
		%>
		<em>
		<b><p style="font-family:serif;font-size:18px;"><%=ud.getUserByUserId(l).getFirstname()+" "+ud.getUserByUserId(l).getLastname() %></p></b>
		</em>
		<%
			}
		%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="getfollowerNames" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Followers</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<%
			List<Integer> lists = fd.getAllFollowerId(user.getId());
			for(int l:lists){
		%>
		<em><b>
		<p style="font-family:serif;font-size:20px;"><%=ud.getUserByUserId(l).getFirstname()+" "+ud.getUserByUserId(l).getLastname()%></p>
		</b></em>
		<%
			}
		%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
		
		<hr style="border-top: 2px solid blue;">
		<div class="container">
			<div class="card">
				<div class="card-body">
					<div class="container ">
						<center>
							<h1
								style="font-family: serif; font-variant: small-caps; font-weight: bold; letter-spacing: 4px;">Wanna
								Talk</h1>
							<div>
								<img src="imgs/<%=user.getProfile()%>"
									name = "image" style="width: 200px; border-radius: 50%;">
							</div>
							<table id="info" class="card-info">
								<tbody>
								
									<tr>
									<button id="editBtn" class="btn btn-dark btn-md"
										style="float: right; width: auto;">
										<div>
											<i class="fa fa-pen fa-xs edit">&nbsp;&nbsp;EDIT</i>
										</div>
									</button>
									</tr>

									<tr>
										<td>ID</td>
										<td>:</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>First Name</td>
										<td>:</td>
										<td><%=user.getFirstname()%></td>
									</tr>

									<tr>
										<td>Last Name</td>
										<td>:</td>
										<td><%=user.getLastname()%></td>
									</tr>

									<tr>
										<td>Nick Name</td>
										<td>:</td>
										<td><%=user.getEmail()%></td>
									</tr>


								</tbody>
							</table>
						</center>
						<div id="refill" class="container" style="display: none;">
							<form action="EditServlet" method="POST" class="form-contol"
								enctype="multipart/form-data">
								<center>
									<h2>Edit Profile</h2>
									<table id="info" class="card-info">
										<tbody>
											<tr>
												<td>ID</td>
												<td>:</td>
												<td><%=user.getId()%></td>
											</tr>

											<tr>
												<td>First Name</td>
												<td>:</td>
												<td><input type="text" name="firstName"
													value="<%=user.getFirstname()%>"></td>
											</tr>

											<tr>
												<td>Last Name</td>
												<td>:</td>
												<td><input type="text" name="lastName"
													value="<%=user.getLastname()%>"></td>
											</tr>

											<tr>
												<td>Nick Name</td>
												<td>:</td>
												<td><input type="text" name="useremail"
													value="<%=user.getEmail()%>"></td>
											</tr>

											<tr>
												<td>Password</td>
												<td>:</td>
												<td><input type="password" name="password"
													value="<%=user.getPassword()%>"></td>
											</tr>

											<tr>
												<td>New Profile Pic</td>
												<td>:</td>
												<td><input type="file" name="image"></td>
											</tr>

										</tbody>
									</table>
									<button type="submit" class="btn btn-secondary">Save</button>
								</center>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="container mt-3">
		<div class="alert alert-info text-center" role="alert">
			Here Yours all the Posts are :-
		</div>
	</div>
	<div class="container mt-5" style="margin-bottom: 1rem;">
	<%
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	List<Post> posts = pd.getPostByUserId(user.getId());
	for (Post p : posts) {
	%>
	<div class="container mt-5" style="margin-bottom: 1rem;">
	
		<div class="carda text-white bg-dark" style="box-shadow: 0 0 10px black;">
			<div class="row mt-10">
				<div class="col-md-3">
				<img src="imgs/<%=user.getProfile()%>"
					class="img-fluid">
			</div>
				<div class="col-md-9">

					<h1 class="card-title mt-4 ml-4 text-light"
						style="font-family: 'Merriweather', serif; letter-spacing: 2px; font-variant: small-caps;">
						<%=user.getFirstname()%>
						
					</h1>
					
					<span></span>
					<p class="ml-4">
						<em>Posted on : <%=p.getPostdate()%></em>
					</p>
					<hr class= "ml-4 mr-4 " style = "border:1px solid grey;">
					<%
					if (p.getPostcontent().length() > 180) {
						String newString = p.getPostcontent().substring(0, 180) + "...";
					%>
					<h6 class="ml-4 font-italic">
						" <%=newString%> "
					</h6>
					<%
					} else {
					%>
					<h6 class="ml-4 font-italic">
						" <%=p.getPostcontent()%> "
					</h6>
					<%
					}
					%>
					
					<a href="loadPost.jsp?postid=<%=p.getPostid()%>"><button
							class="btn btn-outline-light mt-2 ml-4 mb-3">More...</button></a>

				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>
</div>



	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#editBtn').click(function() {
				if (editStatus == false) {
					$("#info").hide()
					$("#refill").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#info").show()
					$("#refill").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		});
		
		
	
	</script>
</body>
</html>