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
	<body><div class="bodyInner">
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>
		
		<!-- Navigation Links-->
		<%= template.getSideBarHTML() %>

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
			//Delete All Data
			try{
    			stmt.executeUpdate("DROP TABLE PURCHASE");
    		}catch(SQLException e){
    		out.println("<p>Purchase Did Not Exist</p>" + e);
  			}
    		try{
    			stmt.executeUpdate("DROP TABLE CLIENT");
    		}catch(SQLException e){
    			out.println("<p>Client Did Not Exist</p>" + e);
			}
    		try{
    			stmt.executeUpdate("DROP TABLE PRODUCT");
    		}catch(SQLException e){
    			out.println("<p>Product Did Not Exist</p>" + e);
			}

			out.println("<p>Tables deleted successfully</p>");
  		}
		%>
		</div>
	</div></body>
</html>

<%
conn.close();
%>