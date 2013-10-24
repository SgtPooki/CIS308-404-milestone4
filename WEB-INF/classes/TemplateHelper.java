/*
  Russell Dempsey - CIS404 - Week9, Milestone4
  22 OCT 2013
*/

package data;

public class TemplateHelper {

  public TemplateHelper() {
  }

  public String getSideBarHTML() {

  	//TODO: Make this function pull this HTML from a file in a folder called templates.. so we can easily change our html!! i.e. templates/sidebar.html. 
  	return 
		"<div class=\"sidebar\">" + 
      "<p><a href =\"index.jsp\">>Home</a></p><br>" +
      "<p><a href =\"DisplayData.jsp\">>Display Data</a></p><br>" +
			"<p><a href =\"FormPost.jsp\">>Place Order</a></p><br>" +
			"<p><a href =\"CreateTable.jsp\">>Create Database</a></p><br>" +
			"<p><a href =\"NukeDatabase.jsp\">>Delete Data</a></p>" +
		"</div>";

  }
}