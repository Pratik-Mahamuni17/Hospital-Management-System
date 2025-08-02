<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.dao.DoctorDao"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<title>Appointment List</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
body {
	background-color: #f8f9fa;
}

.paint-card {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	transition: 0.3s ease-in-out;
}

.paint-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
}

.back-header {
	background: linear-gradient(to right, #36d1dc, #5b86e5);
	color: white;
	padding: 25px;
	border-radius: 15px;
	text-align: center;
	margin-top: 30px;
	font-size: 28px;
	font-weight: bold;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.1);
}

.table {
	border-radius: 10px;
	overflow: hidden;
}

.table thead {
	background-color: #198754;
	color: white;
}

.table tbody tr:hover {
	background-color: #e9f7ef;
	transition: 0.2s;
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
}
</style>
</head>
<body>


	

	<%@include file="component/navbar.jsp"%>

	<div class="container">
		<!-- Stylish Header -->
		<div class="back-header">Appointment List</div>

		<!-- Card for Table -->
		<div class="card paint-card mt-4 mb-5">
			<div class="card-body">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Full Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Appointment Date</th>
							<th>Diseases</th>
							<th>Doctor Name</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						User user = (User) session.getAttribute("userObj");
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());

						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>
						<tr>
							<td><%=ap.getFullName()%></td>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppointmentDate()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td>
								<%
								if ("Pending".equals(ap.getStatus())) {
								%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%> <%
 }
 %>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
