<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.myproject.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.myproject.dao.*"%>
<%@page import="com.myproject.helper.ConnectionProvider"%>
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
<title>Like The Post</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

        .blockquote-custom {
            position: relative;
            font-size: 1.1rem;
        }

        .blockquote-custom-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: -25px;
            left: 50px;
        }
        body {
            background: black;
            background-image: url(pics/bg.jpg) ;
            background-size: cover;
            background-repeat: no-repeat;
        }
   </style>
 
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0&appId=258672499312132&autoLogAppEvents=1" nonce="ArrN9VwB"></script>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" 
src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0&appId=258672499312132&autoLogAppEvents=1" 
nonce="l6l9VbUn"></script>
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
	<script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<%
int postId = Integer.parseInt(request.getParameter("postid"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post post = d.getPostByPostId(postId);
%>
<%
int flag=0;
UserDao ud = new UserDao(ConnectionProvider.getConnection());
if(user.getFirstname().equals(ud.getUserByUserId(post.getUserid()).getFirstname())) {
	
	flag=1;
}
%>
<section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    
                </div>
            </div>


            <div class="row">
                <div class="col-lg-6 mx-auto">
			
                    <!-- CUSTOM BLOCKQUOTE -->
                    <blockquote class="blockquote blockquote-custom bg-white p-5 shadow rounded">
                    <header class="text-center pb-5">
                        <h1 class="h1" style="color: black;font-family:serif"><%=ud.getUserByUserId(post.getUserid()).getFirstname() %></h1>
                      <%if(flag==1){
                    	  %>
                      
                      <a id="anchor" onclick="myfun()"><button class="btn btn-danger btn-md" id="dltBtn"
                            style="margin-right: 1%; float: right;"><i class="fas fa-trash"></i>
                         </button></a>
                    <%} %>
                    </header>
                        <div class="blockquote-custom-icon bg-info shadow-sm"><i
                                class="fa fa-quote-left text-white"></i></div>
                        <p class="mb-0 mt-2 font-italic"><b>" <%=post.getPostcontent() %> "</b></p>
                   	
                   	<%
                   		String picName = post.getpPic();
                   		if(!post.getpPic().isEmpty())
                   		{ 
                   	%> 
                   	<div class = "d-flex justify-content-center mt-2">	
                      <img src="imgs/<%=post.getpPic()%>" style="width:100%;height:100%;">
                   </div>
                   <%} 
                   else{
                   %>
                   <div class = "d-flex justify-content-center mt-2">	
                      <img>
                   </div>
                   <%} %>
                    
                        <footer class="pt-4 mt-4 border-top">
	                        <p><em><%=post.getPostdate() %></em></p>
	                        <div class="btn-group" role="group" aria-label="Basic example">
	                           <a href="#cmt"><button type="button" class="btn btn-info">Comment</button></a>
	                        </div> 
	                        <div class="footer mt-2">
	                        <div class="fb-like" data-href="http://localhost:8081/MyProject/loadPost.jsp?postid=<%=post.getPostid() %>" data-width="" data-layout="standard" data-action="like" data-size="large" data-share="false"></div>
	                        </div>
							<div class="footer" id="cmt">
								<div class="fb-comments" data-href=
								"http://localhost:8081/MyProject/loadPost.jsp?postid=<%=post.getPostid() %>" 
								data-width="auto" data-numposts="5">
								</div>
							</div>
	                          
                        </footer>
                    </blockquote><!-- END -->

                </div>
            </div>
        </div>
    </section>
    
    
    
	 
  	<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
	<script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<script >
		function myfun(){
			if(confirm("Are you sure to delete these Post ?")){
			document.getElementById('anchor').href = "DeleteServlet?postid=<%=post.getPostid()%>";
			}
			else{
				alert('post not deleted.');
			}
		}
	
    </script>
		
</body>
</html>