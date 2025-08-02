<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@include file="../component/allcss.jsp"%>
<title>Edit Profile</title>

<!-- Session Validation -->
<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp" />
</c:if>

<%@include file="navbar.jsp"%>

<style>
.paint-card {
	box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
	border-radius: 20px;
	transition: all 0.3s ease-in-out;
	padding: 25px;
}
.paint-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
}
label {
	font-weight: 500;
	margin-bottom: 6px;
}
.form-control, .form-select {
	border-radius: 10px;
	padding: 10px;
}
.btn-primary {
	border-radius: 10px;
	font-weight: bold;
}
.header-title {
	font-size: 30px;
	font-weight: 700;
	color: #0d6efd;
	margin-bottom: 25px;
	text-align: center;
}
</style>

<div class="container p-4">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body">
					<div class="header-title">Edit Profile</div>

					<!-- Success Message -->
					<c:if test="${not empty succMsg}">
						<p class="text-center text-success fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<!-- Error Message -->
					<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<form action="../doctorUpdateProfile" method="post">
						<div class="mb-3">
							<label>Full Name</label>
							<input type="text" name="fullName" required class="form-control" value="${docObj.fullName}">
						</div>

						<div class="mb-3">
							<label>Date of Birth</label>
							<input type="date" name="dob" required class="form-control" value="${docObj.dob}">
						</div>

						<div class="mb-3">
							<label>Qualification</label>
							<input name="qualification" required class="form-control" value="${docObj.qualification}">
						</div>

						<div class="mb-3">
							<label>Specialist</label>
							<select name="specialist" class="form-select" required>
								<option value="">-- Select Specialist --</option>
								<%
								SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
								List<Specialist> list = dao.getAllSpecialist();
								Doctor doc = (Doctor) session.getAttribute("docObj");
								for (Specialist s : list) {
									String selected = "";
									if (s.getSpecialistName().equals(doc.getSpecialist())) {
										selected = "selected";
									}
								%>
								<option value="<%=s.getSpecialistName()%>" <%=selected%>><%=s.getSpecialistName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="mb-3">
							<label>Email</label>
							<input type="email" name="email" required readonly class="form-control" value="${docObj.email}">
						</div>

						<div class="mb-3">
							<label>Mobile Number</label>
							<input type="text" name="mobno" required class="form-control" value="${docObj.mobNo}">
						</div>

						<div class="mb-3">
							<label>New Password</label>
							<input type="password" name="password" class="form-control" placeholder="Enter new password" value="${docObj.password}" required>
						</div>
						<input type= "hidden" name="id" value="${docObj.id}">
						<div class="text-center mt-4">
							<button type="submit" class="btn btn-primary px-5 py-2">Update Profile</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>
