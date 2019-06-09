package com.shangwu.common.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionFactory {
   private ConnectionFactory connectionFactory=new ConnectionFactory();
   private ConnectionFactory()
   {
	  
	   try {
		Class.forName("com.mysql.jdbc.Driver");
	   } 
	   catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	   }
   }
   public static Connection getConnection()
   {
	 
	   String url="jdbc:mysql://127.0.0.1:3306/okair?characterEncoding=utf8";
	   String username="root";
	   String password="123456";
	   Connection conn=null;
	   try {
		   Class.forName("com.mysql.jdbc.Driver");
		
		   conn=DriverManager.getConnection(url, username, password);
	    } 
	   catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	   }
	   return conn;
   }
   public static void close(Connection conn,Statement stmt,ResultSet rs)
   {
   	try {
	    	if(conn!=null)
	    	{
			   conn.close();
	    	}
	    	if(stmt!=null)
	    	{
	    		stmt.close();
	    	}
	    	if(rs!=null)
	    	{
	    		rs.close();
	    	}
   	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
   public static void close(Connection conn,PreparedStatement ps,ResultSet rs)
   {
   	try {
	    	if(conn!=null)
	    	{
			   conn.close();
	    	}
	    	if(ps!=null)
	    	{
	    		ps.close();
	    	}
	    	if(rs!=null)
	    	{
	    		rs.close();
	    	}
   	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
   public static void close(Connection conn,PreparedStatement ps)
   {
   	try {
	    	if(conn!=null)
	    	{
			   conn.close();
	    	}
	    	if(ps!=null)
	    	{
	    		ps.close();
	    	}
	    	
   	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
   public static void close(Connection conn,Statement stmt)
   {
   	try {
	    	if(conn!=null)
	    	{
			   conn.close();
	    	}
	    	if(stmt!=null)
	    	{
	    		stmt.close();
	    	}
	    	
   	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
}
