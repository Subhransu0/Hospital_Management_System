<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%@ include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<c:if test="${empty userObj }">
	<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>

					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<c:if test="${not empty errMsg }">
						<p class="text-center text-danger fs-3">${errMsg }</p>
						<c:remove var="errMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="changePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newpassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldpassword" class="form-control" required>
							</div>
							<input type="hidden" name="uid" value="${userObj.id }">

							<button class="btn btn-success col-md-12">Change
								Password</button>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>