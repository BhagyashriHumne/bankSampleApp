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
	
	<div class="main-wrapper">
		<div class="app" id="app">
			<article class="content dashboard-page">


				<section class="section">
					<div class="row">
						<div class="col-sm-12">
							<div class="card" style="margin-top: -15px;">

								<div class="card-block new-header">
									<h3 class="title">
										<svg width="1em" height="1em" viewBox="0 0 16 16"
											class="bi bi-cart4" fill="currentColor"
											xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd"
												d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
								</svg>
										&nbsp; User
									</h3>
									<p id="indexp" hidden="hidden"></p>
								</div>

								<div style="overflow-x: auto;">
									<table id="itmTable" class="table">
										<thead>
											<tr>
												<th scope="col">firstName</th>
												<th scope="col">lastName</th>
												<th scope="col">email</th>
												<th scope="col">contact</th>
												<th scope="col">addressLine1</th>
												<th scope="col">addressLine2</th>
												<th scope="col">password</th>
												<th scope="col">role</th>
												<th scope="col">id</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody id="tableBody">
											<c:forEach items="${users}" var="each">
												<c:set var="user" value="${each}" scope="request" />
												<tr>
													<td class="center">${each.firstName}</td>
													<td class="center">${each.lastName}</td>
													<td class="center">${each.email}</td>
													<td class="center">${each.contact}</td>
													<td class="center">${each.addressLine1}</td>
													<td class="center">${each.addressLine2}</td>
													<td class="center">${each.password}</td>
													<td class="center">${each.role}</td>
													<td class="center">${each.id}</td>
													<td class="col-sm-6">
													<form action="callEditUser/${each.id}">
														<button type="button" id="${each.id}" class="btn new-btn"
															style="width: 90%;" onclick="edit('${each.id}')"
															onclick="document.getElementById('id01').style.display='flex'">Edit</button>
												</form>
												</tr>
											</c:forEach>



										</tbody>
									</table>
								</div>
								<div class="btn new-btn"
									onclick="document.getElementById('id01').style.display='flex'">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-cart-plus" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd"
											d="M8.5 5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 .5-.5z" />
								  <path fill-rule="evenodd"
											d="M8 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0v-2z" />
								  <path fill-rule="evenodd"
											d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
								</svg>
									Add User
								</div>
							</div>

						</div>

					</div>
				</section>
			</article>
		</div>

		<div id="id01" class="modal row col-sm-12"
			style="height: auto; justify-content: center; padding: 30px;">
			<div class="card col-sm-6  animate" style="">
				<div class="card-block new-header">
					<h3 class="title">
						<svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-cart-plus" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd"
								d="M8.5 5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 .5-.5z" />
			  <path fill-rule="evenodd"
								d="M8 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0v-2z" />
			  <path fill-rule="evenodd"
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
			</svg>
						&nbsp; Add Item
					</h3>
				</div>

				<div class="card-block new-body">

					<form action="createNewUser">
						<div class="container">
							<div class="row">
								<label for="firstName" class="commonLabel col-sm-5"
									style="margin: auto 0;">First Name</label> <input type="text"
									class="styleInp col-sm-7" name="firstName" id="firstName"
									placeholder="Enter First Name">
							</div>
							<div class="row">
								<label for="lastName" class="commonLabel col-sm-5"
									style="margin: auto 0;">Last Name</label> <input type="text"
									class="styleInp col-sm-7" name="lastName" id="lastName"
									placeholder="Enter Last Name">
							</div>
							<div class="row">
								<label for="email" class="commonLabel col-sm-5"
									style="margin: auto 0;">Email Id</label> <input type="text"
									class="styleInp col-sm-7" name="email" id="email"
									placeholder="Enter Email Id">
							</div>
							<div class="row">
								<label for="contact" class="commonLabel col-sm-5"
									style="margin: auto 0;">Contact Number</label> <input
									type="number" class="styleInp col-sm-7" name="contact"
									id="contact" placeholder="Enter Contact Number">
							</div>
							<div class="row">
								<label for="addressLine1" class="commonLabel col-sm-5"
									style="margin: auto 0;">Address Line1</label> <input
									type="text" class="styleInp col-sm-7" name="addressLine1"
									id="addressLine1" placeholder="Enter Address Line1">
							</div>
							<div class="row">
								<label for="addressLine2" class="commonLabel col-sm-5"
									style="margin: auto 0;">Address Line2</label> <input
									type="text" class="styleInp col-sm-7" name="addressLine2"
									id="addressLine2" placeholder="Enter Address Line2">
							</div>
							<div class="row">
								<label for="password" class="commonLabel col-sm-5"
									style="margin: auto 0;">Password</label> <input type="password"
									class="styleInp col-sm-7" name="password" id="password"
									placeholder="Enter Password">
							</div>
							<div class="row">
								<label for="role" class="commonLabel col-sm-5"
									style="margin: auto 0;">Role</label> <select type=
									class="styleInp col-sm-7" name="role" id="role"
									>
									<option value="CUSTOMER">CUSTOMER</option>
									<option value="EMPLOYEE">EMPLOYEE</option>
									</select>
							</div>
							<div class="row">
								<label for="id" class="commonLabel col-sm-5"
									style="margin: auto 0;">Id</label> <input type="text"
									class="styleInp col-sm-7" name="id" id="id">
							</div>
						</div>


						<div class="row" style="padding: 15px 15px;">
							<div class="col-sm-6" style="text-align: center;">
								<button type="submit" class="btn new-btn" style="width: 90%;"
									id="submit-button">Add</button>
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
