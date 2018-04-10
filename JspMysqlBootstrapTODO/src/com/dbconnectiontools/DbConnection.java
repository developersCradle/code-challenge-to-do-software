package com.dbconnectiontools;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Connection;
import java.sql.Date;



public class DbConnection
{

	private static Connection connection;
	private static boolean hasData = false;
	
	public ResultSet displayNotes() throws ClassNotFoundException, SQLException
	{
		if(connection == null) //if we have connection
		{
			getConnection(); //Exception from getConnection() are throwed to the who uses this class
		}
		
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT * FROM notestable");
		return resultSet;
	}
	
	public ResultSet displayNote(int id) throws ClassNotFoundException, SQLException
	{
		if(connection == null) //if we have connection
		{
			getConnection(); //Exception from getConnection() are throwed to the who uses this class
		}
		
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT * FROM notestable WHERE uid='" + id + "'");
		return resultSet;
	}
	
	

	private void getConnection() throws ClassNotFoundException, SQLException //Throwing these 2 Exceptions
	{
		Class.forName("org.sqlite.JDBC");  //Load our driver to driver manager
		connection = DriverManager.getConnection("jdbc:sqlite:SQLiteTest7.db");
		initialise();
	}

	private void initialise() throws SQLException 
	{
		if (!hasData) //Jos ei löytynyt
		{
			hasData = true;
			
			Statement statement = connection.createStatement(); 
			ResultSet resultSet = statement.executeQuery("SELECT name FROM sqlite_master WHERE type='table' AND name='notestable'");
			
			if (!resultSet.next())
			{
				System.out.println("Building the notestable with some values.");
				// taulun rakentaminen
				Statement statement2 = connection.createStatement();
				
				
				statement2.execute("CREATE TABLE notestable(uid integer,"
						+ "tehtava varchar(100)," + "selite varchar(200),"
						+ "deadline date," + "	suoritettu	tinyint(1),"
						+ "primary key(uid));"); //Luodaan taulu
				
				//alku datan lisääminen tauluun
				
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO notestable(tehtava, selite, deadline, suoritettu) VALUES(?,?,?,?);");
				
				preparedStatement.setString(1, "tehtava");
				preparedStatement.setString(2, "selite");
				preparedStatement.setString(3, "2014-02-04");
				preparedStatement.setString(4, "0");
				preparedStatement.execute();
				

				
				PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO notestable(tehtava, selite, deadline, suoritettu) VALUES(?,?,?,?);");
				
				preparedStatement2.setString(1, "tehtava2");
				preparedStatement2.setString(2, "selite2");
				preparedStatement2.setString(3, "2014-12-12");
				preparedStatement2.setString(4, "1");
				preparedStatement2.execute();
			}
		
		}
		
	}
	
	public void addNote(String tehtava, String selite, String deadline) throws ClassNotFoundException, SQLException //Deadline Date formaattiin?
	{
		if (connection == null) 
		{
			getConnection();
		}	
		
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO notestable(tehtava, selite, deadline, suoritettu) VALUES(?,?,?,?);");
		preparedStatement.setString(1, tehtava);
		preparedStatement.setString(2, selite);
		preparedStatement.setString(3, deadline);
		preparedStatement.setString(4, "0"); // Oletuksena ei ole suoritettu
		preparedStatement.execute();
	}
	
	public void deleteNote(int uid)throws ClassNotFoundException, SQLException
	{
		PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM notestable WHERE uid=?");
		preparedStatement.setInt(1, uid);
		preparedStatement.executeUpdate();
	}
	
	public void updateNote(String tehtava, String selite, String deadline, String suoritettu, int uid) throws ClassNotFoundException, SQLException
	{
		if (connection == null) 
		{
			getConnection();
		}	
		
		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE notestable SET tehtava=?, selite=?, deadline=?, suoritettu=? WHERE uid=?");
		preparedStatement.setString(1, tehtava);
		preparedStatement.setString(2, selite);
		preparedStatement.setString(3, deadline);
		preparedStatement.setString(4, suoritettu);
		preparedStatement.setInt(5, uid);
		preparedStatement.executeUpdate();
		
	}
	
}
