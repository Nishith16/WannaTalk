<%@page import="com.myproject.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
USer name is :
<%
	try{
	 Connection con = ConnectionProvider.getConnection();
	 Statement st = con.createStatement();
	 String search = request.getParameter("search");
	 String sql = "select * from register where firstname LIKE '"+search+"%' ";
	 
	 ResultSet rs = st.executeQuery(sql);
	 while(rs.next()){
		 %>
		
		 <div>
		 <h2><%=rs.getInt("id")%></h2>
		 </div>
	 	
	 	<%} //while completed here 
	 
	}catch(Exception e){
		e.printStackTrace();
	}

%>
</body>
</html>