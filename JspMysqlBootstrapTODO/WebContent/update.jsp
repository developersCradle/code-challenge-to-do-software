<%@page import="com.dbconnectiontools.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String id = request.getParameter("id");
int  uid = Integer.parseInt(id);

String tehtava = request.getParameter("tehtava");
String selite = request.getParameter("selite");
String deadline = request.getParameter("deadline"); //Muuta dateks
String suoritettu = request.getParameter("suoritettu"); 



try
{
	
	DbConnection test = new DbConnection();
	test.updateNote( tehtava,  selite,  deadline,  suoritettu, uid);
	
}
catch(Exception ex)
{
	ex.printStackTrace();
}
finally
{
	//ps.close();
	//connection.close();
	response.sendRedirect("index.jsp");
}
%>
</body>
</html>