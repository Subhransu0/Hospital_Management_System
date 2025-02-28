<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.sonu.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${ empty adminObj  }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		
		<c:if test="${not empty adminObjerror }">
			<p class="text-center text-danger fs-3">${adminObjerror }</p>
			<c:remove var="adminObjerror" scope="session" />
		</c:if>
		
		<% DoctorDao dao = new DoctorDao(DBConnect.getConnection());
							                       
							%>
		<div class="row">
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4">
							Doctor <br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4">
							User <br> <%=dao.countuser_details() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">
							Total Appointment <br> <%=dao.countAppointment() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2" data-bs-toggle="modal"
				data-bs-target="#exampleModal">

				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">
							Specialist <br> <%=dao.countSpecialist() %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specialistname" class="form-control">
						</div>
						
						<div class="text-center mt-3">
						<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>