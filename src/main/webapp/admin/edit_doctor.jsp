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
	<title>Edit Doctor</title>
	<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card paint-card shadow-lg">
					<div class="card-body">
						<h3 class="text-center mb-4">Edit Doctor Details</h3>

						<c:if test="${not empty errorMsg}">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="fs-5 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
							int id = Integer.parseInt(request.getParameter("id"));
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							Doctor d = dao2.getDoctorById(id);
						%>

						<form action="../updateDoctor" method="post">
							<input type="hidden" name="id" value="<%=d.getId()%>">

							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" name="fullName" class="form-control" required 
									   placeholder="Enter full name" value="<%=d.getFullName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" name="dob" class="form-control" required value="<%=d.getDob()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" name="qualification" class="form-control" required
									   placeholder="Enter qualification" value="<%=d.getQualification()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="specialist" class="form-control" required>
									<option value="">-- Select Specialist --</option>
									<%
										SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
										List<Specialist> list = dao.getAllSpecialist();
										for (Specialist s : list) {
											String selected = s.getSpecialistName().equals(d.getSpecialist()) ? "selected" : "";
									%>
										<option value="<%=s.getSpecialistName()%>" <%=selected%>>
											<%=s.getSpecialistName()%>
										</option>
									<% } %>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="email" name="email" class="form-control" required
									   placeholder="Enter email address" value="<%=d.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label>
								<input type="text" name="mobno" class="form-control" required
									   pattern="^[0-9]{10}$" title="Enter 10 digit mobile number"
									   placeholder="Enter mobile number" value="<%=d.getMobNo()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="password" name="password" class="form-control" required
									   placeholder="Enter password" value="<%=d.getPassword()%>">
							</div>

							<button type="submit" class="btn btn-primary w-100">Update Doctor</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
