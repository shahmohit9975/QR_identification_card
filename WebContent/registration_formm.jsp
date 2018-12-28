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

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 90%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 40px;
	display: inline-block;
}

input[type=submit] {
	background-color: blue;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: red;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
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
	<div class="container">
		<form action="QR_code_generate" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col-25">
					<label for="fname">ID</label>
				</div>
				<div class="col-75">
					<input type="text" name="id">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="lname">Name</label>
				</div>
				<div class="col-75">
					<input type="text" name="name">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="country">Blood Group</label>
				</div>
				<div class="col-75">
					<select name="blood_group">
						<option value="AB+">AB+</option>
						<option value="B+">B+</option>
						<option value="O+">O+</option>
						<option value="AB-">AB-</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="country">Department</label>
				</div>
				<div class="col-75">
					<select name="department">
						<option value="Accounting">Accounting</option>
						<option value="Management">Management</option>
						<option value="Marketing">Marketing</option>
						<option value="Finance">Finance</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="country">Uplode your Photo :</label>
				</div>
				<div class="col-75">
					<br>
					<br>
					<br> <input type="file" name="photo">
				</div>
			</div>
			<br>
			<div class="row" style="padding: 12px 100px 12px 40px;">
				<input type="submit" value="Submit">

			</div>
		</form>
		<br> <br>

	</div>

</body>
</html>