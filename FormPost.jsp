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
		<%
			if (!validator.hasTable())
			{
				response.sendRedirect("CreateTable.jsp");
				
			}
		%>
		<jsp:useBean id="template" class="data.TemplateHelper" />

		<jsp:useBean id="save" scope="page" class="data.purchase" >
		<jsp:setProperty name="save" property="*" />
		</jsp:useBean>

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
	<body>
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>
			<!--Main Class Accepts User Input-->
		<div class="main">
		<h3>FORM</h3>
			<!--Get Method Displays The Form-->
		<%if(request.getMethod().equals("GET")){ %>
		<form name="FormPost" method="post" action='FormPost.jsp'>
			<p>Name:</p>
			<input type='text' name='name' maxlength='20' id='name'>
			<p>Address:</p>
			<input type='text' name='address' maxlength='20' id='address'>
			<p>Product:</p>
			<select name='product' id='product'>
				<option value="Shoes">Shoes</option>
				<option value="Toy">Toy</option>
				<option value="Blanket">Blanket</option>
				<option value="Clothes">Clothes</option>
				<option value="Pack">Pack & Play</option>
				<option value="Crib">Crib</option>
			</select>
			<p>Quantity:</p>
			<input type='number' min="0" name='qnty' maxlength='2' id='qnty'>
			<p><input type='submit' value='Submit'></p>
		</form>
		<% } %>
		<%
			//Post Method Refers to Javabean to Store Input Into Database
		if(request.getMethod().equals("POST")){
			%>
			<%-- Set up for the bean to insert into the database. --%>
			<p>Request Processed</p>
				<!--Link Back To The Get Method Of The Form-->
			<p><a href ="FormPost.jsp">>RETURN TO FORM</a></p>
			<%
					//Call the insert method in the javabean
				save.insert();
			}  %>
		</div>
			<!--Sidebar Navigation Links-->
			<%= template.getSideBarHTML() %>
	</body>
</html>