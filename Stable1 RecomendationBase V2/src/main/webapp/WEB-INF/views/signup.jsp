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
			padding-top:30px; 
		}
		  
		.form-control { 
			margin-bottom: 10px; 
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
         	 <li><a href="/contactmanager/login">Войти</a></li>
	      	 <li class="active"><a href="/contactmanager/signup">Регистрация</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>






<div class="container"><
		<div class="row" style="margin-top: 40px;">
			<div class="col-xs-12 col-sm-12 col-md-4 well well-sm">
			 	<legend><a href="http://www.jquery2dotnet.com"><i class="glyphicon glyphicon-globe"></i></a> Sign up!</legend> 
				<form:form action="addnewuser" method="post" class="form" commandName="author">
				<div class="row">
					
					<div class="col-xs-6 col-md-6">
					 
						<form:input class="form-control" name="firstname" placeholder="Login" path="authorLogin" type="text"
							required="required" />
							 
					</div>
					<div class="col-xs-6 col-md-6">
						<form:input class="form-control" name="lastname" placeholder="Name" path="authorName" type="text" required="required" />
					</div>
					
				</div>
				<form:input class="form-control" name="youremail" placeholder="Your Email" path="authorMail" type="email" />
				<!--  <input class="form-control" name="reenteremail" placeholder="Re-enter Email" type="email" />-->
				<form:input class="form-control" name="password" placeholder="New Password" path="authorPassword" type="password" />
				<!-- 
				<label for="">Birth Date</label>
				<div class="row">
					<div class="col-xs-4 col-md-4">
						<select class="form-control">
							<option value="Month">Month</option>
						</select>
					</div>
					<div class="col-xs-4 col-md-4">
						<select class="form-control">
							<option value="Day">Day</option>
						</select>
					</div>
					<div class="col-xs-4 col-md-4">
						<select class="form-control">
							<option value="Year">Year</option>
						</select>
					</div>
				</div>
				 -->
				<label class="radio-inline">
					<input type="radio" name="sex" id="inlineCheckbox1" value="Male" />
					Male
				</label>
				<label class="radio-inline">
					<input type="radio" name="sex" id="inlineCheckbox2" value="Female" />
					Female
				</label>
				<br />
				<br />
				<button class="btn btn-lg btn-primary btn-block" type="submit">
					Зарегистрироваться</button>
				</form:form>
			</div>
		</div>
	</div>

















	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>