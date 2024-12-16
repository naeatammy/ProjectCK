<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.bean.*"%>
<%@page import="model.dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chi tiết phòng</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
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

.controls-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	margin: 20px auto;
	max-width: 800px;
	gap: 15px;
}

.month-container {
	flex: 1 1 300px;
	padding: 10px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
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

.sort-dropdown {
	flex: 1 1 200px;
	display: flex;
	align-items: center;
	gap: 10px;
}

#sort-options {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
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
	background-color: #f2f2f2;
}

tbody tr:hover {
	background-color: #f1f1f1;
}

.delete-btn {
	background-color: #dc3545;
	border: none;
	padding: 8px 12px;
	color: #fff;
	font-size: 14px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.delete-btn:hover {
	background-color: #a71d2a;
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
	<h2>CHI TIẾT PHÒNG</h2>
	<div class="form-container">
		<%
			Room room = (Room) request.getAttribute("room");
			String state = (String) request.getAttribute("state");
		%>
		<table>
			<tr>
				<td><label for="sophong">Số Phòng</label></td>
				<td><input type="text" id="sophong" value="<%=room.getRoom_id()%>" disabled></td>
			</tr>
			<tr>
				<td><label for="loaiphong">Loại Phòng</label></td>
				<td><input type="text" id="loaiphong" value="<%=room.getType()%>"
					disabled></td>
			</tr>
			<tr>
				<td><label for="trangthai">Trạng Thái</label></td>
				<td><input type="text" id="trangthai" value="<%=state%>" disabled></td>
			</tr>
		</table>
	</div>
	<div class="controls-container">
		<div class="month-container">
			<div class="month-selector">
				<button id="prev-month">Trước</button>
				<span id="current-month">Tháng 12, 2024</span>
				<button id="next-month">Sau</button>
			</div>
		</div>

		<div class="sort-dropdown">
			<label for="sort-options">Sắp xếp theo:</label> <select
				id="sort-options">
				<option value="userid">Mã người dùng</option>
				<option value="Họ">Họ</option>
				<option value="Tên">Tên</option>
				<option value="Giới tính">Giới tính</option>
				<option value="SĐT">SĐT</option>
				<option value="CCCD">CCCD</option>
			</select>
		</div>
	</div>
	<div class="table-container">
		<table>
			<caption>DANH SÁCH NGƯỜI THUÊ PHÒNG</caption>
			<thead>
				<tr>
					<th>Mã người dùng</th>
					<th>Họ</th>
					<th>Tên</th>
					<th>SĐT</th>
					<th>CCCD</th>
					<th>Tiền phòng</th>
					<th>Điện</th>
					<th>Nước</th>
					<th>Wifi</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList<RoomRecordDTO> recordDtoList = (ArrayList<RoomRecordDTO>) request.getAttribute("recordDtoList");
					for(int i = 0; i < recordDtoList.size(); i++)
					{
				%>
				<tr>
					<td><%=recordDtoList.get(i).getUser_id()%></td>
					<td><%=recordDtoList.get(i).getFirstname()%></td>
					<td><%=recordDtoList.get(i).getLastname()%></td>
					<td><%=recordDtoList.get(i).getPhonenumber()%></td>
					<td><%=recordDtoList.get(i).getCccd()%></td>
					<td>
						<%
							if(recordDtoList.get(i).isRoom())
							{
						%>
							<img src="image/tick.png" alt="yes">
						<%
							}
							else 
							{
						%>
							<img src="image/x.png" alt="no">
						<%
							}
						%>
					</td>
					<td>
						<%
							if(recordDtoList.get(i).isElectric())
							{
						%>
							<img src="image/tick.png" alt="yes">
						<%
							}
							else 
							{
						%>
							<img src="image/x.png" alt="no">
						<%
							}
						%>
					</td>
					<td>
						<%
							if(recordDtoList.get(i).isWater())
							{
						%>
							<img src="image/tick.png" alt="yes">
						<%
							}
							else 
							{
						%>
							<img src="image/x.png" alt="no">
						<%
							}
						%>
					</td>
					<td>
						<%
							if(recordDtoList.get(i).isWifi())
							{
						%>
							<img src="image/tick.png" alt="yes">
						<%
							}
							else 
							{
						%>
							<img src="image/x.png" alt="no">
						<%
							}
						%>
					</td>
					<td><button class="delete-btn">Xóa</button></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
<script>
    const currentMonthElement = document.getElementById('current-month');
    const prevMonthBtn = document.getElementById('prev-month');
    const nextMonthBtn = document.getElementById('next-month');

    let currentDate = new Date();
	
    <%
		String month = (String) request.getAttribute("month");
		String year = (String) request.getAttribute("year");
		if(month != null) {
	%>
		currentDate.setMonth(<%=Integer.parseInt(month) - 1%>);
		currentDate.setFullYear(<%=Integer.parseInt(year)%>)
	<%
		}
	%>
    
    const updateMonthDisplay = () => {
        const monthNames = [
            "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
            "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9",
            "Tháng 10", "Tháng 11", "Tháng 12"
        ];
        currentMonthElement.textContent = monthNames[currentDate.getMonth()] + ", " + currentDate.getFullYear();
    };

    prevMonthBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        window.location.href = "<%= request.getContextPath() %>/RoomController?action=viewdetailroom&roomid=" + "<%=room.getRoom_id()%>" + "&month=" + (currentDate.getMonth() + 1) + "&year=" + currentDate.getFullYear();
    });

    nextMonthBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        window.location.href = "<%= request.getContextPath() %>/RoomController?action=viewdetailroom&roomid=" + "<%=room.getRoom_id()%>" + "&month=" + (currentDate.getMonth() + 1) + "&year=" + currentDate.getFullYear();
    });

    updateMonthDisplay();

    // Xử lý sắp xếp bảng
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

    sortOptions.addEventListener('change', () => {
        const selectedOption = sortOptions.value;
        const columns = {
            "Mã người dùng": 1,
            "Họ": 2,
            "Tên": 3,
            "Giới tính": 4,
            "SĐT": 5,
            "CCCD": 6
        };
        sortTable(columns[selectedOption]);
    });
    function initializePaymentTable() {
        const paymentCells = document.querySelectorAll('tbody td img');
        const originalStates = [];

        function saveOriginalState() {
            originalStates.length = 0;
            paymentCells.forEach(cell => {
                originalStates.push({
                    src: cell.src,
                    alt: cell.alt
                });
            });
        }

        paymentCells.forEach((cell) => {
            cell.addEventListener('click', () => {
                if (cell.alt === 'no') {
                    cell.src = '../image/tick.png';
                    cell.alt = 'yes';
                } else {
                    alert('Bạn không thể thay đổi ô này từ tick xanh sang trạng thái khác!');
                }
            });
        });

        function saveTableState() {
            const updatedStates = paymentCells.map(cell => ({ src: cell.src, alt: cell.alt }));
            console.log('Lưu trạng thái:', updatedStates);
            alert('Trạng thái đã được lưu! (Giả lập - cần thêm logic lưu vào DB)');
        }

        function restoreOriginalState() {
            paymentCells.forEach((cell, index) => {
                cell.src = originalStates[index].src;
                cell.alt = originalStates[index].alt;
            });
            alert('Bảng đã được khôi phục trạng thái ban đầu.');
        }

        const saveButtons = document.querySelectorAll('.save-btn');
        saveButtons.forEach((button) => {
            button.addEventListener('click', saveTableState);
        });

        const cancelButtons = document.querySelectorAll('.cancel-btn');
        cancelButtons.forEach((button) => {
            button.addEventListener('click', restoreOriginalState);
        });


        saveOriginalState();
    }
    initializePaymentTable();
</script>
</html>