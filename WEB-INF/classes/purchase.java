//This is a javaBean to be used with the BubsDuds web-site
//This Bean stores the object attributes
//It also has the method for storing the provided attribute data to the database.
package data;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

		//All of the object attributes
public class purchase implements Serializable {
	private String name;
	private String address;
	private String product;
	private int qnty;
	private Connection conn = null;
	private ResultSet rs = null;
	private Statement stmt = null; 
	String connectionURL = "jdbc:oracle:thin:@localhost:1521:XE";
    	
	public purchase(){
		try {
			//Connect to the database
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1", "pass");
			System.out.println("Connection Established\n");
		} catch (Exception e) {
			System.out.println("Connection Failed\n" + e);
		}
	}
		//Getters and Setters
	public void setname(String name){
		this.name = name;
	}
	
	public String getname(){
		return name;
	}
	
	public void setaddress(String address){
		this.address = address;
	}
	
	public String getaddress(){
		return address;
	}
	
	public void setproduct(String product){
		this.product = product;
	}
	
	public String getproduct(){
		return product;
	}
	
	public void setqnty(int qnty){
		this.qnty = qnty;
	}
	
	public int getqnty(){
		return qnty;
	}	
	
	//Insert data into database
public void insert() {
	try{
			//open connection to the database
		DriverManager.registerDriver (new oracle.jdbc.OracleDriver());
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
		stmt = conn.createStatement();
		System.out.println("Connected!\n");
	}catch(Exception e){
		System.out.println("Failure at Connection!");
		return;
	}
	try{
				//insert the values into the database	
			if(name != null && address != null && product != null){
				stmt.executeUpdate("INSERT INTO PURCHASE VALUES ('" + name + "', '" + address + "', '" + product + "', '"  + qnty + "')");
				stmt.executeUpdate("COMMIT");
				System.out.println("Data Input Success!\n");
			}
			else
			{
				System.out.println("Null Value Found!");
			}
	}catch(Exception e){
		System.out.println("Data Input Failed!\n");
		}	
	}