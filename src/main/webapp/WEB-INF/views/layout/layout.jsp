<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    
	<jsp:include page="../partials/head.jsp"/>
  </head>
  <body>
	
	<nav>
		<jsp:include page="../partials/side.jsp"/>
	</nav>
	
	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="resources/images/bootstrapTemplate/index.jpg" data-speed="0.8">
			<div class="home_container">
				<div class="container" style="margin-left: 100px;">
					<div class="row">
						<div class="col">
							<nav>
								<div class="col-sm-9 col-md-7" style="position: relative;">
									<jsp:include page="../contents/${mainContent }"/>
								</div>
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
    
  </body>
</html>