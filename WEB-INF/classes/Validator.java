/*
  Russell Dempsey - CIS404 - Week9, Milestone4
  22 OCT 2013
*/

package data;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Validator {

  private PrintWriter out;
  private Connection con;

  public Validator() throws SQLException{
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
  }

  public boolean hasTable() throws SQLException{

      DatabaseMetaData meta = con.getMetaData();
      ResultSet res = meta.getTables(null, null, null, new String[] {"TABLE"});
      //out.println("List of tables: "); 
      String fin = "";
      while (res.next()) {
        if ("PURCHASE".equals(res.getString("TABLE_NAME"))) {
          return true;
        }
      }

      return false;
  }
}