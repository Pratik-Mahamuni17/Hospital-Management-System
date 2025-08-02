<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
body {
	background-color: #ffffff;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.paint-card {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	border-radius: 12px;
	background-color: #fff;
	padding: 30px;
	margin-top: 80px;
}

.form-control {
	border-radius: 8px;
	padding: 10px;
}

.btn-success {
	border-radius: 8px;
	font-weight: 600;
	padding: 10px;
}

.fs-3 {
	font-size: 1.5rem;
	font-weight: 600;
	color: #343a40;
}

label {
	font-weight: 500;
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>

	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp" />
	</c:if>


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-5">
				<div class="paint-card">
					<p class="text-center fs-3 mb-4">Change Password</p>

					<c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${succMsg}</div>
						<c:remove var="succMsg" />
					</c:if>

					<c:if test="${not empty errorMsg}">
						<div class="alert alert-danger" role="alert">${errorMsg}</div>
						<c:remove var="errorMsg" />
					</c:if>

					<form action="changePassword" method="post">
						<div class="mb-3">
							<label for="oldPassword">Enter Old Password</label> <input
								type="password" id="oldPassword" name="oldPassword"
								class="form-control" required />
						</div>

						<div class="mb-4">
							<label for="newPassword">Enter New Password</label> <input
								type="password" id="newPassword" name="newPassword"
								class="form-control" required />
						</div>

						<button type="submit" class="btn btn-success w-100">Change
							Password</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
