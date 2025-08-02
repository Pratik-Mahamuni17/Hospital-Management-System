<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>
<%@ include file="../component/allcss.jsp"%>
<style>
.paint-card {
	background: linear-gradient(135deg, #f0f9ff 0%, #cbebff 100%);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	transition: transform 0.3s ease;
}

.paint-card:hover {
	transform: translateY(-5px);
}

.dashboard-title {
	font-size: 2.5rem;
	font-weight: bold;
	color: #343a40;
	text-align: center;
	margin-bottom: 30px;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

.icon-style {
	color: #17a2b8;
}

.text-success {
	color: #28a745 !important;
}
</style>
</head>
<body>

	<!-- Redirect if session is empty -->
	<c:if test="${empty docObj}">
		<c:redirect url="../doctor_login.jsp" />
	</c:if>
	<% 
	Doctor d = (Doctor) session.getAttribute("docObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>
	<%@ include file="navbar.jsp"%>

	<div class="container mt-4">
		<h1 class="dashboard-title">Doctor Dashboard</h1>
	</div>

	<div class="container p-5">
		<div class="row">
			<!-- Doctor Count Card -->
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center">
						<i class="fas fa-user-md fa-3x icon-style"></i><br>
						<p class="fs-4 text-center mt-3">
							Doctor <br> <strong><%= dao.countDoctor() %></strong>
						</p>
					</div>
				</div>
			</div>

			<!-- Appointment Count Card -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<i class="far fa-calendar-check fa-3x icon-style"></i><br>
						<p class="fs-4 text-center mt-3">
							Total Appointment <br> <strong><%= dao.countAppointmentByDoctorId(d.getId()) %></strong>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
