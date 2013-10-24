<!--CIS404-->
<!--Aaron Deel-->
<!--20 October 13-->
<!--Assignment 8.3/9.3-->

<!--Homepage for BubsDuds-->
<!doctype html>
<html>
	<head>
		<jsp:useBean id="template" class="data.TemplateHelper" />
		<jsp:useBean id="purchase" class="data.purchase" />

		<meta charset="UTF-8">
		<title>Bubs Duds</title>
		<link href="styles.css" rel="stylesheet">
		<style type="text/css">
		</style>
	</head>
	<body>
		<h1>Bubs Duds</h1>
		<h2>Finding New Homes For <br>Pre-Loved Baby Products</h2>
		<div class="main">
 			<p class="intro">Bubs Duds offers 'good as new' baby
 			products without the new price tags from the comfort
 			of your own home.</p>
 			<p>We were often asked where we
 			purchased various items, and people were always
 			surprised when we told them they were secondhand,
 			because they looked brand new.</p>
 			<p>We accept telephone, fax and online orders, and
 			currently 98 per cent of our orders are placed online
 			via our secure payment gateway.</p>
 			<p>Check out our site and see what we have to offer!</p>
		</div>
			<!--Sidebar Navigation Links-->
			<%= template.getSideBarHTML() %>
	</body>
</html>