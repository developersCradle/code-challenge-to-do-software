<%@page import="com.dbconnectiontools.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String id = request.getParameter("uid");
int  uid = Integer.parseInt(id);


try
{
	
	DbConnection test = new DbConnection();
	test.deleteNote(uid);
	
	
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