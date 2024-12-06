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

        .sidebar {
            /* Giúp sidebar cố định khi cuộn trang */
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
            /* Hiệu ứng mượt mà */
        }

        .sidebar ul li.active {
            background-color: #3ea4c6;
            /* Đổi màu nền khi hover */
            color: white;
            /* Đổi màu chữ khi hover */
        }

        .sidebar ul li:hover {
            background-color: #3ea4c6;
            /* Đổi màu nền khi hover */
            color: white;
            /* Đổi màu chữ khi hover */
        }
    </style>
</head>
<body>
	<div class="sidebar">
        <h3>Admin</h3>
        <ul>
            <li class="active">Quản lý phòng</li>
            <li class="">Quản lý tài khoản</li>
            <li class="">Quản lý hợp đồng</li>
            <li id="logout">Log out</li>
        </ul>
    </div>
</body>
</html>