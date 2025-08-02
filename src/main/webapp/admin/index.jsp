<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style>
	body {
		background-color: #f8f9fa;
	}
	.card {
		border-radius: 12px;
		transition: transform 0.2s ease, box-shadow 0.2s ease;
	}
	.card:hover {
		transform: translateY(-4px);
		box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
	}
	.card-body i {
		color: #198754;
	}
	.card-body h5 {
		font-weight: 600;
		margin-top: 10px;
	}
	.card-body h4 {
		font-weight: bold;
	}
	.btn-success {
		background-color: #198754;
	}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<!-- Session check -->
	<c:if test="${ empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-4">
		<p class="text-center fs-3 fw-semibold mb-4">Admin Dashboard</p>

		<!-- Alert Messages -->
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger text-center" role="alert">${errorMsg}</div>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<c:if test="${not empty succMsg}">
			<div class="alert alert-success text-center" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<% DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>
		<div class="row g-4">

			<!-- Doctor Card -->
			<div class="col-md-4">
				<div class="card shadow h-100">
					<div class="card-body text-center">
						<i class="fas fa-user-md fa-3x mb-2"></i>
						<h5>Doctor</h5>
						<h4><%= dao.countDoctor() %></h4>
					</div>
				</div>
			</div>

			

			<!-- User Card -->
			<div class="col-md-4">
				<div class="card shadow h-100">
					<div class="card-body text-center">
						<i class="fas fa-users fa-3x mb-2"></i>
						<h5>User</h5>
						<h4><%= dao.countUser() %></h4>
					</div>
				</div>
			</div>

			<!-- Appointments Card -->
			<div class="col-md-4">
				<div class="card shadow h-100">
					<div class="card-body text-center">
						<i class="fas fa-calendar-check fa-3x mb-2"></i>
						<h5>Appointments</h5>
						<h4><%= dao.countAppointment() %></h4>
					</div>
				</div>
			</div>

			<!-- Specialist Card -->
			<div class="col-md-4">
				<div class="card shadow h-100 d-flex flex-column justify-content-between">
					<div class="card-body text-center">
						<i class="fas fa-stethoscope fa-3x mb-2"></i>
						<h5>Specialist</h5>
						<h4><%= dao.countSpecialist() %></h4>
						<button type="button" class="btn btn-success mt-3"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							Add Specialist</button>
					</div>
				</div>
			</div>

		</div>

		<!-- Add Specialist Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content rounded-3">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Add New Specialist</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="../addSpecialist" method="post">
							<div class="form-group mb-3">
								<label>Enter Specialist Name</label> 
								<input type="text" name="specName" class="form-control" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
