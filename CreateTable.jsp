	<!--JSP Header/Includes Tag-->
<%@ page language="Java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/bubsTag" prefix="easy" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<%@ page import="java.util.UUID" %>
		<!--Set Variables for java code-->
	<%! Connection conn = null; %>
	<%! Statement stmt = null; %>
	<%! ResultSet resultSet = null; %>
			<!--Connect To The Database-->
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
		
		<!--Main Class Displays Database Information-->
		<div class="main">
		<h3>Create Table</h3>
		<%
			//Get method pulls up the form in the browser
		if(request.getMethod().equals("GET")){
		%>
			<p>Do you want to create the Database?</p>
			<form method='post' action='CreateTable.jsp'>
				<input type='submit' value='Create'>
			</form>
		</div>
		<%
		}
			//Post Method Creates Tables and Sets Rows
		if(request.getMethod().equals("POST")){
    		try {
					//Create Tables

        		stmt.executeUpdate("CREATE TABLE PURCHASE(PurchaseCode VARCHAR2(36), ClientID VARCHAR2(36), ProductID VARCHAR2(36), Qnty SMALLINT, CONSTRAINT purchase_pk PRIMARY KEY (PurchaseCode))");
        		stmt.executeUpdate("CREATE TABLE CLIENT(clientID VARCHAR2(36), client VARCHAR2(100), Address VARCHAR2(100), CONSTRAINT client_pk PRIMARY KEY (clientID))");
        		stmt.executeUpdate("CREATE TABLE PRODUCT(productID VARCHAR2(36), product VARCHAR2(100), Img VARCHAR2(100), CONSTRAINT product_pk PRIMARY KEY (productID))");
        		
        		out.println("<p>Tables Created...</p>");
      		}catch(SQLException e){
        		out.println("<p>Table Creation Failed!!!\n</p>" + e);
      		}
			try{
				String productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Bath', '\"productPix/Bath.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Robe', '\"productPix/Robe.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Bouncer', '\"productPix/Bouncer.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Pouch', '\"productPix/Pouch.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Powder', '\"productPix/Powder.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'TraySeat', '\"productPix/TraySeat.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'BathPackage', '\"productPix/BathPackage.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Beenie', '\"productPix/Beenie.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Blanket', '\"productPix/Blanket.jpg\"')");
        		productID = UUID.randomUUID().toString();
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'CarSeat', '\"productPix/CarSeat.jpg\"')");
        		productID = UUID.randomUUID().toString();
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'DryingMat', '\"productPix/DryingMat.jpg\"')");
        		productID = UUID.randomUUID().toString();
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Exersaucer', '\"productPix/Exersaucer.jpg\"')");
        		productID = UUID.randomUUID().toString();
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Stroller', '\"productPix/Stroller.jpg\"')");
        		productID = UUID.randomUUID().toString();
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('" + productID + "', 'Shoes', '\"productPix/Shoes.jpg\"')");

        		out.println("<p>Products inserted...</p>");
      		}catch(SQLException e){
        		out.println("<p>Products insertion failed!!!\n</p>" + e);
      		}
  		}
		%>
		</div>
	</div></body>
</html>

<%
conn.close();
%>