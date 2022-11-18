package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static Connection con;
	public static Connection getCon() {
		
		try {
			
		if(con==null) {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:orcl", "jdbc", "jdbc123");
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
}
