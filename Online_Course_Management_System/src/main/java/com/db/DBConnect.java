package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn;
	
	public static Connection getConn() {
		
		try {
			
//			4 steps
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms","root","root");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
		
	}

}
