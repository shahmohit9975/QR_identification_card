



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="DAO.DB"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="text_box.css">

<title>Generate I Card</title>
<style>
body {
	background: url("back1.jpg");
}

.button {
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 1px;
	width: 250px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	height: 40px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>


	<jsp:include page="Header.jsp"></jsp:include>
	<%
		String id = request.getParameter("id");

		String path = null;
		String url = null;
		Connection con = DB.getConnection();
		PreparedStatement ps = con.prepareStatement("select qr_code from employee where id=?");
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {

			path = rs.getString("qr_code");

		}
		con.close();
		//url = request.getRequestURL().toString();
		// 		out.println(path);
		// 		out.println("<br>\n"+path.lastIndexOf("\\"));
		// 		out.println("<br>\n"+path.length());
		// 		out.println("<br>\n" + path.substring(path.lastIndexOf("\\")+1));
		String qr_code_name = path.substring(path.lastIndexOf("\\") + 1);
	%>


	<div id="printableArea">

		<table align="center" style="margin-top: 50px; padding: 20px">
			<tr style="color: white; padding-top: 120px;" bgcolor="#704F50">
				<td align="center" colspan="5"><b>ABC Company</b></td>
			</tr>
			<tr bgcolor="#FOA979">
				<td align="center" colspan="5"><b>ID NO :<%=id%></b></td>
			</tr>
			<tr>
				<td></td>
				<td><img src="get_photo.jsp?id=<%=id%>" width="100px"
					height="100px" align="middle" /></td>
				<td></td>

				<td><img src="<%=qr_code_name%>" width="100px" height="100px" />
				</td>
				<td></td>

			</tr>

		</table>
	</div>

	<br>
	<br>
	<br>
	<br>

	<table align="center">

		<tr>
			<td colspan="2" align="center">
				<button onclick="myFunction('printableArea')" class="button">
					<span>Print this Card</span>
				</button> <br>


			</td>

		</tr>




	</table>





	<script>
		function myFunction(divName) {
			// 			window.print();
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			window.print();

			document.body.innerHTML = originalContents;
		}
	</script>
	<br>
	<br>



</body>
</html>