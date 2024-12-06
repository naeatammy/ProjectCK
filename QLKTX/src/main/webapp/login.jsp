<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f8ff; /* Màu nền nhẹ */
	color: #333;
	margin: 0;
	padding: 20px;
}

form {
	max-width: 400px; /* Đặt chiều rộng tối đa cho form */
	margin: auto; /* Căn giữa form */
	margin-top: 20vh;
	padding: 20px;
	border: 1px solid #add8e6; /* Viền màu xanh dương nhạt */
	border-radius: 8px; /* Bo góc cho viền */
	background-color: #e6f7ff; /* Màu nền cho form */
}

h3 {
	text-align: center;
	color: black; /* Màu tiêu đề */
}

table {
	width: 100%; /* Đặt chiều rộng của bảng là 100% */
	border-collapse: collapse; /* Gộp các viền bảng */
}

th {
	text-align: left;
	padding: 10px;
}

input[type="text"], input[type="password"] {
	width: 100%; /* Đặt chiều rộng của input là 100% */
	padding: 10px;
	margin: 5px 0px 10px 0; /* Khoảng cách giữa các input */
	border: 1px solid #add8e6; /* Viền màu xanh dương nhạt */
	border-radius: 4px; /* Bo góc cho input */
}

.button-container {
	display: flex; /* Sử dụng flexbox để căn chỉnh các nút */
	justify-content: center; /* Căn giữa các nút */
	margin-top: 10px; /* Khoảng cách trên cùng của container */
}

input[type="button"] {
	background-color: #add8e6; /* Màu nền cho nút */
	color: white; /* Màu chữ */
	padding: 10px;
	border: none;
	border-radius: 4px; /* Bo góc cho nút */
	cursor: pointer; /* Con trỏ chuột khi hover */
	margin: 0 5px; /* Khoảng cách giữa các nút */
	width: 48%; /* Đặt chiều rộng cho nút */
}

input[type="button"]:hover {
	background-color: #87cefa; /* Màu nền khi hover */
}

@media ( max-width : 600px) {
	form {
		padding: 10px; /* Giảm padding cho màn hình nhỏ */
	}
	input[type="button"] {
		width: 100%; /* Đặt chiều rộng nút là 100% trên màn hình nhỏ */
		margin: 5px 0; /* Khoảng cách giữa các nút */
	}
	.button-container {
		flex-direction: column;
		/* Đặt các nút theo chiều dọc trên màn hình nhỏ */
	}
}
</style>
</head>
<body>
	<form name="login">
		<h3>LOGIN</h3>
		<table>
			<tr>
				<th>Username</th>
				<th><input type="text" id="username" name="username"></th>
			</tr>
			<tr>
				<th>Password</th>
				<th><input type="password" id="password" name="password">
				</th>
			</tr>
		</table>
		<div class="button-container">
			<input type="button" onclick="dangnhap()" value="OK"> <input
				type="button" value="Reset">
		</div>
	</form>
</body>
</html>