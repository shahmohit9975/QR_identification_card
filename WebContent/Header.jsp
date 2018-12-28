<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>Insert title here</title>
<style>
body {
	background: url("back1.jpg");
}

.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
}

.btn:hover {
	background-color: #89F089;
}
</style>
</head>

<body>
	<table align="center">


		<tr>

			<td><br> <a href="Home_Page.jsp">
					<button class="btn">
						<i class="fa fa-home"></i> Home
					</button>
			</a> <a href="registration_formm.jsp">
					<button class="btn">
						<i class="fa fa-folder"></i> ADD New Record
					</button>
			</a> <a href="show_i_card.jsp">
					<button class="btn">
						<i class="glyphicon glyphicon-user"></i> Generate I Card
					</button>
			</a></td>

		</tr>


	</table>
</body>
</html>