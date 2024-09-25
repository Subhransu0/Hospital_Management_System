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
<title>Edit Doctor Details</title>
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
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty succMsg }">
							<p class="fs-3 text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao3 = new DoctorDao(DBConnect.getConnection());
						Doctor d = dao3.getDoctorById(id);
						%>

						<form action="../updateDoctor" method="post">
						
						<input type="hidden" name="id" value="<%= d.getId() %>">

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Full
									Name</label> <input type="text" class="form-control" name="fullname"
									id="exampleInputPassword1" value="<%= d.getFullname() %>">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">DOB
								</label> <input type="date" class="form-control" name="dob"
									id="exampleInputPassword1" value="<%= d.getDob() %>">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Qualification
								</label> <input type="text" class="form-control" name="qualification"
									id="exampleInputPassword1" value="<%= d.getQualification() %>">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Specialist
								</label> <select name="specialist" required class="form-control">
									<option><%= d.getSpecialist() %></option>
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
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= d.getEmail() %>">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Mob
									No </label> <input type="text" class="form-control" name="mobileno"
									id="exampleInputPassword1" value="<%= d.getMobNo() %>">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password
								</label> <input type="text" class="form-control" name="password"
									id="exampleInputPassword1" value="<%= d.getPassword() %>">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary col-md-12">Update</button>
							</div>
						</form>


					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>