<%@page import="java.sql.*"%>
<%@page import="com.dbconnectiontools.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
	<!--linkataan Bootstrap ja jQuery cdn -->
	<!--jQuery pit‰‰ laittaa ensimm‰isen‰ -->
	<script
	src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>	

	<!--Bootsrap 3, Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!--Bootsrap 3, Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



	<title>TODO applikaatio</title>

	<style type="text/css">
	hr 
	{ 
		border: 0; height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
			rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
	}

</style>

</head>
<body>


	<!-- To call Java class from JSP: -->
<%
	DbConnection test = new DbConnection();
	ResultSet rs;
	
	try
	{
		rs = test.displayNotes();
%>

		<div class="container bg-info" style="padding-top:20px; padding-bottom:20px;">
			<h1 class="text-center">TODO applikaatio</h1>
			<hr>

			<div class="row">
				<div class="col-sm-4">

					<form role="form" action="addNote.jsp" method="post">

						<div class="form-group">
							<label>Teht‰v‰</label>
							<input type="text" class="form-control" name="tehtava">
						</div>

						<div class="form-group">
							<label>Selite</label>
							<input type="text" class="form-control" name="selite">
						</div>

						<div class="form-group">
							<label>Deadline</label>
							<input placeholder="2019-06-15" type="date" class="form-control" name="deadline">
						</div>

						<button class="btn btn-info btn-block" type="Submit">Lis‰‰</button>

					</form>
				</div>
				<div class="col-sm-8">

					<table class="table">
						<thead>
							<tr>
								<th>Teht‰v‰</th>
								<th>Selite</th>
								<th>Deadline</th>
								<th>Suoritettu</th>
								<th>Toiminto</th>
							</tr>
						</thead>
						<tbody>
							
							
<%
		while(rs.next()) //Todo hae tiedot tietorakenteeseen ja p‰ivit‰ tiedot siit‰
		{   
%>
								
								
								<tr>
									<td><%= rs.getString("tehtava") %></td>
									<td><%= rs.getString("selite") %></td>
									<td><%= rs.getString("deadline") %></td>
									<td><%= rs.getString("suoritettu") %></td>
									<td><%= rs.getInt("uid") %></td>
									<td>
										<a href="editform.jsp?uid=<%= rs.getInt("uid") %>" class="btn btn-success" role="button">Muokkaa</a>
										<a href="delete.jsp?uid=<%= rs.getInt("uid") %>" class="btn btn-danger" role="button">Poista</a>
									</td>

								</tr>
								
<%
		} // While loppuu
            	
	}//Try loppuu t‰ss‰
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
            
%>
        </tbody>
    </table>
</body>
</html>