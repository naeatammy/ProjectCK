<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.bean.*"%>
<%@page import="model.dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử thuê phòng</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
}

.back-button {
	position: absolute;
	width: 48%;
	padding: 10px;
	top: 20px;
	left: 10px;
	font-size: 1rem;
	width: 10vw !important;
	color: white;
	background-color: #3ea4c6;
	border-radius: 5px;
	text-decoration: none;
	display: inline-block;
	box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease;
}

.back-button:hover {
	background-color: #2a6c81;
}

h2 {
	text-align: center;
	margin: 20px 0;
	color: #3ea4c6;
}

.form-container {
	margin: 20px auto;
	max-width: 500px;
	padding: 15px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-container table {
	width: 100%;
}

.form-container td {
	padding: 10px;
	vertical-align: middle;
}

input[type="text"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #f2f2f2;
}

.table-container {
	margin: 20px auto;
	overflow-x: auto;
	max-width: 90%;
}

table {
	border-collapse: collapse;
	width: 100%;
	background-color: #fff;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table caption {
	font-size: 18px;
	font-weight: bold;
	margin: 10px 0;
	color: #3ea4c6;
}

table thead {
	background-color: #3ea4c6;
	color: #fff;
}

th, td {
	border: 1px solid #ddd;
	text-align: center;
	padding: 10px;
}

tbody tr:nth-child(even) {
	background-color: #f7f7f7;
}

tbody tr:hover {
	background-color: #dfdfdf;
}

.extend-btn {
	border: none;
	padding: 8px 12px;
	color: #fff;
	font-size: 14px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.extend-btn {
	background-color: rgb(2, 193, 2);
}

.extend-btn:hover {
	background-color: rgb(4, 82, 4);
}

img {
	width: 20px;
	height: 20px;
	object-fit: contain;
}

@media ( max-width : 768px) {
	table {
		display: block;
		width: 100%;
		overflow-x: auto;
	}
	th, td {
		font-size: 12px;
		padding: 8px;
	}
	h2 {
		font-size: 20px;
	}
	input[type="text"] {
		font-size: 14px;
		padding: 6px;
	}
	.delete-btn {
		font-size: 12px;
		padding: 5px 10px;
	}
}

@media ( max-width : 480px) {
	th, td {
		font-size: 10px;
		padding: 6px;
	}
	h2 {
		font-size: 18px;
	}
}
</style>
</head>
<body>
	<a href="<%= request.getContextPath() %>/UserController?action=viewalluser" class="back-button">← Back</a>
	<h2>LỊCH SỬ THUÊ PHÒNG</h2>
	<div class="form-container">
		<table>
			<tr>
				<td><label for="hoten">Họ tên</label></td>
				<td><input type="text" id="hoten" name="hoten"
					value="Lê Tôn Thanh An" disabled></td>
			</tr>
			<tr>
				<td><label for="ngaysinh">Ngày sinh</label></td>
				<td><input type="text" id="ngaysinh" name="ngaysinh"
					value="01/01/2004" disabled></td>
			</tr>
			<tr>
				<td><label for="sdt">SĐT</label></td>
				<td><input type="text" id="sdt" name="sdt" value="0463625848"
					disabled></td>
			</tr>
			<tr>
				<td><label for="cccd">CCCD</label></td>
				<td><input type="text" id="cccd" name="cccd"
					value="04846284573920" disabled></td>
			</tr>
		</table>
	</div>
	<div class="table-container">
		<table>
			<caption>DANH SÁCH CÁC HỢP ĐỒNG</caption>
			<thead>
				<tr>
					<th>Mã hợp đồng</th>
					<th>Từ</th>
					<th>Đến</th>
					<th>Thời gian</th>
					<th>Phòng</th>
					<th>Trạng thái</th>
					<th>Tùy chọn</th>
				</tr>
			</thead>
			<tbody>
			<%
				ArrayList<Contract> contractList = (ArrayList<Contract>) request.getAttribute("contractList");
				for(Contract contract : contractList)
				{
			%>
				<tr>
					<td><%=contract.getUser_id()%></td>
					<td><%=contract.getStart()%></td>
					<td><%=contract.getEnd()%></td>
					<td><%=contract.getDuration()%> tháng</td>
					<td><%=contract.getRoom_id()%></td>
					<td><%=contract.getState()%></td>
					<td>
						<button class="extend-btn">Gia hạn</button>
					</td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</body>
<script>
function addExtendButtonHandlers() {
    const extendButtons = document.querySelectorAll('.extend-btn');

    extendButtons.forEach((button, index) => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const room = row.cells[4].textContent.trim();
            const fromDate = row.cells[1].textContent.trim();
            const toDate = row.cells[2].textContent.trim();

            const url = `contractExtension.jsp`;
            window.location.href = url;
        });
    });
}

document.addEventListener('DOMContentLoaded', addExtendButtonHandlers);
</script>
</html>