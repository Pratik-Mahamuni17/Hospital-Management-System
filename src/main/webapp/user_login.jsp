<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@ include file="component/allcss.jsp"%>
<style>
html, body {
	height: 100%;
	margin: 0;
}

.main-wrapper {
	min-height: 100%;
	display: flex;
	flex-direction: column;
}

.content {
	flex: 1;
}

.paint-card {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="main-wrapper">
		<%@ include file="component/navbar.jsp"%>

		<div class="content">
			<div class="container p-5">
				<div class="row">
					<div class="col-md-4 offset-md-4">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4 text-center">User Login</p>
								
								<c:if test="${not empty succMsg}">
									<p class="text-center text-success fs-3">${succMsg}</p>
									<c:remove var="succMsg" scope="session" />
								</c:if>

								<c:if test="${not empty errorMsg}">
									<p class="text-center text-danger fs-3">${errorMsg}</p>
									<c:remove var="errorMsg" scope="session" />
								</c:if>
								
								<form action="userLogin" method="post">
									<div class="mb-3">
										<label class="form-label">Email address</label> <input
											required name="email" type="email" class="form-control" />
									</div>
									<div class="mb-3">
										<label class="form-label">Password</label> <input required
											name="password" type="password" class="form-control" />
									</div>
									<button type="submit" class="btn btn-success text-white w-100">
										Login</button>
								</form>
								<br>Don't have an account? <a href="signup.jsp"
									class="text-decoration-none">create one</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		
	</div>
</body>
</html>
