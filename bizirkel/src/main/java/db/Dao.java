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
