<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    
  </head>
  <body>
	
	<nav>
		<jsp:include page="../partials/side.jsp"/>
	</nav>
	
	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="resources/images/bootstrapTemplate/index.jpg" data-speed="0.8"></div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<nav>
								<jsp:include page="../contents/${mainContent }"/>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<footer>
		<jsp:include page="../partials/footer.jsp"/>
	</footer>
	
	<jsp:include page="../partials/head.jsp"/>
    
  </body>
</html>