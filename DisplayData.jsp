	<!--JSP Header/Includes Tag-->
<%@ page language="Java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/bubsTag" prefix="easy" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
		<!--HTML Header-->
	<head>

		<!--Set up for the bean to get data from the database.-->
		<jsp:useBean id="validator" class="data.Validator"/>
		<jsp:useBean id="template" class="data.TemplateHelper" />
		
		<jsp:useBean id="save" scope="page" class="data.purchase" >
		<jsp:setProperty name="save" property="*" />
		</jsp:useBean>

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
	
		<%

			PreparedStatement psSelectRecord=null;
			String sqlSelectRecord=null;
			ResultSet purchaseResults = null;
			//ResultSet productResults = null;
			//ResultSet clientResults = null;

			//ArrayList purchases = new ArrayList();

			if (!validator.hasTable())
			{
				response.sendRedirect("CreateTable.jsp");
				
			} else {	

				/*
				SELECT purchase.purchasecode "purchaseCode", client.id "cid", product.id "pid", purchase.qnty "qnty", product.name "productName",  client.name "clientName", client.address "address", product.img "img"
				FROM purchase, client, product
				WHERE purchase.clientid = client.id AND purchase.productid = product.id;

				*/


				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
				sqlSelectRecord ="SELECT purchase.qnty, product.product,  client.client, client.address, product.img" +
				" FROM purchase, client, product" +
				" WHERE purchase.clientid = client.clientid AND purchase.productid = product.productid";
				psSelectRecord=conn.prepareStatement(sqlSelectRecord);
				purchaseResults=psSelectRecord.executeQuery();



			}
		
		%>
	<body><div class="bodyInner">
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>
		
		<!-- Navigation Links-->
		<%= template.getSideBarHTML() %>

		<!--Main Class Displays Database Information-->
		<div class="main">
		<h3>Records</h3>
			<table>
				<tr>
					<th>Client Name</th>
					<th>Address</th>
					<th>Product</th>
					<th>Quantity</th>
					<th>Img</th>
				</tr>
			<%
			while(purchaseResults != null && purchaseResults.next()){
			%>
				<tr>
					<td><%=purchaseResults.getString("client")%></td>
					<td><%=purchaseResults.getString("address")%></td>
					<td><%=purchaseResults.getString("product")%></td>
					<td><%=purchaseResults.getString("qnty")%></td>
					<td><%=purchaseResults.getString("img")%></td>
				</tr>
			<%
			}
				//conn.close();
		%>
			</table>
		</div>
	</div></body>
</html>
