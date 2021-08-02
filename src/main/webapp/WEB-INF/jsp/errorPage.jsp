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
		
				<div class="card-block new-body" style="margin-top: 50px">

					<form action="balance">
						<div class="container">
							<div class="row">
								<label for="Message" class="message">
									No</label> <input type="text" readonly="readonly" class="styleInp col-sm-7"
									name="balance" id="balance" value="${errorPage}">
							</div>
							
							
							
							</div>
					</form>

				</div>
			</div>
		

</body>
</html>
