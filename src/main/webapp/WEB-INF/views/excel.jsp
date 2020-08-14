<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>电脑商城-欢迎登录</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sort.js"></script>
<script src="${pageContext.request.contextPath}/js/holder.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<%--<script>

	$(document).ready(function() {

		
		$(document).keypress(function(e) {
			if (e.which == 13) {
				e.preventDefault();
				
				$(".login-input").click();
				//form.submit();
			}
		});
		input_value();
	})
	
	function input_value() {
		if (UserID != "null") {
			document.getElementById("inputEmail3").value = UserID;
		}
	}
</script>--%>

<script type="text/javascript">
	function reloadcode() {
		var verify = document.getElementById('code');
		verify.setAttribute("src", "${pageContext.request.contextPath}/verificationcodeimg?it=" + Math.random());
	}
</script>


<body onload="input_value()">
	<div id="main" class="container">
		<div id="header">
			<%@ include file="header.jsp"%>
		</div>
		<div class="login">
			<div class="row">
				<div class="col-md-6">
					<img src="./image/login.png" alt="" width="640" height="400" style="margin-left:-40px;margin-top:30px;">
				</div>
				<div class="col-md-5 form-login">
					<div>
						<!-- <h2 class="login-h2">登录</h2> -->
						<form method="post" action="/File/UploadServlet" enctype="multipart/form-data">
							Choose a file:
							<input type="file" name="uploadFile" />
							<br/><br/>
							<input type="submit" value="upload" />
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>