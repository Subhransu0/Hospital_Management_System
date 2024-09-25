<%@page import="com.sonu.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.sonu.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>

					<c:if test="${not empty passSuccMsg }">
						<p class="text-center text-success fs-3">${passSuccMsg }</p>
						<c:remove var="passSuccMsg" scope="session" />
					</c:if>
					<c:if test="${not empty passMsg }">
						<p class="text-center text-danger fs-3">${passMsg }</p>
						<c:remove var="passMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorchangepassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newpassword" class="form-control" required >
							</div>
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldpassword" class="form-control" required>
							</div>
							<input type="hidden" name="uid" value="${doctorObj.id }">

							<button class="btn btn-success col-md-12">Change
								Password</button>


						</form>
					</div>
				</div>
			</div>


			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-3">Edit Profile</p>
					<c:if test="${not empty succMsgedit }">
						<p class="text-center text-success fs-3">${succMsgedit }</p>
						<c:remove var="succMsgedit" scope="session" />
					</c:if>
					<c:if test="${not empty errorMsgedit }">
						<p class="text-center text-danger fs-3">${errorMsgedit }</p>
						<c:remove var="errorMsgedit" scope="session" />
					</c:if>
				
					<div class="card-body">


						<form action="../editProfileDoctor" method="post">
						<input type="hidden" name="id" value="${doctorObj.id }">

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Full
									Name</label> <input type="text" class="form-control" name="fullname" value="${doctorObj.fullname }"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">DOB
								</label> <input type="date" class="form-control" name="dob" value="${doctorObj.dob }"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Qualification
								</label> <input type="text" class="form-control" name="qualification" value="${doctorObj.qualification }"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3">


								<label>Specialist</label> <select
									class="form-select form-control-lg" id="gender"
									name="specialist" required>
									<option>${doctorObj.specialist }</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConnection());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>

									<option><%=s.getSpecialistname()%></option>

									<%
									}
									%>
								</select>

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control" value="${doctorObj.email }"
									readonly id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Mob
									No </label> <input maxlength="10" type="text" class="form-control" 
									name="mobileno"  value="${doctorObj.mobNo}" >
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>

					</div>
				</div>

			</div>

		</div>
	</div>

</body>
</html>