<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<%@ include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Registration</p>

						<c:if test="${not empty SucMsg }">
							<p class="text-center text-success fs-3">${SucMsg }</p>
							<c:remove var="SucMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errMsg }">
							<p class="text-center text-danger fs-3">${errMsg }</p>
							<c:remove var="errMsg" scope="session" />
						</c:if>

						<form action="user_register" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label> <input required
									name="name" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Email Address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Sign
								Up</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>