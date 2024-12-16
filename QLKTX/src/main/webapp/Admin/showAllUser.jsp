<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý tài khoản</title>
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
            gap: 10px;
        }

        .month-container {
            padding: 5px 10px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 14px;
            margin-left: auto;
        }

        .month-selector {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            font-size: 16px;
        }

        .month-selector button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background-color: #3ea4c6;
            color: #fff;
            cursor: pointer;
        }

        .month-selector button:hover {
            background-color: #2b91b0;
        }

        #add-user {
            background-color: #3ea4c6;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 10px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        #add-user:hover {
            background-color: #2b91b0;
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

        .sort-dropdown,
        .search-dropdown {
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

        .user-list::-webkit-scrollbar {
            width: 5px;
            height: 5px;
        }

        .user-list::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 10px;
            border: 2px solid transparent;
        }

        .user-list::-webkit-scrollbar-thumb:hover {
            background-color: #555;
        }

        .user-list::-webkit-scrollbar-track {
            background-color: #f1f1f1;
            border-radius: 10px;
        }

        .user-list::-webkit-scrollbar-button {
            display: none;
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

        th,
        td {
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

        .profile-pic {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }

        .history-btn {
            border: none;
            padding: 8px 12px;
            color: #fff;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .history-btn {
            background-color: #007bff;
        }

        .history-btn:hover {
            background-color: #024996;
        }

        .user-list-container {
            width: 100%;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
        }

        .user-item {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
	<div class="admin-container">
        <div class="main-content">
            <header>
                <h2>DANH SÁCH CÁC TÀI KHOẢN</h2>
                <div class="month-container">
                    <div class="month-selector">
                        <button id="prev-month">Trước</button>
                        <span id="current-month">Tháng 12, 2024</span>
                        <button id="next-month">Sau</button>
                    </div>
                </div>
                <button id="add-user">Thêm tài khoản</button>
            </header>
            <div class="controls-container">
                <div class="search">
                    <input type="text" id="search-input" placeholder="Tìm kiếm trong bảng...">
                </div>
                <div class="search-dropdown">
                    <label for="search-options">Tìm kiếm theo:</label> <select id="search-options">
                        <option value="STT">STT</option>
                        <option value="Tên">Tên</option>
                        <option value="Giới tính">Giới tính</option>
                        <option value="Ngày sinh">Ngày sinh</option>
                        <option value="SĐT">SĐT</option>
                        <option value="CCCD">CCCD</option>
                    </select>
                </div>
                <div class="sort-dropdown">
                    <label for="sort-options">Sắp xếp theo:</label>
                    <select id="sort-options">
                        <option value="STT">STT</option>
                        <option value="Tên">Tên</option>
                        <option value="Giới tính">Giới tính</option>
                        <option value="Ngày sinh">Ngày sinh</option>
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
                            <th>Giới tính</th>
                            <th>Ngày sinh</th>
                            <th>Số điện thoại</th>
                            <th>CCCD</th>
                            <th>Tùy chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nguyễn Đắc Nguyên</td>
                            <td>Tâm</td>
                            <td>Nam</td>
                            <td>03/03/2004</td>
                            <td>0123456789</td>
                            <td>04739384482929</td>
                            <td>
                                <button class="history-btn" data-user-id="1">Xem lịch sử thuê</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Trần Văn</td>
                            <td>An</td>
                            <td>Nam</td>
                            <td>02/02/2004</td>
                            <td>0987654321</td>
                            <td>04836284653822</td>
                            <td>
                                <button class="history-btn" data-user-id="2">Xem lịch sử thuê</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Lê Tôn Thanh</td>
                            <td>An</td>
                            <td>Nam</td>
                            <td>01/01/2004</td>
                            <td>0463625848</td>
                            <td>04846284573920</td>
                            <td>
                                <button class="history-btn" data-user-id="3">Xem lịch sử thuê</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<script>
        const currentMonthElement = document.getElementById('current-month');
        const prevMonthBtn = document.getElementById('prev-month');
        const nextMonthBtn = document.getElementById('next-month');

        let currentDate = new Date();

        const updateMonthDisplay = () => {
            const monthNames = [
                "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
                "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9",
                "Tháng 10", "Tháng 11", "Tháng 12"
            ];
            currentMonthElement.textContent = `${monthNames[currentDate.getMonth()]}, ${currentDate.getFullYear()}`;
        };

        prevMonthBtn.addEventListener('click', () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            updateMonthDisplay();
        });

        nextMonthBtn.addEventListener('click', () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            updateMonthDisplay();
        });

        function setupAddUserButton() {
            const addRoomButton = document.getElementById('add-user');
            addRoomButton.addEventListener('click', () => {
                window.location.href = 'addUser.jsp';
            });
        }

        function setupHistoryButtonListeners() {
            const historyButtons = document.querySelectorAll('.history-btn');

            historyButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const userId = this.getAttribute('data-user-id');

                    window.location.href = `showRoomRentalHistory.jsp?userId=userId`;
                });
            });
        }

        const setupTableSorting = () => {
            const tableBody = document.querySelector('tbody');
            const sortOptions = document.getElementById('sort-options');

            const sortTable = (criteria) => {
                const rows = Array.from(tableBody.rows);

                rows.sort((rowA, rowB) => {
                    const cellA = rowA.querySelector(`td:nth-child(${criteria})`).textContent.trim();
                    const cellB = rowB.querySelector(`td:nth-child(${criteria})`).textContent.trim();

                    return cellA.localeCompare(cellB, undefined, { numeric: true });
                });

                rows.forEach(row => tableBody.appendChild(row));
            };

            const handleSortChange = () => {
                const selectedOption = sortOptions.value;
                const columns = {
                    "STT": 1,
                    "Họ": 2,
                    "Tên": 3,
                    "Giới tính": 4,
                    "Ngày sinh": 5
                };
                sortTable(columns[selectedOption]);
            };

            sortOptions.addEventListener('change', handleSortChange);
        };

        document.addEventListener('DOMContentLoaded', () => {
            setupHistoryButtonListeners();
            setupAddUserButton();
            setupTableSorting();
            updateMonthDisplay();
        });
    </script>
</html>