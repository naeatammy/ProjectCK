<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<title>Quản lý hợp đồng</title>
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
	width: 200px;
	height: 100vh;
	background-color: #f4f4f4;
	padding: 20px;
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

.main-content {
	flex-grow: 1;
	padding: 20px;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px;
}

.controls-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.search {
	display: flex;
	flex: 1;
	justify-content: center;
	margin-right: 10px;
}

.search input {
	width: 50%;
	max-width: 600px;
	padding: 10px;
	border: 2px solid #3ea4c6;
	border-radius: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	transition: box-shadow 0.3s ease, border-color 0.3s ease;
}

.search input:focus {
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	border-color: #2b91b0;
	outline: none;
}

.sort-dropdown, .search-dropdow {
	display: flex;
	align-items: center;
}

.sort-dropdown select {
	padding: 5px;
	border-radius: 4px;
	border: 1px solid #ddd;
}

.search-dropdown select {
	margin-right: 2vw;
	margin-left: 5px;
	padding: 5px;
	border-radius: 4px;
	border: 1px solid #ddd;
}

.user-list {
	margin-top: 20px;
	max-height: 75vh;
	overflow-y: auto;
	border: 1px solid #ddd;
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

.accept-btn, .extend-btn, .delete-btn {
	border: none;
	padding: 8px 12px;
	color: #fff;
	font-size: 14px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.accept-btn {
	background-color: rgb(243, 158, 1);
}

.extend-btn {
	background-color: rgb(2, 193, 2);
}

.delete-btn {
	background-color: #dc3545;
}

.accept-btn:hover {
	background-color: rgb(198, 130, 3);
}

.extend-btn:hover {
	background-color: rgb(4, 82, 4);
}

.delete-btn:hover {
	background-color: #a71d2a;
}
</style>
</head>
<body>
	<div class="admin-container">
		<div class="main-content">
			<header>
				<h2>DANH SÁCH CÁC HỢP ĐỒNG</h2>
			</header>
			<div class="controls-container">
				<div class="search">
					<input type="text" id="search-input"
						placeholder="Tìm kiếm trong bảng...">
				</div>
				<div class="search-dropdown">
					<label for="search-options">Tìm kiếm theo:</label> <select
						id="search-options">
						<option value="Số phòng">Số phòng</option>
						<option value="Loại phòng">Loại phòng</option>
						<option value="Sức chứa">Sức chứa</option>
						<option value="Giá">Giá</option>
					</select>
				</div>
				<div class="sort-dropdown">
					<label for="sort-options">Sắp xếp theo:</label> <select
						id="sort-options">
						<option value="Số phòng">Số phòng</option>
						<option value="Loại phòng">Loại phòng</option>
						<option value="Sức chứa">Sức chứa</option>
						<option value="Trạng thái">Trạng thái</option>
						<option value="Giá">Giá</option>
					</select>
				</div>
			</div>
			<div class="user-list">
				<table>
					<thead>
						<tr>
							<th>STT</th>
							<th>Họ</th>
							<th>Tên</th>
							<th>Phòng</th>
							<th>Thời gian</th>
							<th>Từ</th>
							<th>Đến</th>
							<th>Trạng thái</th>
							<th>Tùy chọn</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Nguyễn Đắc Nguyên</td>
							<td>Tâm</td>
							<td>A101</td>
							<td>6 tháng</td>
							<td>01/12/2024</td>
							<td>31/05/2025</td>
							<td>Chờ phê duyệt</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>Trần Văn</td>
							<td>An</td>
							<td>A101</td>
							<td>3 tháng</td>
							<td>01/11/2024</td>
							<td>31/01/2025</td>
							<td>Đang thuê</td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td>Lê Tôn Thanh</td>
							<td>An</td>
							<td>A202</td>
							<td>3 tháng</td>
							<td>01/03/2024</td>
							<td>31/05/2024</td>
							<td>Hết hạn</td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td>Lê Tôn Thanh</td>
							<td>An</td>
							<td>A202</td>
							<td>3 tháng</td>
							<td>28/02/2024</td>
							<td>01/12/2023</td>
							<td>Hết hạn</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
        function addRowClickListener() {
            const tableRows = document.querySelectorAll('tbody tr');

            tableRows.forEach(row => {
                row.addEventListener('click', (event) => {
                    const isButton = event.target.closest('button');
                    if (!isButton) {
                        const roomNumber = row.cells[0].textContent.trim();

                        window.location.href = `showOneContract.jsp`;
                    }
                });
            });
        }
        function addButtonsBasedOnStatus() {
            const rows = document.querySelectorAll('tbody tr');

            rows.forEach(row => {
                const statusCell = row.cells[7];
                const optionsCell = row.cells[8]; 
                const status = statusCell.textContent.trim(); 

                optionsCell.innerHTML = '';

                if (status === 'Chờ phê duyệt') {
                    const acceptBtn = document.createElement('button');
                    acceptBtn.textContent = 'Phê duyệt';
                    acceptBtn.className = 'accept-btn';
                    acceptBtn.style.marginRight = "5px"

                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Xóa';
                    deleteBtn.className = 'delete-btn';

                    optionsCell.appendChild(acceptBtn);
                    optionsCell.appendChild(deleteBtn);
                } else {
                    const extendBtn = document.createElement('button');
                    extendBtn.textContent = 'Gia hạn';
                    extendBtn.className = 'extend-btn';
                    extendBtn.style.marginRight = "5px";

                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Xóa';
                    deleteBtn.className = 'delete-btn';

                    optionsCell.appendChild(extendBtn);
                    optionsCell.appendChild(deleteBtn);
                }
            });
        }

        document.addEventListener('DOMContentLoaded', () => {
            addButtonsBasedOnStatus(),
            addRowClickListener()
        });
    </script>
</html>