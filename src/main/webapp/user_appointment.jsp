<%@page import="com.sonu.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.sonu.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@ include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/building.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-3 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-3">

				<img src="img/doctor2.jpg" height="450px" alt="Doctor Image">

			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>

						<c:if test="${not empty appointSuccMsg }">
							<p class="text-center text-success fs-3">${appointSuccMsg }</p>
							<c:remove var="appointSuccMsg" scope="session" />
						</c:if>

						<c:if test="${not empty appointerrMsg }">
							<p class="text-center text-success fs-3">${appointerrMsg }</p>
							<c:remove var="appointerrMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="add_appoint" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="email" class="form-label">Full Name</label> <input
									type="text" name="fullname" class="form-control" required>
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select
									class="form-select form-control-lg" id="gender" name="gender"
									required>
									<option value="" disabled selected>Select your gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Other">Other</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input
									type="number" name="age" class="form-control" id="age" required>
							</div>

							<div class="col-md-6">
								<label for="date" class="form-label">Appointment Date</label> <input
									type="date" name="appoint_date" class="form-control" required>
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" name="email" class="form-control" required>
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Phone No</label> <input
									type="text" maxlength="10" name="phoneno" class="form-control"
									required>
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Diseases</label> <input
									type="text" name="diseases" class="form-control" required>
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Doctor</label> <select
									class="form-select form-control-lg" name="doctor" required>
									<option value="" disabled selected>Choose Doctor</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConnection());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullname()%>(<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label">Full Address</label>
								<textarea name="address" class="form-control" required> </textarea>
							</div>

							<c:if test="${empty userObj  }">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button type="submit" class="btn btn-primary">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
