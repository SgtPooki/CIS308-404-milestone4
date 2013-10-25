//This is the client javaBean to be used with the BubsDuds web-site
//This Bean stores the client attributes
package data;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

		//All of the object attributes
public class client implements Serializable {
	private String clientid;
	private String name;
	private String address;

	public client(){
		clientid = "";
		name = "";
		address = "";
	}

			//Getters and Setters
	public void setclientid(String clientid){
		this.clientid = clientid;
	}
	
	public String getclientid(){
		return clientid;
	}
		
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
}