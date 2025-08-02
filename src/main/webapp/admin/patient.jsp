<%@ page import="java.util.List"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Patient Details</title>
	<%@include file="../component/allcss.jsp"%>
	<style>
		.paint-card {
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			border-radius: 10px;
			margin-top: 20px;
		}
		.heading {
			background: linear-gradient(to right, #00c6ff, #0072ff);
			color: white;
			padding: 15px;
			border-radius: 10px 10px 0 0;
			font-size: 24px;
			font-weight: bold;
			text-align: center;
		}
		.status-pending {
			background-color: #f0ad4e;
			color: white;
			padding: 5px 10px;
			border-radius: 20px;
			font-size: 14px;
		}
		.status-completed {
			background-color: #5cb85c;
			color: white;
			padding: 5px 10px;
			border-radius: 20px;
			font-size: 14px;
		}
		td, th {
			vertical-align: middle !important;
			word-wrap: break-word;
			max-width: 150px;
		}
	</style>
</head>
<body>

<%@include file="navbar.jsp"%>

<div class="container">
	<div class="card paint-card">
		<div class="heading">Patient Details</div>
		<div class="card-body table-responsive">
			<table class="table table-bordered table-hover text-center align-middle">
				<thead class="table-light">
					<tr>
						<th>Full Name</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Appointment Date</th>
						<th>Email</th>
						<th>Mob No</th>
						<th>Diseases</th>
						<th>Doctor Name</th>
						<th>Address</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
					%>
					<tr>
						<td><%= ap.getFullName() %></td>
						<td><%= ap.getGender() %></td>
						<td><%= ap.getAge() %></td>
						<td><%= ap.getAppointmentDate() %></td>
						<td><%= ap.getEmail() %></td>
						<td><%= ap.getPhNo() %></td>
						<td><%= ap.getDiseases() %></td>
						<td>Dr . Ramesh Patil</td>
						<td><%= ap.getAddress() %></td>
						<td>
							<%
								if ("Pending".equalsIgnoreCase(ap.getStatus())) {
							%>
								<span class="status-pending">Pending</span>
							<%
								} else {
							%>
								<span class="status-completed">Checkup Completed</span>
							<%
								}
							%>
						</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>

</body>
</html>
