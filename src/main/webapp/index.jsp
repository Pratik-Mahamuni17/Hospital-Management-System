<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.custom-shadow {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border-radius: 8px; /* optional */
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	

	<div class="container mt-3">
		<div id="carouselExampleIndicators"
			class="carousel slide rounded shadow overflow-hidden"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active position-relative">
					<img src="img/doc2.jpg" class="d-block w-100" alt="..."
						style="height: 600px; object-fit: cover;">
					<div
						class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
						<h5>Welcome to Medi Home</h5>
						<p>Your health, our priority.</p>
					</div>
				</div>
				<div class="carousel-item position-relative">
					<img src="img/doc1.avif" class="d-block w-100" alt="..."
						style="height: 600px; object-fit: cover;">
					<div
						class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
						<h5>Experienced Doctors</h5>
						<p>Meet our team of specialists.</p>
					</div>
				</div>
				<div class="carousel-item position-relative">
					<img src="img/doc3.avif" class="d-block w-100" alt="..."
						style="height: 600px; object-fit: cover;">
					<div
						class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
						<h5>Book Your Appointment</h5>
						<p>Fast and easy online booking.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>




	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>

		<div class="row">
			<!-- Left Column: Feature Cards -->
			<div class="col-md-8">
				<div class="row g-3">
					<div class="col-md-6">
						<div class="card shadow h-100">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card shadow h-100">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card shadow h-100">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card shadow h-100">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Right Column: Doctor Image -->
			<div class="col-md-4 d-flex mt-3 mt-md-0">
				<img src="img/doc4.jpg" alt="Doctor"
					class="img-fluid w-100 h-100 rounded shadow object-fit-cover">
			</div>
		</div>
	</div>



	<hr />

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Samuani Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
				        
			</div>


			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
				        
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>				        
			</div>

		</div>
		        
	</div>
	
	

<%@include file="component/footer.jsp"%>	

</body>
</html>