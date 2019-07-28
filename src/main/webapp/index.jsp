<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Moving Hair</title>
    <!-- <link rel='stylesheet' href='/stylesheets/style.css' /> -->
    <style>
      .indexContainer {
         position: relative; width: 500px; height: 500px; margin: auto;
      }
      .indexContainer img{
        position: absolute; clear: left;  left: 110px;
      }
      .circle1 {
		position: absolute;
		top:300px;
		left:-150px;
		clear: left;
		background-color:#1d24b5;
		width:300px;
		height:300px;
		border-radius:150px;
		text-align:center;
		margin:0 auto;
		vertical-align:middle;
		line-height:300px;
		font-size:60px;
		font-weight:bold;
		color:white;
		cursor: pointer;
		}
		.circle2 {
		position: absolute;
		top:300px;
		right:-150px;
		clear: left;
		background-color:#ff0000;
		width:300px;
		height:300px;
		border-radius:150px;
		text-align:center;
		margin:0 auto;
		vertical-align:middle;
		line-height:300px;
		font-size:60px;
		font-weight:bold;
		color:white;
		cursor: pointer;
		}

    </style>

  </head>
  <body>
    <div class="indexContainer">
    <!-- <button><a href="/home">home</a></button>
    <button><a href="/about">about</a></button> -->
    <!-- <img src="resources/images/movinghair/movinghairLogo.PNG"> -->
    <div class="btnContainer">
    	<div class="circle1" onclick="javascript:location.href='customerLoginView.do';">이용자
        	<!-- <button id="userBtn" onclick="location.href='customerLoginView.do'">이용자</button> -->
        </div>
        <div class="circle2" onclick="javascript:location.href='designerLoginView.do';">디자이너
        </div>
        <!-- <button id="designerBtn" onclick="location.href='designerLoginView.do'">디자이너</button> -->
    </div>
    </div>
  </body>
</html>