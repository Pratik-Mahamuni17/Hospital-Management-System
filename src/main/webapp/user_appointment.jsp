<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style>
body {
	background-color: #f4f7f9;
}

.main-container {
	padding-top: 50px;
	padding-bottom: 50px;
}

.appointment-card {
	border: none;
	border-radius: 16px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 30px;
	background-color: #ffffff;
}

.appointment-card h3 {
	font-weight: 600;
	margin-bottom: 20px;
	color: #333;
	text-align: center;
}

.form-control:focus {
	box-shadow: none;
	border-color: #28a745;
}

.btn-green {
	background-color: #28a745;
	color: white;
	transition: 0.3s;
}

.btn-green:hover {
	background-color: #218838;
}

.alert-msg {
	font-size: 16px;
	font-weight: 500;
	text-align: center;
	margin-bottom: 15px;
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>

	<div class="container main-container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-lg-8">
				<div class="appointment-card">
					<h3>User Appointment</h3>

					<c:if test="${not empty errorMsg}">
						<p class="alert-msg text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<c:if test="${not empty succMsg}">
						<p class="alert-msg text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<form class="row g-3" action="add_appointment" method="post">
						<input type="hidden" name="userId" value="${userObj.id}">

						<div class="col-md-6">
							<label class="form-label">Full Name</label> <input required
								type="text" class="form-control" name="fullName">
						</div>

						<div class="col-md-6">
							<label class="form-label">Gender</label> <select
								class="form-control" name="gender" required>
								<option value="">-- Select --</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>

						<div class="col-md-6">
							<label class="form-label">Age</label> <input required
								type="number" class="form-control" name="age">
						</div>

						<div class="col-md-6">
							<label class="form-label">Appointment Date</label> <input
								type="date" class="form-control" required name="appoint_date">
						</div>

						<div class="col-md-6">
							<label class="form-label">Email</label> <input required
								type="email" class="form-control" name="email">
						</div>

						<div class="col-md-6">
							<label class="form-label">Phone No</label> <input maxlength="10"
								required type="number" class="form-control" name="phno">
						</div>

						<div class="col-md-6">
							<label class="form-label">Diseases</label> <input required
								type="text" class="form-control" name="diseases">
						</div>

						<div class="col-md-6">
							<label class="form-label">Doctor</label> <select required
								class="form-control" name="doct">
								<option value="">-- Select Doctor --</option>

								<%
								DoctorDao dao = new DoctorDao(DBConnect.getConn());
								List<Doctor> list = dao.getAllDoctor();
								for (Doctor d : list) {
								%>
								<option value="<%=d.getId()%>">
									<%=d.getFullName()%> (<%=d.getSpecialist()%>)
								</option>
								<%
								}
								%>
							</select>
						</div>


						<div class="col-md-12">
							<label class="form-label">Full Address</label>
							<textarea required name="address" class="form-control" rows="3"></textarea>
						</div>

						<div class="col-md-12 text-center">
							<c:if test="${empty userObj}">
								<a href="user_login.jsp" class="btn btn-success px-4">Submit</a>
							</c:if>

							<c:if test="${not empty userObj}">
								<button class="btn btn-success px-4">Submit</button>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
