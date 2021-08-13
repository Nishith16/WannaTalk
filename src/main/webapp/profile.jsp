<%@page import="com.myproject.entities.User"%>
<%@page import="com.myproject.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ include file="afterLoginNav.jsp" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Crimson+Pro">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css" integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous"/>
	
<link rel="stylesheet" href="css/profile.css">

</head>
<body style="background-color: #e8f5ff;">

	<!--  Starting of nav bar -->
	
	<!--  ending nav bar -->
	<!-- message-->
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	
    <div class="container mt-10" style="margin-bottom: 1rem;">
        <div class="card" style="margin-top: 1rem; border: none;">
           <form id="add-post-form" action="PostServlet" method="POST" >
            <div class="row">
                <div class="col">
                    
                    <textarea id="post_textarea" class="form" style="width: 100%; height: 200px; resize: none;"
                        placeholder="What's in your mind" name="postcontent" required></textarea>
                </div>
            </div>

            <div>
                <div class="btn-toolbar mt-1 text-center">
                    <button type="button" class="btn btn-primary mr-1">
                        <label style="display: contents;">
                            <i class="fas fa-paperclip"><input type="file" style="display:none;" name="pPic"></i>
                        </label> </button>
                        <button type="button" id="rec-btn" class="btn btn-danger mr-1"><i
                                class="fas fa-microphone"  onclick="record()"></i></button>
                        <button type="submit" id="post_button" class="btn btn-dark  mr-1"><i
                                class="fas fa-location-arrow"> Post</i></button>
                   
                </div>
            </div>
             </form> 
        </div>
    </div>


	 <div class="container text-center" id="loader"><i class="fas fa-sync fa-2x fa-spin"></i>
    <h3 class="mt-2">loading...</h3>
    </div>
    <!--Card on which the post will be displayed-->
	
	<p class="ml-4" id="postcontent"></p>

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
		
	<script>
    $(document).ready(function (e) {
        //
        $("#add-post-form").on("submit", function (event) {
            //this code gets called when form is submitted....
            event.preventDefault();
            console.log("you have clicked on submit..")
            let form = new FormData(this);
            //now requesting to server
            $.ajax({
                url: "PostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    //success ..
                    console.log(data);
                    if(data.trim() == 'done'){
                    	swal({
                    		  title: "Posted",
                    		  text: "Good Job!",
                    		  icon: "success",
                    		  button: "Aww yiss!",
                    		});
                    	document.getElementById('add-post-form').reset();
                    	location.reload();
                    }else{
                    	swal("Error","SomeThing Goes Wrong ..!Try Again.", "error");

                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //error..
                	swal("Error","SomeThing Goes Wrong ..!Try Again.", "error");
                },
                processData: false,
                contentType: false
            })
        })
    })
</script>
 S
<script>
	$(document).ready(function (e){
		$.ajax({
            url: "allpost.jsp",
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                $("#loader").hide();
                $("#postcontent").html(data);
            }
		})
	})

</script>
 <script>
        function record() {
            var recognition = new webkitSpeechRecognition();
            recognition.lang = "en-GB";

            recognition.onresult = function(event) {
                // console.log(event);
                document.getElementById('post_textarea').value = event.results[0][0].transcript;
            }
            recognition.start();

        }
    </script>

</body>
</html>