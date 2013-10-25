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
		<!--Set Variables for java code-->
	<%! Connection conn = null; %>
	<%! Statement stmt = null; %>
	<%! ResultSet resultSet = null; %>
			<!--Connect To The Database-->
		<%
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
		stmt = conn.createStatement();
		%>
	<body>
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>
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
					//Create Tables
				try{
        		stmt.executeUpdate("CREATE TABLE PURCHASE(PURCHASEID VARCHAR2(36), ClientID VARCHAR2(36), ProductID VARCHAR2(36), Qnty SMALLINT, CONSTRAINT purchase_pk PRIMARY KEY (PurchaseID))");
    		}catch(SQLException e){
	    		out.println("Purchase Table Creation Failed" + e);
    		}
        		try{
        		stmt.executeUpdate("CREATE TABLE CLIENT(CLIENTID VARCHAR2(4), client VARCHAR2(100), Address VARCHAR2(100), CONSTRAINT client_pk PRIMARY KEY (clientid))");
			}catch(SQLException e){
	    		out.println("Client Table Creation Failed" + e);
    		}
				try{
        		stmt.executeUpdate("CREATE TABLE PRODUCT(PRODUCTID VARCHAR2(4), product VARCHAR2(100), Img VARCHAR2(100), CONSTRAINT product_pk PRIMARY KEY (productid))");
        	}catch(SQLException e){
	    		out.println("Client Table Creation Failed" + e);
    		}
    			try{	
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0001', 'Bath', 'Bath.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0002', 'Robe', 'Robe.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0003', 'Bouncer', 'Bouncer.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0004', 'Pouch', 'Pouch.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0005', 'Powder', 'Powder.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0006', 'TraySeat', 'TraySeat.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0007', 'BathPackage', 'BathPackage.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0008', 'Beenie', 'Beenie.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0009', 'Blanket', 'Blanket.jpg')");
        		stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0010', 'CarSeat', 'CarSeat.jpg')");
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0011', 'DryingMat', 'DryingMat.jpg')");
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0012', 'Exersaucer', 'Exersaucer.jpg')");
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0013', 'Stroller', 'Stroller.jpg')");
				stmt.executeUpdate("INSERT INTO PRODUCT VALUES('0014', 'Shoes', 'Shoes.jpg')");
        		out.println("<p>Database Created...</p>");
      		}catch(SQLException e){
        		out.println("<p>Insert Failed!!!\n</p>" + e);
      		}
  		}
		%>
		</div>
				<!--Sidebar Navigation Links-->

			<%= template.getSideBarHTML() %>
	</body>
</html>

<%
conn.close();
%>