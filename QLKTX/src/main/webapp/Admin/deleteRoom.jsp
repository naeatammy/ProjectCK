<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xóa phòng</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.form-container {
	width: 90%;
	max-width: 700px;
	padding: 20px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.back-button {
	position: absolute;
	top: 20px;
	left: 10px;
	padding: 3px 8px;
	font-size: 0.8rem;
	width: 10vw !important;
	color: white;
	background-color: #3ea4c6;
	border-radius: 5px;
	text-decoration: none;
	box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease;
}

.back-button:hover {
	background-color: #2a6c81;
}

h2 {
	font-size: 1.8rem;
	margin-bottom: 20px;
	color: #3ea4c6;
	text-align: center;
}

table {
	width: 100%;
	margin-bottom: 20px;
	border-spacing: 25px 5px;
}

td {
	padding: 10px;
	font-size: 1rem;
	color: #555;
	vertical-align: auto;
}

input[type="text"], select {
	width: 100%;
	padding: 10px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 5px;
}

input[type="submit"], .back-button {
	width: 48%;
	padding: 10px;
	font-size: 1rem;
	color: white;
	background-color: #3ea4c6;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

input[type="submit"]:hover {
	background-color: #2a6c81;
}

td:last-child {
	text-align: left;
}

td[colspan="2"] {
	text-align: center;
}

label {
	font-size: 1rem;
	color: #333;
}

input[type="text"]:focus, select:focus {
	border-color: #007bff;
	outline: none;
}

@media ( max-width : 600px) {
	h2 {
		font-size: 1.5rem;
	}
	input[type="submit"], .back-button {
		width: 100%;
	}
}
</style>
</head>
<body>
	<a href="showAllRoom.jsp" class="back-button">← Back</a>
    <div class="form-container">
        <h2>Xóa phòng</h2>
        <form action="" method="post" onsubmit="return validateForm()">
            <table>
                <tr>
                    <td><label for="sophong">Số phòng</label></td>
                    <td><input type="text" name="sophong" id="sophong" value="A101" required readonly /></td>
                </tr>
                <tr>
                    <td><label for="loaiphong">Loại phòng</label></td>
                    <td>
                        <select name="loaiphong_display" id="loaiphong" required disabled>
                            <option value="nam" selected>Nam</option>
                            <option value="nu">Nữ</option>
                        </select>
                        <input type="hidden" name="loaiphong" value="nam" />
                    </td>
                </tr>
                <tr>
                    <td><label for="succhua">Sức chứa</label></td>
                    <td>
                        <select name="succhua_display" id="succhua" required disabled>
                            <option value="4" selected>4</option>
                            <option value="6">6</option>
                            <option value="8">8</option>
                        </select>
                        <input type="hidden" name="succhua" value="4" />
                    </td>
                </tr>
                <tr>
                    <td><label for="gia">Giá</label></td>
                    <td><input type="text" name="gia" id="gia" value="500000" required readonly/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Xóa" /></td>
                </tr>
            </table>
        </form>
        
    </div>
</body>
</html>