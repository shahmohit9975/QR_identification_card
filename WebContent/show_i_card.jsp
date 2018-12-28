<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<style>
body {
	background: url("back1.jpg");
}

.sub_button {
	padding: 5px 5px 5px 5px;
	font-size: 24px;
	text-align: center;
	cursor: pointer;
	outline: none;
	color: #fff;
	background-color: red;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
	width: 150px;
	height: 40px;
}

.sub_button:hover {
	background-color: orange
}

.sub_button:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

input[type=text]:focus {
	background-color: #e4cefb;
	border: 5px solid #ff8000;
	border-radius: 4px;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>

	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<br>
	<br>

	<form action="Generate_I_card.jsp" method="post">

		<table align="center">

			<tr>

				<td><input type="text" name="id" required="required"
					placeholder="enter employee id.." /><br /> <br /></td>

			</tr>
			<tr>

				<td><input type="submit" class="sub_button" /></td>

			</tr>
			<tr>

				<td><br> <br> <br></td>
			</tr>
		</table>



	</form>
	<script>


</script>
	<br>
	<br>

</body>
</html>