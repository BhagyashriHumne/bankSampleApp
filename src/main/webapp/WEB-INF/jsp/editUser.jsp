<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="fragments/CommonMerchantDrawer.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sample.bankingApp.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Easy Banking</title>
<link rel="stylesheet" href="css/quickInvoice.css">
</head>
<body>
	<%
		User selectedUser = null;
	%>
	<div class="main-wrapper">
		<div id="id01" class="modal row col-sm-12"
			style="height: auto; justify-content: center; padding: 30px;">
			<div class="card col-sm-6  animate" style="">				
				<div class="card-block new-body">

					<form action="editUser" method="post">
						<div class="container">
							<div class="row">
								<label for="firstName" class="commonLabel col-sm-5"
									style="margin: auto 0;">First Name</label> <input type="text"
									class="styleInp col-sm-7" name="firstName" id="firstName"
									placeholder="Enter First Name"
									value=<%=(selectedUser != null && selectedUser.getFirstName() != null ? selectedUser.getFirstName() : "")%>>
							</div>
							<div class="row">
								<label for="lastName" class="commonLabel col-sm-5"
									style="margin: auto 0;">Last Name</label> <input type="text"
									class="styleInp col-sm-7" name="lastName" id="lastName"
									placeholder="Enter Last Name"
									value=<%=(selectedUser != null && selectedUser.getLastName() != null ? selectedUser.getLastName() : "")%>>
							</div>
							<div class="row">
								<label for="email" class="commonLabel col-sm-5"
									style="margin: auto 0;">Email Id</label> <input type="text"
									class="styleInp col-sm-7" name="email" id="email"
									placeholder="Enter Email Id"
									value=<%=(selectedUser != null && selectedUser.getEmail() != null ? selectedUser.getEmail() : "")%>>
							</div>
							<div class="row">
								<label for="contact" class="commonLabel col-sm-5"
									style="margin: auto 0;">Contact Number</label> <input
									type="number" class="styleInp col-sm-7" name="contact"
									id="contact" placeholder="Enter Contact Number"
									value=<%=(selectedUser != null && selectedUser.getContact() != null ? selectedUser.getContact() : "")%>>
							</div>
							<div class="row">
								<label for="addressLine1" class="commonLabel col-sm-5"
									style="margin: auto 0;">Address Line1</label> <input
									type="text" class="styleInp col-sm-7" name="addressLine1"
									id="addressLine1" placeholder="Enter Address Line1"
									value=<%=(selectedUser != null && selectedUser.getAddressLine1() != null ? selectedUser.getAddressLine1()
					: "")%>>
							</div>
							<div class="row">
								<label for="addressLine2" class="commonLabel col-sm-5"
									style="margin: auto 0;">Address Line2</label> <input
									type="text" class="styleInp col-sm-7" name="addressLine2"
									id="addressLine2" placeholder="Enter Address Line2"
									value=<%=(selectedUser != null && selectedUser.getAddressLine2() != null ? selectedUser.getAddressLine2()
					: "")%>>
							</div>
							<div class="row">
								<label for="password" class="commonLabel col-sm-5"
									style="margin: auto 0;">Password</label> <input type="password"
									class="styleInp col-sm-7" name="password" id="password"
									placeholder="Enter Password"
									value=<%=(selectedUser != null && selectedUser.getPassword() != null ? selectedUser.getPassword() : "")%>>
							</div>
							<div class="row">
								<label for="role" class="commonLabel col-sm-5"
									style="margin: auto 0;">Role</label> <input type="text"
									class="styleInp col-sm-7" name="role" id="role"
									placeholder="Enter Role"
									value=<%=(selectedUser != null && selectedUser.getRole() != null ? selectedUser.getRole() : "")%>>
							</div>
							<div class="row">
								<label for="id" class="commonLabel col-sm-5"
									style="margin: auto 0;">Id</label> <input type="text"
									class="styleInp col-sm-7" name="id" id="id"
									value=<%=(selectedUser != null && selectedUser.getId() != 0 ? selectedUser.getId() : "")%>>
							</div>
						</div>


						<div class="row" style="padding: 15px 15px;">
							<div class="col-sm-6" style="text-align: center;">
								<button type="submit" class="btn new-btn" style="width: 90%;"
									id="submit-button"><%=(selectedUser != null ? "Update Employee" : "Add Employee")%></button>
							</div>
							<div class="col-sm-6" style="text-align: center;">
								<button type="button" class="btn new-btn" style="width: 90%;"
									onclick="document.getElementById('id01').style.display='none'">Cancel</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>

	</div>

</body>
</html>
