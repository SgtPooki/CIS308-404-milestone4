/*
  Russell Dempsey - CIS404 - Week9, Milestone4
  22 OCT 2013
*/
//TODO: Make this function pull this HTML from a file in a folder called templates.. so we can easily change our html!! i.e. templates/sidebar.html. 
package data;

import java.io.*;
import javax.servlet.ServletContext;

public class TemplateHelper {


  public TemplateHelper(){
  }

  public String getSideBarHTML() throws FileNotFoundException, IOException{

    return "<link href=\"template.css\" rel=\"stylesheet\">" +
    "<div class=\"sidebar\">" + 
    "<a href=\"index.jsp\" class=\"button\">Home</a>" + 
    "<a href=\"DisplayData.jsp\" class=\"button\">Display Data</a>" + 
    "<a href=\"FormPost.jsp\" class=\"button\">Place Order</a>" + 
    "<a href=\"CreateTable.jsp\" class=\"button\">Create Database</a>" + 
    "<a href=\"NukeDatabase.jsp\" class=\"button\">Delete Data</a>" + 
    "</div>";
  }
}