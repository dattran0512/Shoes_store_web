package net.java.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.java.model.Shoes;
import net.java.model.TypeShoes;



public class ShoesDAO {

	/*
	private static String jdbcURL = "jdbc:mysql://bb87l6buyp7e3a14aglf-mysql.services.clever-cloud.com:3306/bb87l6buyp7e3a14aglf?useUnicode=true&characterEncoding=UTF-8";
    private static String jdbcUsername = "ua27cafaz3nak5fh";
    private static String jdbcPassword = "WRVROVrHevanu7kJrz67";
	*/
	private static String jdbcURL = "jdbc:mysql://localhost:3306/shoestoreweb?useUnicode=true&characterEncoding=UTF-8";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "123456bo";
   
  
    private static final String SELECT_ALL_SHOES_PRICE_UP = "select * from shoes order by price ASC ";
    private static final String SELECT_ALL_MAN_SHOES_PRICE_UP = "select * from shoes, typeshoes where shoes.idType= typeshoes.id and typeshoes.ManOrWomen=1 order by price ASC ";
    private static final String SELECT_ALL_WOMAN_SHOES_PRICE_UP = "select * from shoes, typeshoes where shoes.idType= typeshoes.id and typeshoes.ManOrWomen=0 order by price ASC ";
    
    private static final String SELECT_ALL_TYPE_MAN = "select * from typeshoes where ManOrWomen = 1  ";
    
    private static final String SELECT_ALL_TYPE_WOMEN = "select * from typeshoes where ManOrWomen = 0  ";
    
    private static final String SELECT_SHOES_PRICE_UP_BY_TYPE_ID="select * from shoes join typeshoes on shoes.idType=typeshoes.id where typeshoes.id= ? order by price ASC";
    
    private static final String GET_SHOES_BY_ID = "select * from shoes where id = ?";
    
    public ShoesDAO() {};
    
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
        return connection;
    }
    
 public Shoes Get_Shoes_By_ID(int id) throws SQLException{
    	
    	try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(GET_SHOES_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
           while(rs.next()) {
        	   Shoes shoes = new Shoes(rs.getInt(1),rs.getString(2),rs.getLong(3),rs.getString(4),rs.getString(5),rs.getInt(6));
        	   return shoes;
           }
            
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
   }
    
    
    public List<TypeShoes> getAll_TypeMan(){
    	List<TypeShoes> list = new ArrayList<>();
    	
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE_MAN)) {
    		 System.out.println(preparedStatement);
    		 ResultSet rs = preparedStatement.executeQuery();
    		 while (rs.next()) {
                 list.add(new TypeShoes(rs.getInt("id"), rs.getString("name"),rs.getInt("manOrWomen")));
             }
    	 } catch (SQLException e) {
             printSQLException(e);
         }
    	return list;
    }
    
    public List<TypeShoes> getAll_TypeWomen(){
    	List<TypeShoes> list = new ArrayList<>();
    	
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE_WOMEN)) {
    		 System.out.println(preparedStatement);
    		 ResultSet rs = preparedStatement.executeQuery();
    		 while (rs.next()) {
                 list.add(new TypeShoes(rs.getInt("id"), rs.getString("name"),rs.getInt("manOrWomen")));
             }
    	 } catch (SQLException e) {
             printSQLException(e);
         }
    	return list;
    }
    
    public List<Shoes> getAllShoes(){
    	List<Shoes> list = new ArrayList<>();
    	
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SHOES_PRICE_UP)) {
    		 System.out.println(preparedStatement);
    		 ResultSet rs = preparedStatement.executeQuery();
    		 while (rs.next()) {
                 list.add(new Shoes(rs.getInt("id"), rs.getString("name"),rs.getLong("price"),rs.getString("image"),
                		 rs.getString("detailInfor"),rs.getInt("idType")));
             }
    	 } catch (SQLException e) {
             printSQLException(e);
         }
    	return list;
    }
    
    public List<Shoes> getShoes_ByID(int id){
    	List<Shoes> list = new ArrayList<>();
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SHOES_PRICE_UP_BY_TYPE_ID)) {
    		 preparedStatement.setInt(1, id);
    		 System.out.println(preparedStatement);
    		 ResultSet rs = preparedStatement.executeQuery();
    		 while (rs.next()) {
                 list.add(new Shoes(rs.getInt("id"), rs.getString("name"),rs.getLong("price"),rs.getString("image"),
                		 rs.getString("detailInfor"),rs.getInt("idType")));
             }
    	 } catch (SQLException e) {
             printSQLException(e);
         }
    	return list;
    }
    
    
    public List<Shoes> getAllManShoes(){
    	List<Shoes> list = new ArrayList<>();
    	
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MAN_SHOES_PRICE_UP)) {
    		 System.out.println(preparedStatement);
    		 ResultSet rs = preparedStatement.executeQuery();
    		 while (rs.next()) {
                 list.add(new Shoes(rs.getInt("id"), rs.getString("name"),rs.getLong("price"),rs.getString("image"),
                		 rs.getString("detailInfor"),rs.getInt("idType")));
             }
    	 } catch (SQLException e) {
             printSQLException(e);
         }
    	return list;
    }
    
    public List<Shoes> getAll_WomenShoes(){
    	List<Shoes> list = new ArrayList<>();
    	
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_WOMAN_SHOES_PRICE_UP)) {
    		 System.out.println(preparedStatement);
    		 ResultSet rs = preparedStatement.executeQuery();
    		 while (rs.next()) {
                 list.add(new Shoes(rs.getInt("id"), rs.getString("name"),rs.getLong("price"),rs.getString("image"),
                		 rs.getString("detailInfor"),rs.getInt("idType")));
             }
    	 } catch (SQLException e) {
             printSQLException(e);
         }
    	return list;
    }
    

	private void printSQLException(SQLException e) {
		// TODO Auto-generated method stub
		
	}
	
    
}
