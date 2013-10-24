	<!--JSP Header/Includes Tag-->
<%@ page language="Java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/bubsTag" prefix="easy" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
		<!--HTML Header-->
	<head>
		<jsp:useBean id="template" class="data.TemplateHelper" />

		<meta charset="UTF-8">
		<title>Record</title>
		<link href="styles.css" rel="stylesheet">
		<style type="text/css">
		</style>
	</head>
		<!--imports for java code-->
	<%@ page import="java.io.*"%>
	<%@ page import="java.servlet.*"%>
	<%@ page import="java.net.URL" %>
	<%@ page import="java.sql.*" %>
	<%@ page import="oracle.jdbc.OracleResultSetMetaData" %>
		<!--Set Variables for java code-->
	<%! Connection conn = null; %>
	<%! Statement stmt = null; %>
	<%! ResultSet resultSet = null; %>
			<!--Connect to the database-->
	<%
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
	stmt = conn.createStatement();
	%>
	<body>
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>
			<!--Main Class removes all data from the tables-->
		<div class="main">
		<h3>Clear Database</h3>
		<%
			//Get method pulls up the form in the browser
		if(request.getMethod().equals("GET")){
		%>
				<!--Move to POST action in this jsp if sumbit pressed-->
			<p>Are you sure you want to delete all data?</p>
			<form method='post' action='NukeDatabase.jsp'>
				<input type='submit' value='Delete'>
			</form>
		</div>
		<%
		}
			//After submit is pressed
		if(request.getMethod().equals("POST")){
    		try{
					//Delete All Data
        		stmt.executeUpdate("DELETE FROM PURCHASE");
        		stmt.executeUpdate("DELETE FROM CLIENT");
        		stmt.executeUpdate("DELETE FROM PRODUCT");

				stmt.executeUpdate("DROP SEQUENCE purchaseID");
				stmt.executeUpdate("DROP SEQUENCE clientID");
				stmt.executeUpdate("DROP SEQUENCE productID");

				stmt.executeUpdate("CREATE SEQUENCE purchaseID MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10");
				stmt.executeUpdate("CREATE SEQUENCE clientID MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10");
				stmt.executeUpdate("CREATE SEQUENCE productID MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10");

        		out.println("<p>Table Deleted...</p>");
      		}catch(SQLException e){
        		out.println("<p>Table Deletion Failed!!!</p>" + e);
      		}
  		}
		%>
		</div>
			<!--Sidebar Navigation Links-->

			<%= template.getSideBarHTML() %>
	</body>
</html>