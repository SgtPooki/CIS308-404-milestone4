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
			ResultSet rsSelectRecord=null;
			String sqlSelectRecord=null;
			ResultSet purchaseResults = null;
			ResultSet purchaseResults = null;
			ResultSet purchaseResults = null;

			ArrayList purchases = new ArrayList();

			if (!validator.hasTable())
			{
				response.sendRedirect("CreateTable.jsp");
				
			} else {	
			
				//Connect To The Database
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
				sqlSelectRecord ="SELECT * FROM PURCHASE";
				psSelectRecord=conn.prepareStatement(sqlSelectRecord);
				purchaseResults=psSelectRecord.executeQuery();
				while(purchaseResults != null && purchaseResults.next()) {
					HashMap<String, String> purchase = new HashMap<String, String>(); 
					purchase.put('purchaseCode', purchaseResults.getString('purchaseCode'));
					purchase.put('clientID', purchaseResults.getString('clientID'));
					purchase.put('productID', purchaseResults.getString('productID'));
					purchase.put('qnty', purchaseResults.getString('qnty'));
					purchases.add(purchase);

				}

				sqlSelectRecord ="SELECT * FROM PRODUCT";
				psSelectRecord=conn.prepareStatement(sqlSelectRecord);
				productResults=psSelectRecord.executeQuery();
				for(HashMap<String, String> purchase : purchases){
					while(productResults != null && productResults.next()) {
						if (purchase.get('productID').equals(productResults.getString('ID'))) {
							purchase.put('productName', productResults.getString('name'));
							purchase.put('img', productResults.getString('img'));
						}

					}
				}


				sqlSelectRecord ="SELECT * FROM CLIENT";
				psSelectRecord=conn.prepareStatement(sqlSelectRecord);
				clientResults=psSelectRecord.executeQuery();
				for(HashMap<String, String> purchase : purchases){
					while(clientResults != null && clientResults.next()) {
						if (purchase.get('clientID').equals(clientResults.getString('ID'))) {
							purchase.put('clientName', clientResults.getString('name'));
							purchase.put('address', clientResults.getString('address'));
						}

					}
				}

				//if client


			}
		
		%>
	<body>
			<!--Custom Tag Header-->
		<h1>Bubs Duds</h1>
		<h2><easy:bubsTag /></h2>
			<!--Main Class Displays Database Information-->
		<div class="main">
		<h3>Records</h3>
			<table>
				<tr>
					<th>Client Name</th>
					<th>Address</th>
					<th>Product</th>
					<th>Quantity</th>
				</tr>
			<%
			/*while(rsSelectRecord != null && purchaseResults.next()){
			%>
				<tr>
					<td><%=rsSelectRecord.getString("name")%></td>
					<td><%=rsSelectRecord.getString("address")%></td>
					<td><%=rsSelectRecord.getString("product")%></td>
					<td><%=rsSelectRecord.getString("qnty")%></td>
				</tr>
			<%
			}*/
		%>
			</table>
		</div>
				<!--Sidebar Navigation Links-->
			<%= template.getSideBarHTML() %>
	</body>
</html>