<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel='stylesheet' href='resources/stylesheets/bootstrap/bootstrap.min.css' />
    <link rel='stylesheet' href='resources/stylesheets/bootstrap/login_boot.css' />
    <script src="resources/javascripts/bootstrap/jquery-3.2.1.min.js" charset="utf-8"></script>
    <script src="resources/javascripts/sha512.js"></script>
    <script>
      
	function fnLoginSubmit(){
    	  
		// 패스워드 hashing ( sha512.js 사용 )
		var shaPwd = hex_sha512($('#userPwd').val()).toString();
		shaPwd = shaPwd.substring(0,20);
		$("#userPwd").val(shaPwd);
		// 패스워드 hashing ( sha512.js 사용 ) //
		
		
		var loginForm =	document.loginForm;
		loginForm.submit();
      }
	
    </script>
  </head>

  <body>
    <img src="resources/images/movinghair/movinghairLogo.PNG" style="margin-left: 43%; margin-top: 30px;" onclick="location.href='customerMain.do'">

   
    <div class="container">
      <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
          <div class="card card-signin my-5">
            <div class="card-body">
              <h5 class="card-title text-center">Sign In</h5>
              <form class="form-signin" action="loginProc.do" method="POST" id="loginForm" name="loginForm" onsubmit="return false;">
                <div class="form-label-group">
                  <input type="email" id="userId" name="userId" class="form-control" placeholder="Email address" required autofocus>
                  <label for="userId">Email address</label>
                </div>
  
                <div class="form-label-group">
                  <input type="password" id="userPwd" name="userPwd" class="form-control" placeholder="Password" required>
                  <label for="userPwd">Password</label>
                </div>

                <div id="messageBox">

                </div>
  
                <!-- <div class="custom-control custom-checkbox mb-3">
                  <input type="checkbox" class="custom-control-input" id="customCheck1">
                  <label class="custom-control-label" for="customCheck1">Remember password</label>
                </div> -->
                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" onclick="fnLoginSubmit();">Sign in</button>
                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" style="width: 47%; float:left;" onclick="location.href='mhUserJoin.do'">Join Us</button>
                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" style="width: 47%; float: right;"  onclick="location.href='findUser.do'">Find ID/PASSWORD</button>
                <hr class="my-4" style="clear: both;">
                <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit" style="background-color: #1DDB16"><i></i> Sign in with Naver</button>
                <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
                <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit" style="background-color: #ffe812; color:black;"><i class="fab fa-facebook-f mr-2"></i> Sign in with Kakao</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>