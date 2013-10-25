	<!--JSP Header/Includes Tag-->
<%@ page language="Java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/bubsTag" prefix="easy" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
		<!--HTML Header-->
	<head>

		<jsp:useBean id="validator" class="data.Validator"/>

		<jsp:useBean id="template" class="data.TemplateHelper" />

		<jsp:useBean id="save" scope="page" class="data.purchase" />

		<meta charset="UTF-8">
		<title>Form</title>
		<link href="styles.css" rel="stylesheet">
		<style type="text/css">
		</style>
	</head>
		<!--imports for java code-->
	<%@ page import="java.io.*"%>
	<%@ page import="java.servlet.*"%>
	<%@ page import="java.net.URL" %>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.servlet.*"%>
	<%@ page import="java.net.URL" %>
	<%@ page import="oracle.jdbc.OracleResultSetMetaData" %>
	<body>
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>

		<!-- Navigation Links-->
		<%= template.getSideBarHTML() %>
		
		<!--Main Class Accepts User Input-->
		<div class="main">
		<h3>FORM</h3>
			<!--Get Method Displays The Form-->
		<%if(request.getMethod().equals("GET")){

			if (!validator.hasTable())
			{
				response.sendRedirect("CreateTable.jsp");
				
			} else {%>
				<form name="FormPost" method="post" action='FormPost.jsp'>
					<p>Name:</p>
					<input type='text' name='name' maxlength='20' id='name'>
					<p>Address:</p>
					<input type='text' name='address' maxlength='20' id='address'>
					<p>Product:</p>
					<select name='product' id='product'>
						<%

						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
						PreparedStatement psSelectRecord=null;
						String sqlSelectRecord=null;
						ResultSet productResults = null;

						sqlSelectRecord ="SELECT product FROM product";
						psSelectRecord=conn.prepareStatement(sqlSelectRecord);
						productResults=psSelectRecord.executeQuery();

						while(productResults != null && productResults.next()){
						    String product = productResults.getString("product");
						%>
							<option value="<%=product%>"><%=product%></option>
						<%
						}
						%>
					</select>
					<p>Quantity:</p>
					<input type='number' min="0" name='qnty' maxlength='2' id='qnty'>
					<p><input type='submit' value='Submit'></p>
				</form>
		<%  }
		}
			//Post Method Refers to Javabean to Store Input Into Database
		if(request.getMethod().equals("POST")){

			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String product = request.getParameter("product");
			int qnty = Integer.parseInt(request.getParameter("qnty"));



			//Call the insert method in the javabean
			//save.insert();
			%>
			<%= save.insert(name, address, product, qnty) %>
			%>

			<p>Request Processed</p>
				<!--Link Back To The Get Method Of The Form-->
			<p><a href ="FormPost.jsp">>RETURN TO FORM</a></p>
		<%}%> 	
		</div>
	</body>
</html>