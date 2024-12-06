<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow-y: hidden;
}

.admin-container {
	display: flex;
}

.sidebar {
	/* Giúp sidebar cố định khi cuộn trang */
	width: 200px;
	height: 100vh;
	background-color: #f4f4f4;
	padding: 20px
}

.sidebar h3 {
	margin-top: 0;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	padding: 10px;
	cursor: pointer;
}

.sidebar ul li.active {
	background-color: #ddd;
}

.main-content {
	flex-grow: 1;
	padding: 20px;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#add-user {
	background-color: #3ea4c6;
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
}

.user-list {
	margin-top: 20px;
	max-height: 75vh;
	/* Chiều cao cố định cho container */
	overflow-y: auto;
	/* Thêm thanh cuộn dọc */
	border: 1px solid #ddd;
	/* Tùy chọn: thêm viền để phân cách */
}

.user-list::-webkit-scrollbar {
	width: 5px;
	/* Độ rộng của thanh cuộn dọc */
	height: 5px;
	/* Độ cao của thanh cuộn ngang */
}

.user-list::-webkit-scrollbar-thumb {
	background-color: #888;
	/* Màu thanh cuộn */
	border-radius: 10px;
	/* Bo tròn thanh cuộn */
	border: 2px solid transparent;
	/* Tạo khoảng cách để thanh cuộn không dính vào viền */
}

.user-list::-webkit-scrollbar-thumb:hover {
	background-color: #555;
	/* Màu thanh cuộn khi hover */
}

.user-list::-webkit-scrollbar-track {
	background-color: #f1f1f1;
	/* Màu nền của đường dẫn thanh cuộn */
	border-radius: 10px;
	/* Bo tròn phần đường dẫn */
}

/* Loại bỏ các nút mũi tên ở hai đầu của thanh cuộn */
.user-list::-webkit-scrollbar-button {
	display: none;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table tr {
	display: flex;
}

table th, table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	flex: 1;
}

.profile-pic {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}

.edit-btn, .delete-btn, .task-btn {
	background-color: #f0f0f0;
	border: none;
	padding: 5px 10px;
	margin: 0 5px;
	cursor: pointer;
}

.edit-btn {
	color: #007bff;
}

.delete-btn {
	color: #dc3545;
}

.task-btn {
	color: darkorange;
}

.user-list-container {
	width: 100%;
	/* hoặc giá trị phù hợp khác */
	overflow-x: hidden;
	/* Ngăn chặn tràn ngang */
	display: flex;
	flex-direction: column;
	/* Các mục sẽ xếp theo chiều dọc */
}

.user-item {
	width: 100%;
	/* Đảm bảo các mục con không mở rộng ngoài container */
	margin-bottom: 10px;
	/* Khoảng cách giữa các mục */
}

table th {
	position: sticky;
	top: 0;
	background-color: #f4f4f4;
	/* Màu nền của tiêu đề */
	z-index: 1;
	/* Đảm bảo tiêu đề nằm trên các hàng dữ liệu khi cuộn */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	/* Tạo bóng cho tiêu đề */
}
</style>
</head>
<body>
	<div class="admin-container">
		<div class="main-content">
			<header>
				<h2>DANH SÁCH CÁC PHÒNG</h2>
				<input type="date" id="calendar">

				<button id="add-user">Thêm phòng</button>
			</header>
			<div class="user-list">
				<table>
					<thead>
						<tr>
							<th>Số phòng</th>
							<th>Loại phòng</th>
							<th>Sức chứa</th>
							<th>Trạng thái</th>
							<th>Giá</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>A101</td>
							<td>Có điều hòa</td>
							<td>6</td>
							<td>4/6</td>
							<td>700000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>A102</td>
							<td>Không có điều hòa</td>
							<td>4</td>
							<td>Full</td>
							<td>500000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>A103</td>
							<td>Có điều hòa</td>
							<td>4</td>
							<td>3/4</td>
							<td>800000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>A201</td>
							<td>Không điều hòa</td>
							<td>6</td>
							<td>3/6</td>
							<td>500000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>A202</td>
							<td>Không điều hòa</td>
							<td>6</td>
							<td>3/6</td>
							<td>500000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>B101</td>
							<td>Không điều hòa</td>
							<td>6</td>
							<td>3/6</td>
							<td>500000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>B102</td>
							<td>Không điều hòa</td>
							<td>6</td>
							<td>3/6</td>
							<td>500000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>B103</td>
							<td>Không điều hòa</td>
							<td>6</td>
							<td>3/6</td>
							<td>500000</td>
							<td>
								<div class="button-group">
									<button class="edit-btn">Sửa</button>
									<button class="delete-btn">Xóa</button>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>