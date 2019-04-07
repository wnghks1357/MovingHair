<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Moving Hair</title>
    <!-- <link rel='stylesheet' href='/stylesheets/style.css' /> -->

    <style>
      .indexContainer {
         position: relative; border: 1px dashed #BDBDBD; width: 500px; height: 500px; margin: auto;
      }
      .indexContainer img{
        position: absolute; clear: left;  left: 110px;
      }

      #userBtn{
        position: absolute; clear: left;  height: 50px; left: 0px; bottom: 0px;
      }
      #designerBtn {
        position: absolute; clear: left;  height: 50px; right: 0; bottom: 0px;
      }

    </style>

  </head>
  <body>
    <div class="indexContainer">
    <!-- <button><a href="/home">home</a></button>
    <button><a href="/about">about</a></button> -->
    <img src="resources/images/movinghair/movinghairLogo.PNG">
    <div class="btnContainer">
        <button id="userBtn" onclick="location.href='customerLoginView.do'">이용자</button>
        <button id="designerBtn" onclick="location.href='designerLoginView.do'">디자이너</button>
    </div>
    </div>
  </body>
</html>