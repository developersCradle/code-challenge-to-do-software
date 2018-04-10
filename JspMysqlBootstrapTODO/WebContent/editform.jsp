<%@page import="com.dbconnectiontools.DbConnection"%>
<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!--linkataan Bootstrap ja jQuery cdn -->
	<!--jQuery pitää laittaa ensimmäisenä -->
	<script
	src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>	

	<!--Bootsrap 3, Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!--Bootsrap 3, Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Muokkaa</title>
</head>
<body>

<%

String uid = request.getParameter("uid");
int id = Integer.parseInt(uid);
ResultSet rs = null;


try
{
	DbConnection test = new DbConnection();//Parempikin tapa?
	rs = test.displayNote(id);
	System.out.println(rs.getString("deadline"));

%>

	<div class="container bg-info" style="padding-top:20px; padding-bottom:20px;">
		<h1>Muokkaa</h1>
		<hr>

		<form action="update.jsp" method="get" role="form">
		
<%
	while(rs.next())
	{
%>
<input type="hidden" name="id" value="<%= rs.getString("uid") %>">

			<div class="form-group">
				<label>Tehtävä</label>
				<input type="text" name="tehtava" value="<%= rs.getString("tehtava") %>" class="form-control"> 
			</div>

			<div class="form-group">
				<label>Selite</label>
				<input type="text" name="selite" value="<%= rs.getString("selite") %>" class="form-control"> 
			</div>

			<div class="form-group">
				<label>Deadline</label>
				<input type="date" name="deadline" value="<%= rs.getString("deadline") %>" class="form-control"> 
			</div>

			<div class="form-group">
				<label>Suoritettu</label>
				<input type="hidden" name="suoritettu" value="<%= rs.getString("suoritettu") %>" class="form-control">
				<input type="checkbox" name="suoritettu" value="<%= rs.getString("suoritettu") %>" class="form-control"> 
			</div>
			
			
			
<%
			
	}//While loppuu tässä
} // Try loppuu tässä
catch(Exception ex)
{
	ex.printStackTrace();
}
finally
{
	//ps.close();
	//connection.close();
	
}
%>
			<button type="submit" class="btn btn-success btn-block">Päivitä</button>

		</form>
	</div>
</body>
</html>