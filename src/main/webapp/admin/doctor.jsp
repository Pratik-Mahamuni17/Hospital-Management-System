<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Doctor</title>
	<%@include file="../component/allcss.jsp"%>
	<style>
		.paint-card {
			border-radius: 15px;
			box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
		}
	</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container py-4">
		<div class="row justify-content-center">
			<!-- Add Doctor Form -->
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<h4 class="text-center text-primary mb-4">Add New Doctor</h4>

						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger text-center" role="alert">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<div class="alert alert-success text-center" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../add_doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name="fullName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Date of Birth</label>
								<input type="date" required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input required name="qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="specialist" class="form-select" required>
									<option value="">-- Select Specialist --</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
										<option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="email" required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label>
								<input type="text" required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="password" required name="password" class="form-control">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary px-5">Add Doctor</button>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
