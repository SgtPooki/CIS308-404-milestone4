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
	private String clientid;
	private String productid;
	private int qnty;
	
	private Connection conn = null;
	private ResultSet rs = null;
	private Statement stmt = null; 
	String connectionURL = "jdbc:oracle:thin:@localhost:1521:XE";
    
	data.client newclient = new client();
	data.product newproduct = new product();
	public purchase(){
		clientid = newclient.getid();
		productid = newproduct.getid();
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
	public void clientid(String name){
		this.clientid = clientid;
	}
	
	public String clientid(){
		return clientid;
	}
	
	public void productid(String productid){
		this.productid = productid;
	}
	
	public String getproductid(){
		return productid;
	}
	
	//Insert data into database
public void insert() {
	String name = newclient.getname();
	String address = newclient.getaddress();
	String product = newproduct.getname();
	int qnty = newproduct.getqnty();
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
}