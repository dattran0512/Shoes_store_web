package net.java.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {

	 	/*
		private static String jdbcURL = "jdbc:mysql://bb87l6buyp7e3a14aglf-mysql.services.clever-cloud.com:3306/bb87l6buyp7e3a14aglf?useUnicode=true&characterEncoding=UTF-8";
	    private static String jdbcUsername = "ua27cafaz3nak5fh";
	    private static String jdbcPassword = "WRVROVrHevanu7kJrz67";
		
		*/
		private static String jdbcURL = "jdbc:mysql://localhost:3306/shoestoreweb?useUnicode=true&characterEncoding=UTF-8";
	    private static String jdbcUsername = "root";
	    private static String jdbcPassword = "123456bo";
	 
	 private static final String INSERT_BILL_SQL = "INSERT INTO bill" + "  (id,cName,cPhone,cCity,cDistrict,cDetaillAdd,cTotalAdd,totalOrder,dateOrder) VALUES " +
	            " ( ?, ?,?,?,?,?,?,?,?);";
	 private static final String INSERT_BILLDETAIL_SQL = "INSERT INTO billDetail" + "  (id,unitprice,quantity,idShoe,idBill) VALUES " +
	            " (?, ?, ?,?,?);";
	 private static final String UPDATE_TOTAL_ORDER = "update bill set totalOrder= ? where bill.id = ?";
	 protected static Connection getConnection() {
	        Connection connection = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return connection	;
	    }
	 
	 
	 public BillDAO() {}
	 
	 
	 private static void printSQLException(SQLException ex) {
	        for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
	 
	   public void insertBill(String id, String cName,String cPhone,int cCity,String cDistrict, String cDetailAdd,String  cTotalAdd, long TotalOrder, String DateOrder ) throws SQLException {
	        System.out.println(INSERT_BILL_SQL);
	        // try-with-resource statement will auto close the connection.
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BILL_SQL)) {
	            preparedStatement.setString(1,id );
	            preparedStatement.setString(2, cName);
	            preparedStatement.setString(3, cPhone);
	            preparedStatement.setInt(4, cCity);
	            preparedStatement.setString(5,cDistrict);
	            preparedStatement.setString(6, cDetailAdd);
	            preparedStatement.setString(7, cTotalAdd);
	            preparedStatement.setLong(8, TotalOrder);
	            preparedStatement.setString(9, DateOrder);
	            System.out.println(preparedStatement);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	        	printSQLException(e);
	        }
	    }
	   
	   
	   public void insertBillDetail(int id,long unitprice, int quantity,int idShoe,String idBill ) throws SQLException {
	        System.out.println(INSERT_BILLDETAIL_SQL);
	        // try-with-resource statement will auto close the connection.
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BILLDETAIL_SQL)) {
	        	preparedStatement.setInt(1,id );
	        	preparedStatement.setLong(2,unitprice );
	            preparedStatement.setInt(3, quantity);
	            preparedStatement.setInt(4, idShoe);
	            preparedStatement.setString(5, idBill);
	            System.out.println(preparedStatement);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	        	printSQLException(e);
	        }
	    }
	   
	   public void UpdateTotalOrderBill(String idBill, long totalPrice ) throws SQLException {
	        System.out.println(INSERT_BILLDETAIL_SQL);
	        // try-with-resource statement will auto close the connection.
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TOTAL_ORDER)) {
	        	preparedStatement.setLong(1,totalPrice );
	        	preparedStatement.setString(2,idBill );
	            System.out.println(preparedStatement);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	        	printSQLException(e);
	        }
	    }
	   

}
