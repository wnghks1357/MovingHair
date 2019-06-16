<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<%@ include file="../../partials/admin/header-admin.jspf" %>
  </head>
  <body class="loginPage">
	
	<nav>
		<%-- <jsp:include page="../admin/partials/side.jsp"/> --%>
	</nav>
	
	<%-- <div class="home">
		<div class="home_container">
			<div class="container" style="margin-left: 100px;">
				<div class="row">
					<div class="col">
						<nav>
							<div class="col-sm-9 col-md-7">
								
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<jsp:include page="../../admin/${mainContent }"/>
	<footer>
		<%@ include file="../../partials/admin/footer-admin.jspf" %>
	</footer>
    
  </body>
</html>