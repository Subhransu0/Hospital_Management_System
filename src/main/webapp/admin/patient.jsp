<%@page import="com.sonu.dao.DoctorDao"%>
<%@page import="com.sonu.entity.Doctor"%>
<%@page import="com.sonu.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.sonu.dao.AppointMentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient List</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">

		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
					DoctorDao dao1 = new DoctorDao(DBConnect.getConnection());
					AppointMentDao dao = new AppointMentDao(DBConnect.getConnection());
					List<Appointment> list = dao.getAllApointment();
					for(Appointment a : list){  
						Doctor d =  dao1.getDoctorById(a.getDoctorId());
					%>
						<tr>
							<th><%= a.getFullname()%></th>
							<td><%= a.getGender()%></td>
							<td><%= a.getAge()%></td>
							<td><%= a.getAppointdate()%></td>
							<td><%= a.getEmail()%></td>
							<td><%= a.getPhNo()%></td>
							<td><%= a.getDiseases()%></td>
							<td><%= d.getFullname()%></td>
							<td><%= a.getAddress()%></td>
							<td><%= a.getStatus() %></td>
						</tr>

						<%}
					%>





					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>