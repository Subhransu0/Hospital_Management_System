<%@page import="com.sonu.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.db.DBConnect"%>
<%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="com.sonu.dao.AppointMentDao"%>
<%@page import="com.sonu.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container- p-3">
		<div class="row">

			<div class="col-md-12">

				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 fw-bold text-center text-success">Patient
							Details</p>


						<c:if test="${not empty succMsg }">
							<p class="fs-3 text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-success">${errorMsg }</p>
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
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctorObj");
								AppointMentDao dao = new AppointMentDao(DBConnect.getConnection());
								List<Appointment> list = dao.getAllApointmentByDoctorLogin(d.getId());
								for (Appointment a : list) {
								%>
								<tr>
									<td><%=a.getFullname()%></td>
									<td><%=a.getGender()%></td>
									<td><%=a.getAge()%></td>
									<td><%=a.getAppointdate()%></td>
									<td><%=a.getEmail()%></td>
									<td><%=a.getPhNo()%></td>
									<td><%=a.getDiseases()%></td>
									<td><%=a.getStatus()%></td>
									<td>
									
									<%
									if("pending".equals(a.getStatus())){%>
										<a href="comment.jsp?id=<%=a.getId()%>"   
												class="btn btn-success btn-sm"><i
													class="fa-regular fa-comment"></i>Comment</a>
									<%}
									else{%>
										<a href=""
										class="btn btn-success btn-sm disabled"><i
											class="fa-regular fa-comment"></i>Comment</a>
									<%}
									%>
									
									
											
											
											</td>
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