<%@page import="com.sonu.entity.Appointment"%>
<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.sonu.dao.AppointMentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/building.jpg");
	height: 30vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-3 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">

						<p class="text-center fs-4">Patient Comment</p>
						
						<%
						int id = Integer.parseInt(request.getParameter("id")); 
						AppointMentDao dao = new AppointMentDao(DBConnect.getConnection());
						Appointment ap = dao.getAppointMentById(id);
						%>
						
						<form class="row" action="../comment" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly value="<%= ap.getFullname()  %>"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label>Age</label> <input type="text" readonly value="<%= ap.getAge() %>"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label>Mob No</label> <input type="text" readonly value="<%= ap.getPhNo() %>"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label>Diseases</label> <input type="text" readonly value="<%= ap.getDiseases() %>"
									class="form-control">
							</div>
							<div class="col-md-12">
								<label>Comment</label>
								<textarea required name="comment" rows="3" cols="" class="form-control"></textarea>
							</div>
							<input type="hidden" name="id" value="<%= ap.getId() %>"> <input
								type="hidden" name="did" value="<%= ap.getDoctorId() %>">
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>