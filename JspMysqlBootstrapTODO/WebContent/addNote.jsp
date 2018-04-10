<%@page import="com.dbconnectiontools.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding note</title>
</head>
<body>
<%

String tehtava = request.getParameter("tehtava");
String selite = request.getParameter("selite");;
String deadline = request.getParameter("deadline");

try
{
	DbConnection test = new DbConnection();
	test.addNote(tehtava, selite, deadline);
}
catch(Exception ex)
{
	out.println(ex.getMessage());
}
finally
{
	response.sendRedirect("index.jsp");
	//ps.close();
	//connection.close();
}

%>
</body>
</html>