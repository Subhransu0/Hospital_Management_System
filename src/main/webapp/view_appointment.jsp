<%@page import="com.sonu.entity.User"%>
<%@page import="com.sonu.entity.Doctor"%>
<%@page import="com.sonu.dao.DoctorDao"%>
<%@page import="com.sonu.entity.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>View Appointment</title>
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
	<c:if test="${empty userObj }">
	<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-3 text-white"></p>
	</div>
	<div class="container- p-3">
		<div class="row">

			<div class="col-md-9">

				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>

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
									<th scope="col" class=>Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<% 
							User id = (User)session.getAttribute("userObj");
							AppointMentDao dao = new AppointMentDao(DBConnect.getConnection());
							DoctorDao dao1 = new DoctorDao(DBConnect.getConnection());
							  List<Appointment> list = dao.getAllApointmentByLoginUser(id.getId());
							  for(Appointment ap : list){
						Doctor d =	dao1.getDoctorById(ap.getDoctorId());
							  %>

								<tr>
									<th><%= ap.getFullname() %></th>
									<td><%= ap.getGender() %></td>
									<td><%= ap.getAge() %></td>
									<td><%= ap.getAppointdate() %></td>
									<td><%= ap.getDiseases() %></td>
									<td><%= d.getFullname() %></td>
									<td>
									<%if("pending".equals(ap.getStatus())) {%>
									
										<a href="#" class="btn btn-sm btn-warning"><i class="fa-regular fa-clock"></i>Pending</a>
								
								<%}else{%>
								<a href="#" class="btn btn-sm btn-success"><i class="fa-regular fa-circle-check"></i>         <%=ap.getStatus()%></a>
									<%}%>
									
									</td>

								</tr>
								<%   }
							%>




							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img src="img/doctor12.jpg" height="500px" alt="Doctor Image">
			</div>
		</div>
	</div>


</body>
</html>