	//This is a TAG for the BubsDuds Website
	//This TAG prints the header text for each page
package data;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class bubsTag extends TagSupport{
	public int doEndTag() throws JspException{
		JspWriter out = pageContext.getOut();
		try{
			out.println("Finding New Homes For <br>Pre-Loved Baby Products");
		}catch(Exception e){
		}
		return super.doEndTag();
	}
}