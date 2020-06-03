package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.api.jdbc.Statement;

import objects.Bike;

public class Dao {
	Connection con;
	java.sql.Statement stmt;
	
	

	public ResultSet getResult(String query) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://sql7.freemysqlhosting.net/sql7345136",
					"sql7345136", "CusQ4kjddU");
			System.out.println("Connected");

			stmt = con.createStatement();
			return stmt.executeQuery(query);
		} catch (Exception e) {
			return null;
		}
	}
	
	public void closeTransaktion() throws SQLException {
		stmt.close();
		con.close();
	}
}
