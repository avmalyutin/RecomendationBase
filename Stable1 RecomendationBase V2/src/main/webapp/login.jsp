<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>База рекомендаций</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
		body {
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}

		.form-signin {
			max-width: 300px;
			padding: 19px 29px 29px;
			margin: 0 auto 20px;
			margin-top: 40px;
			background-color: #fff;
			border: 1px solid #e5e5e5;
			-webkit-border-radius: 5px;
			   -moz-border-radius: 5px;
					border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
			   -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
					box-shadow: 0 1px 2px rgba(0,0,0,.05);
		}
		
		form-signin .form-signin-heading,
		.form-signin .checkbox {
			margin-bottom: 10px;
		}
		
		.form-signin input[type="text"],
		.form-signin input[type="password"] {
			font-size: 16px;
			height: auto;
			margin-bottom: 15px;
			padding: 7px 9px;
		 }
	</style>
	
	<!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/contactmanager/index">БАЗА РЕКОМЕНДАЦИЙ</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/contactmanager/login">Войти</a></li>
	        <li><a href="/contactmanager/singup">Регистрация</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">
    
    
    
    
      <form class="form-signin" method="POST" action="<c:url value="/contactmanager/j_spring_security_check" />">
			<h2 class="form-signin-heading">Please sign in</h2>
			
			<c:if test="${not empty param.error}">
				<font color="red"> <spring:message code="label.loginerror" />
				: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </font>
			</c:if>
	
			<input type="text" class="input-block-level" placeholder="Email address" name="j_username">
			<input type="password" class="input-block-level" placeholder="Password" name="j_password">
			<label class="checkbox">
			  <input type="checkbox" value="remember-me" name="_spring_security_remember_me"> Remember me
			</label>
			
			<input  class="btn btn-large btn-primary" type="submit" value="Login" />

      </form>
      
      
      
      
    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>