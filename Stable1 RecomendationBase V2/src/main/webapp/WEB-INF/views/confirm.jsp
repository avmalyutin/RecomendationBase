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
		  padding-top: 50px;
		}
		.starter-template {
		  padding: 40px 15px;
		  text-align: center;
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
            <c:set var="role" scope="session" value="${currentRole}"></c:set>
	          <c:set var="userName" scope="session" value="${currentUserName}"></c:set>
	          <c:set var="ANONYM" scope="session" value="ROLE_ANONYMOUS"></c:set>
	          <c:set var="STUDENT" scope="session" value="ROLE_STUDENT"></c:set>
	          <c:set var="TEACHER" scope="session" value="ROLE_TEACHER"></c:set>
	          <c:set var="ADMIN" scope="session" value="ROLE_ADMIN"></c:set>
	          
		      <c:if test="${role == ANONYM}">
		      	<li><a href="/contactmanager/login">Войти</a></li>
		        <li><a href="/contactmanager/singup">Регистрация</a></li>
			  </c:if>
				  
			  <c:if test="${role == STUDENT}">
			  	<li class="active"><a href="/contactmanager/index">Добрый день, ${currentUserName} </a> </li>
		      	<li><a href="/contactmanager/logout">Выйти из учетной записи</a></li>
			  </c:if>
				  
				  
			  <c:if test="${role == TEACHER}">
		      	<li class="active" ><a href="/contactmanager/index">Добрый день, ${currentUserName} </a> </li>
		      	<li><a href="/contactmanager/newarticle/">Создать новую рекомендацию</a></li>
		      	<li><a href="/contactmanager/logout">Выйти из учетной записи</a></li>
			  </c:if>
			  
			  <c:if test="${role == ADMIN}">
			  	<li class="active" ><a href="/contactmanager/index">Добрый день, ${currentUserName} </a> </li>
			  	<li><a href="/contactmanager/newarticle/">Создать новую рекомендацию</a></li>
		      	<li><a href="/contactmanager/confirm/">Подтвердить рекомендации</a></li>
		      	<li><a href="/contactmanager/confirmAuthors/">Одобрить авторов</a></li>
		      	<li><a href="/contactmanager/logout">Выйти из учетной записи</a></li>
			  </c:if>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

	<div class="container">
	<h2 class="sub-header">Recommendations list</h2>
          <div class="table-responsive">
            
            <c:if test="${empty listOfArticles}">
           	<h4 class="sub-header">There are no recomendations in DB</h4>
           	</c:if>
            
            <c:if test="${!empty listOfArticles}">
				<table class="table table-striped">
					<thead>
                		<tr>
	                  		<th>№</th>
	                  		<th>Заголовок</th>
	                  		<th>Дата</th>
	                  		<th>Автор</th>
	                  		<th>Действия</th>
                		</tr>
              		</thead>
              		
              		<tbody>
						<c:forEach items="${listOfArticles}" var="article">
						
							<tr>
                  				<td>${article.id}</td>
			                  	<td>${article.titleOfArticle}</td>
			                  	<td>${article.getFormattedDate()}</td>
			                  	<td>${article.authorOfArticle}</td>
			                  	<td>
			                  		<a href="/contactmanager/shownewarticle/${article.id}"><button type="button" class="btn btn-small btn-info">Info</button></a>
									<button type="button" class="btn btn-success" onclick="window.location='/contactmanager/shownewarticle/${article.id}';">Accept</button>
									<button type="button" class="btn btn-small btn-danger">Decline</button>
							  	</td>
			                </tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
          </div>
    </div>
	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>