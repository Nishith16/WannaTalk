<%@page import="com.myproject.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.myproject.dao.*"%>
<%@page import="com.myproject.helper.ConnectionProvider"%>

<%
PostDao d = new PostDao(ConnectionProvider.getConnection());
List<Post> posts = d.getAllPost();
for (Post p : posts) {
%>
<div class="container mt-5" style="margin-bottom: 1rem;">
	<%
	UserDao ud = new UserDao(ConnectionProvider.getConnection());
	%>
	<div class="card text-white bg-dark"
		style="box-shadow: 0 0 10px black;">
		<div class="row mt-10">
			<div class="col-md-3 text-center ">
				<img src="imgs/<%=ud.getUserByUserId(p.getUserid()).getProfile()%>"
					class="img-fluid">

			</div>
			<div class="col-md-9">

				<h1 class="card-title mt-4 ml-4 text-light"
					style="font-family: 'Merriweather', serif; letter-spacing: 2px; font-variant: small-caps;">
					<a href="eachUserDetail.jsp?postid=<%=p.getPostid()%>"
						style="color: White;"><%=ud.getUserByUserId(p.getUserid()).getFirstname()%>
					</a>
				</h1>
				<span></span>
				<p class="ml-4">
					<em>Posted on : <%=p.getPostdate()%></em>
				</p>
				<hr class "ml-4 mr-4 " style = "border:1px solid grey;">
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





