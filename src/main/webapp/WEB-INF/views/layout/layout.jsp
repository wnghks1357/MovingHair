<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <jsp:include page="../partials/head.jsp"/>
  </head>
  <body>
	
	<nav>
		<jsp:include page="../partials/side.jsp"/>
	</nav>
	
	
	<nav>
		<jsp:include page="../contents/${mainContent }"/>
	</nav>
	
	<footer>
		<jsp:include page="../partials/footer.jsp"/>
	</footer>
    
  </body>
</html>