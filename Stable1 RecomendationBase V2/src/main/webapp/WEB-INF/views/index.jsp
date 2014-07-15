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

	<div class="container" style="margin-top: 40px;">
		<div class="col-md-3">
			<form:form action="searcharticle" method="POST" commandName="sarticle">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="name">Title</label>
								<form:input type="text" class="form-control" id="name" placeholder="Enter title" path="titleOfArticle"/>
							</div>
							
							
							<div class="form-group">
								<label for="subject">
									Category</label>
									<form:select id="subject" name="subject" class="form-control" path="categoryOfArticleNEW.id_category" required="required">
										<c:forEach items="${categoriesList}" var="category">
											<<!-- сделать выбор активной категории -->
											<c:set var="first" scope="session" value="${sarticle.categoryOfArticleNEW.id_category}"></c:set>
											<c:set var="second" scope="session" value="${category.id_category}"></c:set>											
											<c:choose>
												<c:when test="${first == second}">
													<option value="${category.id_category}" selected="selected">${category.descriptionOfCategory}</option>
												</c:when>
												<c:otherwise>
													<option value="${category.id_category}">${category.descriptionOfCategory}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
							</div>
							
							<div class="form-group">
								<label for="subject">
									Software Type</label>
								<form:select id="subject" name="subject" class="form-control" path="typeOfArticleNEW.id_type" required="required">
										<c:forEach items="${typesList}" var="type">
											<<!-- сделать выбор активного типа -->
											<c:set var="first" scope="session" value="${sarticle.typeOfArticleNEW.id_type}"></c:set>
											<c:set var="second" scope="session" value="${type.id_type}"></c:set>											
											<c:choose>
												<c:when test="${first == second}">
													<option value="${type.id_type}" selected="selected">${type.descriptionOfType}</option>
												</c:when>
												<c:otherwise>
													<option value="${type.id_type}">${type.descriptionOfType}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
							</div>
							
							<div class="form-group">
								<label for="subject">
									Development Stage</label>
									<form:select id="subject" name="subject" class="form-control" path="stageOfArticleNEW.id_stage" required="required">
										<c:forEach items="${stagesList}" var="stage">
											<<!-- сделать выбор активного этапа -->

											<c:set var="first" scope="session" value="${sarticle.stageOfArticleNEW.id_stage}"></c:set>
											<c:set var="second" scope="session" value="${stage.id_stage}"></c:set>											
											<c:choose>
												<c:when test="${first == second}">
													<option value="${stage.id_stage}" selected="selected">${stage.descriptionOfStage}</option>
												</c:when>
												<c:otherwise>
													<option value="${stage.id_stage}">${stage.descriptionOfStage}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
							</div>
						</div>
						<div class="col-md-12">
							<button type="submit" class="btn btn-primary pull-right" id="btnContactUs">	
								Search</button>
						</div>
					</div>
					</form:form>
		</div>
		<div class="col-md-9">  
		  <h2 class="sub-header">Recommendations list</h2>
          <div class="table-responsive">
           	<c:if test="${empty listOfArticles}">
           	<h4 class="sub-header">There are no such recomendations in DB</h4>
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
							  	</td>
			                </tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
           
           <!-- 
          </div>
		  <ul class="pagination">
			  <li><a href="#">&laquo;</a></li>
			  <li><a href="#">1</a></li>
			  <li><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li><a href="#">4</a></li>
			  <li><a href="#">6</a></li>
			  <li><a href="#">&raquo;</a></li>
			</ul>
 			-->
		  </div>
    </div>
	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>