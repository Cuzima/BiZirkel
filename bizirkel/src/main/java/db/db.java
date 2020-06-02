package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class db {
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://sql7.freemysqlhosting.net/sql7345136", "sql7345136", "CusQ4kjddU");
			System.out.println("Connected");

			java.sql.Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM bike");
			java.sql.ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			   while (rs.next()) {
			       for (int i = 1; i <= columnsNumber; i++) {
			           if (i > 1) System.out.print(",  ");
			           String columnValue = rs.getString(i);
			           System.out.print(columnValue);
			       }
			       System.out.println("");
			   }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
