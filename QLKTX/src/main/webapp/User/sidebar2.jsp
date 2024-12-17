<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thuê Phòng</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow-y: hidden;
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
	transition: background-color 0.3s, color 0.3s;
}

.sidebar ul li.active {
	background-color: #3ea4c6;
	color: white;
}

.sidebar ul li:hover {
	background-color: #3ea4c6;
	color: white;
}

a {
	text-decoration: none;
	color: inherit;
}
</style>
</head>
<body>
	<div class="sidebar">
		<h3>Xin chào @anle0409 !</h3>
		<ul>
			<li class="active" data-page="rentRoom.jsp">Thuê phòng</li>
			<li data-page="showRoomRentalHistoryOfUser.jsp">Xem lịch sử
				thuê phòng</li>
			<li data-page="editUserInformation.jsp">Thông tin cá nhân</li>
			<li id="logout">Đăng xuất</li>
		</ul>
	</div>
</body>
<script>
        window.addEventListener('load', function () {
            const sidebarItems = document.querySelectorAll(".sidebar ul li");

            sidebarItems.forEach((item) => {
                item.addEventListener("click", function () {
                    sidebarItems.forEach((el) => el.classList.remove("active"));
                    this.classList.add("active");

                    if (this.id !== "logout") {
                        const page = this.getAttribute("data-page");
                        const contentFrame = window.top.frames['content'];

                        if (contentFrame) {
                            contentFrame.location.href = page;
                        } else {
                            console.error('Iframe content not found!');
                        }
                    } else {
                        window.top.location.href = "./login.jsp";
                        window.top.history.replaceState(null, null, "./login.jsp");
                    }
                });
            });
        });

    </script>
</html>