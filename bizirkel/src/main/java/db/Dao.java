package db;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mysql.cj.api.jdbc.Statement;

import objects.Bike;

public class Dao {
//	Connection con;
//	java.sql.Statement stmt;
//	ResultSet rs;
//
//	public ResultSet getResult(String query) throws InterruptedException {
//
//		while (con == null) {
//			try {
//				Class.forName("com.mysql.cj.jdbc.Driver");
//				con = DriverManager.getConnection("jdbc:mysql://sql7.freemysqlhosting.net/sql7345136", "sql7345136",
//						"CusQ4kjddU");
//				System.out.println("Connected");
//				stmt = con.createStatement();
//				rs = stmt.executeQuery(query);
//				
//			} catch (Exception e) {
//				Object lock = new Object();
//				synchronized (lock) {
//			        try {
//			            lock.wait(1000);
//			        } catch (Throwable e1) {
//			            e1.printStackTrace();
//			        }
//			    }
//			}
//		}
//		return rs;
//
//	}
//
//	public void closeTransaktion() throws SQLException {
//		if (stmt != null)
//			stmt.close();
//		if (con != null)
//			con.close();
//		if (rs != null)
//			rs.close();
//	}
	
	private static Dao dataSource = null;
    private ComboPooledDataSource comboPooledDataSource;

    private Dao() {
       try {
          comboPooledDataSource = new ComboPooledDataSource();
          comboPooledDataSource
             .setDriverClass("com.mysql.cj.jdbc.Driver");
          comboPooledDataSource
             .setJdbcUrl("jdbc:mysql://sql7.freemysqlhosting.net/sql7345136");
          comboPooledDataSource.setUser("sql7345136");
          comboPooledDataSource.setPassword("CusQ4kjddU");
          System.out.println(comboPooledDataSource.getInitialPoolSize());
          comboPooledDataSource.setMinPoolSize(3);
          comboPooledDataSource.setAcquireIncrement(5);
          comboPooledDataSource.setMaxPoolSize(10);
       }
       catch (PropertyVetoException ex1) {
          ex1.printStackTrace();
       }
    }

    public static Dao getInstance() {
       if (dataSource == null)
          dataSource = new Dao();
       return dataSource;
    }

    public Connection getConnection() {
       Connection con = null;
       try {
          con = comboPooledDataSource.getConnection();
       } catch (SQLException e) {
          e.printStackTrace();
       }
       return con;
    }
	
}
