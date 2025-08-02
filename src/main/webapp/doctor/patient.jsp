<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
<%@include file="../component/allcss.jsp"%>

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

	<c:if test="${empty docObj}">
		<c:redirect url="../doctor_Login.jsp" />
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container">
		<!-- Stylish Header -->
		<div class="back-header">Patient Details</div>

		<!-- Card for Table -->
		<div class="card paint-card mt-4 mb-5">
			<div class="card-body">

				<c:if test="${not empty errorMsg}">
					<p class="fs-4 text-center text-danger">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<c:if test="${not empty succMsg}">
					<p class="fs-4 text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Full Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Appointment Date</th>
							<th>Email</th>
							<th>Mob No</th>
							<th>Diseases</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						Doctor d = (Doctor) session.getAttribute("docObj");
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
						for (Appointment ap : list) {
						%>
						<tr>
							<td><%=ap.getFullName()%></td>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppointmentDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td>
								<%
								if ("Pending".equals(ap.getStatus())) {
								%> <span class="badge bg-warning text-dark">Pending</span> <%
 } else {
 %> <span class="badge bg-success"><%=ap.getStatus()%></span> <%
 }
 %>
							</td>
							<td>
								<%
								if ("Pending".equals(ap.getStatus())) {
								%> <a
								href="comment.jsp?id=<%=ap.getId()%>"
								class="btn btn-success btn-sm">Comment</a> <%
 } else {
 %>
								<button class="btn btn-secondary btn-sm" disabled>Commented</button>
								<%
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
