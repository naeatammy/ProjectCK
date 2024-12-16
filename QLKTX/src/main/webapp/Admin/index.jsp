<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head style="overflow: hidden; height: 100%;">
<meta charset="UTF-8">
<title>QUẢN LÝ KÝ TÚC XÁ</title>
</head>
<body style="margin: 0; padding: 0; overflow: hidden; height: 100%;" onload="getInformation()">
	<div style="display: flex; height: 100vh;">
		<div style="width: 18%; height: 100vh; background-color: #f4f4f4;">
			<iframe name="sidebar" src="sidebar.jsp"
				style="width: 100%; height: 100%; border: none;"></iframe>
		</div>
		<div style="width: 82%; height: 100vh;">
			<iframe name="content" id="content"
				style="width: 100%; height: 100%; border: none;"></iframe>
		</div>
	</div>
</body>
<script type="text/javascript">
	function getInformation() {
		let currentDay = new Date();
		document.getElementById("content").src = "../RoomController?action=viewallroom&month=" + (currentDay.getMonth() + 1) + "&year=" + (currentDay.getFullYear());
	}
</script>
</html>