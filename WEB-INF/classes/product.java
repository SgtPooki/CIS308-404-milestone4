//This is the product javabean to be used with the BubsDuds web-site
//This Bean stores the product attributes
package data;

import java.io.Serializable;

		//All of the object attributes
public class product implements Serializable {
	private String productid;
	private String name;
	private String img;
    	
	public product(){
		productid = "";
		name = "";
		img = "";
	}

		//Getters and Setters
	public void setproductid(String productid){
		this.productid = productid;
	}
	
	public String getproductid(){
		return productid;
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
}