//This is a javaBean to be used with the BubsDuds web-site
//This Bean stores the object attributes
//It also has the method for storing the provided attribute data to the database.
package data;

import java.io.*;
import java.sql.*;
import java.util.UUID;

		//All of the object attributes
public class purchase implements Serializable {
	private String output = "";
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
			output += "Connection Established\n";
		} catch (Exception e) {
			output += "Connection Failed\n" + e;
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
	public String insert(String name, String address, String product, int qnty) {

		String clientID = UUID.randomUUID().toString();
		//String productID = UUID.randomUUID().toString();
		String purchaseID = UUID.randomUUID().toString();
		String productID = "";
		try {
			//Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
			PreparedStatement psSelectRecord=null;
			String sqlSelectRecord=null;
			ResultSet productResults = null;

			sqlSelectRecord ="SELECT productID FROM product WHERE product = '" + product + "'";
			psSelectRecord=conn.prepareStatement(sqlSelectRecord);
			productResults=psSelectRecord.executeQuery();
			productResults.next();
	    	productID = productResults.getString("productID");
		} catch (Exception e) {
			output += "Could not get productID<br/>" + e.getMessage();
		}


		//output += "<br/>Attempting to save: name='" + name + "', address='" + address + "', product='" + product + "', qnty='" + Integer.toString(qnty) + "', img='" + img + "'.<br/>";


		String clientSQL = "INSERT INTO CLIENT VALUES ('" + clientID + "', '" + name + "', '" + address + "')";
		//String productSQL = "INSERT INTO PRODUCT VALUES ('" + productID + "', '" + product + "', '" + img + "')";
		String purchaseSQL = "INSERT INTO PURCHASE VALUES ('" + purchaseID + "', '" + clientID + "', '" + productID + "', " + qnty + ")";
		//String name = newclient.getname();
		//String address = newclient.getaddress();
		//String product = newproduct.getname();
		//int qnty = newproduct.getqnty();
		//String img = "";

				//output += "Saved: name='" + name + "', address='" + address + "', product='" + product + "', qnty='" + Integer.toString(qnty) + "', img='" + img + "'.";
				//return output;
		try{
				//open connection to the database
			//DriverManager.registerDriver (new oracle.jdbc.OracleDriver());
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
			stmt = conn.createStatement();
			output += "Connected!\n";
		}catch(Exception e){
			output += "Failure at Connection!";

			return output;
		}
		
		try{
				//insert the values into the database
			if(name != null && address != null && product != null){
				stmt.executeUpdate(clientSQL);
				//stmt.executeUpdate(productSQL);
				stmt.executeUpdate(purchaseSQL);
				//stmt.executeUpdate("COMMIT");
				output += "Data Input Success!\n";
			}
			else
			{
				output += "Null Value Found!";
			}
		} catch(Exception e){
			//output += clientSQL + "\n" + productSQL + "\n" + purchaseSQL + "\n";
			output += "Data Input Failed!\n" + e.getMessage();
			return output;
		}
		
		return output;
	}
}


