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

    return "<div class=\"sidebar\">" + 
    "<p><a href=\"index.jsp\" class=\"button\">HOME</a></p><br>" + 
    "<p><a href=\"DisplayData.jsp\" class=\"button\">Display Data</a></p><br>" + 
    "<p><a href=\"FormPost.jsp\" class=\"button\">Place Order</a></p><br>" + 
    "<p><a href=\"CreateTable.jsp\" class=\"button\">Create Database</a></p><br>" + 
    "<p><a href=\"NukeDatabase.jsp\" class=\"button\">Delete Data</a></p><br>" + 
    "</div>";
  }
}