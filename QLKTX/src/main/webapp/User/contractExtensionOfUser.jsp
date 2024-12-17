<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gia hạn hợp đồng</title>
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
            border-spacing: 25px 10px;
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

        input[type="submit"],
        input[type="reset"],
        .back-button {
            width: 48%;
            padding: 10px;
            font-size: 1rem;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #3ea4c6;
            margin: 0.3vw;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover,
        .back-button:hover {
            background-color: #2a6c81;
        }

        td:last-child {
            text-align: left;
        }

        td[colspan="4"] {
            text-align: center;
        }

        label {
            font-size: 1rem;
            color: #333;
        }

        input[type="text"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        @media (max-width: 600px) {
            h2 {
                font-size: 1.5rem;
            }

            input[type="submit"],
            .back-button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<a href="showRoomRentalHistoryOfUser.jsp" class="back-button">← Back</a>
    <div class="form-container">
        <h2>Gia hạn hợp đồng</h2>
        <form action="" method="">
            <table>
				<tr>
					<td><label for="contractid">Mã hợp đồng</label></td>
					<td colspan="3"><input type="text" name="contractid" id="contractid"
						value="HD026" required readonly/></td>
				</tr>
				<tr>
					<td><label for="ho">Họ</label></td>
					<td><input type="text" name="ho" id="ho"
						value="Lê Tôn Thanh" required readonly /></td>
					<td><label for="ten">Tên</label></td>
					<td><input type="text" name="ten" id="ten"
						value="An" required readonly /></td>
				</tr>
				<tr>
					<td><label for="sdt">Số điện thoại</label></td>
					<td><input type="text" name="sdt" value="0123456789" required
						readonly /></td>
					<td><label for="gioitinh">Giới tính</label></td>
					<td>
                        <select name="gioitinh" id="gioitinh" required disabled>
	                            <option value="Nam" selected>Nam</option>
	                            <option value="Nữ">Nữ</option>
                        </select>
                        <input type="hidden" name="type" value="" />
                    </td>
				</tr>
				<tr>
					<td><label for="month-start">Tháng bắt đầu</label></td>
					<td><input type="text" name="month-start" value="" required
						placeholder="mm/yyyy" /></td>
					<td><label for="cccd">CCCD</label></td>
					<td><input type="text" name="cccd" value="04825374823940"
						required readonly /></td>
				<tr>
					<td><label for="sothang">Số tháng thuê</label></td>
					<td><input type="text" name="sothang" value="" required
						placeholder="Ví dụ: 3" /></td>
					<td><label for="room">Số phòng</label></td>
					<td><input type="text" name="room" value="A202"
						required readonly /></td>
				</tr>
				<tr>
					<td><label for="from">Từ</label></td>
					<td><input type="text" name="from" value="" required readonly /></td>
					<td><label for="to">Đến</label></td>
					<td><input type="text" name="to" value="" required readonly /></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="Gia hạn" /><input
						type="reset" value="Hủy" /></td>
				</tr>
			</table>
        </form>
    </div>
</body>
<script>
    function updateContractDates() {
        const monthStartInput = document.getElementsByName('month-start')[0];
        const durationInput = document.getElementsByName('sothang')[0];
        const fromInput = document.getElementsByName('from')[0];
        const toInput = document.getElementsByName('to')[0];

        const monthStart = monthStartInput.value;
        const duration = parseInt(durationInput.value);

        if (monthStart && !isNaN(duration) && duration > 0) {
            const [month, year] = monthStart.split('/').map(Number);

            const startDate = new Date(year, month - 1, 1);
            const endDate = new Date(year, month - 1 + duration, 0);

            const formatDate = (date) =>
            	String(date.getDate()).padStart(2, '0') + '/' +
            	String(date.getMonth() + 1).padStart(2, '0') + '/' +
            	date.getFullYear();

            fromInput.value = formatDate(startDate);
            toInput.value = formatDate(endDate);
        }
    }

    function validateInputs() {
        const monthStartInput = document.getElementsByName('month-start')[0];
        const durationInput = document.getElementsByName('sothang')[0];

        const monthStart = monthStartInput.value.trim();
        const duration = durationInput.value.trim();

        const monthStartRegex = /^(0[1-9]|1[0-2])\/\d{4}$/;
        if (!monthStartRegex.test(monthStart)) {
            alert("Tháng bắt đầu phải có định dạng mm/yyyy (ví dụ: 09/2024).");
            monthStartInput.focus();
            return false;
        }

        const [inputMonth, inputYear] = monthStart.split('/').map(Number);
        const currentDate = new Date();
        const currentMonth = currentDate.getMonth() + 1;
        const currentYear = currentDate.getFullYear();

        if (inputYear < currentYear || (inputYear === currentYear && inputMonth < currentMonth)) {
            alert("Tháng bắt đầu phải từ tháng hiện tại trở về sau.");
            monthStartInput.focus();
            return false;
        }

        const durationNumber = parseInt(duration, 10);
        if (isNaN(durationNumber) || durationNumber <= 0) {
            alert("Số tháng thuê phải là số nguyên dương (ví dụ: 3).");
            durationInput.focus();
            return false;
        }

        return true;
    }

    document.querySelector('form').addEventListener('submit', function (e) {
        if (!validateInputs()) {
            e.preventDefault();
        }
    });
    document.getElementsByName('month-start')[0].addEventListener('input', updateContractDates);
    document.getElementsByName('sothang')[0].addEventListener('input', updateContractDates);
</script>
</html>