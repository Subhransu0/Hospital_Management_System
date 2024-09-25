<%@page import="com.sonu.entity.Doctor"%>
<%@page import="com.sonu.dao.DoctorDao"%>
<%@page import="com.sonu.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.sonu.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						

						<form action="../registerDoctor" method="post">

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Full
									Name</label> <input type="text" class="form-control" name="fullname"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">DOB
								</label> <input type="date" class="form-control" name="dob"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Qualification
								</label> <input type="text" class="form-control" name="qualification"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3">
							
							
							<label>Specialist</label> <select
									class="form-select form-control-lg" id="gender" name="specialist"
									required>
									<option value="" disabled selected>Select Specialist</option>
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
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Mob
									No </label> <input maxlength="10" type="text" class="form-control" name="mobileno"
									id="exampleInputPassword1">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password
								</label> <input type="password" class="form-control" name="password"
									id="exampleInputPassword1">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>


					</div>
				</div>
			</div>

			<div class="col-md-8">

				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty succMsg }">
							<p class="fs-3 text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty delesuccMsg }">
							<p class="fs-3 text-center text-success">${delesuccMsg }</p>
							<c:remove var="delesuccMsg" scope="session" />
						</c:if>

						<c:if test="${not empty deleerrMsg }">
							<p class="fs-3 text-center text-danger">${deleerrMsg }</p>
							<c:remove var="deleerrMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob no</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								DoctorDao doctordao = new DoctorDao(DBConnect.getConnection());
								List<Doctor> doc = doctordao.getAllDoctor();
								for (Doctor d : doc) {
								%>
								<tr>
									<td><%=d.getFullname()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../deleteDoctor?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>