//This is the product javabean to be used with the BubsDuds web-site
//This Bean stores the product attributes
package data;

import java.io.Serializable;

		//All of the object attributes
public class product implements Serializable {
	private String id;
	private String name;
	private String img;
	private int qnty;
    	
	public product(){
		id = "";
		name = "";
		qnty = 0;
		img = "";
	}

		//Getters and Setters
	public void setid(String id){
		this.id = id;
	}
	
	public String getid(){
		return id;
	}

	public void setname(String name){
		this.name = name;
	}
	
	public String getname(){
		return name;
	}
	
	public void setimg(String img){
		this.img = img;
	}
	
	public String getimg(){
		return img;
	}
	
	public void setqnty(int qnty){
		this.qnty = qnty;
	}
	
	public int getqnty(){
		return qnty;
	}
}