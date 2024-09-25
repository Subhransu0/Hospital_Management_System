package com.sonu.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection con;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			DBConnect.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_management", "root",
					"Subh123@");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
