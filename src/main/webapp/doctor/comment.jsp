<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.AppointmentDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Comment</title>

<%@ include file="../component/allcss.jsp"%>

<style>
body {
	background: #f4f6f9;
}

.paint-card {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	margin-top: 50px;
}

.form-floating>label {
	color: #6c757d;
}

.form-label {
	font-weight: 500;
}

.btn-custom {
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
	padding: 10px 30px;
	border-radius: 30px;
	transition: background-color 0.3s ease;
}

.btn-custom:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<!-- Redirect if doctor not logged in -->
	<c:if test="${empty docObj}">
		<c:redirect url="../doctor_Login.jsp"></c:redirect>
	</c:if>

	<%@ include file="navbar.jsp"%>

	<!-- Main Container -->
	<div class="container">
		<div class="col-md-8 offset-md-2">
			<div class="paint-card">
				<h3 class="text-center mb-4">Patient Comment</h3>

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

				Appointment ap = dao.getAppointmentById(id);
				%>



				<form action="../updateStatus" method="post">
					<div class="row g-3">
						<div class="col-md-6">
							<label class="form-label">Patient Name</label> <input type="text"
								class="form-control" name="pname" value="<%=ap.getFullName() %>" required>
						</div>
						<div class="col-md-6">
							<label class="form-label">Age</label> <input type="text"
								class="form-control" name="age" value="<%=ap.getAge() %>" readonly>
						</div>

						<div class="col-md-6">
							<label class="form-label">Mob No</label> <input type="text"
								class="form-control" name="mobile" value="<%=ap.getPhNo() %>" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">Diseases</label> <input type="text"
								class="form-control" name="diseases" value="<%=ap.getDiseases() %>" readonly>
						</div>

						<div class="col-md-12">
							<label class="form-label">Comment</label>
							<textarea name="comm" class="form-control" rows="4" required></textarea>
						</div>

						<!-- Hidden Fields -->
						<input type="hidden" name="id"
							value="<%=ap.getId() %>"">
						<input type="hidden" name="did"
							value="<%=ap.getDoctorId()%>">

						<div class="text-center mt-4">
							<button type="submit" class="btn btn-success">Submit</button>

						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

</body>
</html>
