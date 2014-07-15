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
	<!--link rel="stylesheet" type="text/css" href="http://xoxco.com/projects/code/tagsinput/jquery.tagsinput.css" /-->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
	<!--script type="text/javascript" src="http://xoxco.com/projects/code/tagsinput/jquery.tagsinput.js"></script>
	<!-- To test using the original jQuery.autocomplete, uncomment the following -->
	<!--
	<script type='text/javascript' src='http://xoxco.com/x/tagsinput/jquery-autocomplete/jquery.autocomplete.min.js'></script>
	<link rel="stylesheet" type="text/css" href="http://xoxco.com/x/tagsinput/jquery-autocomplete/jquery.autocomplete.css" />
	-->
	<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js'></script>
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/start/jquery-ui.css" />
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/tags/jquery.tagsinput.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tags/jquery.tagsinput.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tags/jquery.tagsinput.css" />
	
	<style type="text/css">
		body {
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}

        .form-signin {
			max-width: 600px;
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
      
		.form-signin .form-signin-heading,
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
	  
		.jumbotron {
			background: #358CCE;
			color: #FFF;
			border-radius: 0px;
		}

		.jumbotron-sm { 
			padding-top: 24px;
			padding-bottom: 24px; 
		}

		.jumbotron small {
			color: #FFF;
		}

		.h1 small {
			font-size: 24px;
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
          <a class="navbar-brand" href="/contactmanager/index">БАЗА РЕКОМЕНДАЦИЙ</a>
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

    <div class="jumbotron jumbotron-sm">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-lg-12">
					<h1 class="h1">
						New recomendation <small>create a new one</small></h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<!--div class="col-md-1">
			</div-->
			<div class="col-md-10">
				<div class="well well-sm">
				
				
				
				
					<form:form action="remakecurrentarticle" method="POST" commandName="article">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Title</label>
								<form:input type="text" class="form-control" id="name" path="titleOfArticle" placeholder="Enter title" required="required" />
							</div>
							
							<div class="form-group">
								<label for="author">Author</label>
								<form:input type="text" class="form-control" id="author" path="authorOfArticle" placeholder="Enter author" required="required" />
							</div>
							
							<div class="form-group">
								<label for="subject">
									Category</label>
									
									<form:select id="subject" name="subject" class="form-control" path="categoryOfArticleNEW.id_category" required="required">
										<c:forEach items="${categoriesList}" var="category">
											<<!-- сделать выбор активной категории -->

											<c:set var="first" scope="session" value="${article.categoryOfArticleNEW.id_category}"></c:set>
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

											<c:set var="first" scope="session" value="${article.typeOfArticleNEW.id_type}"></c:set>
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

											<c:set var="first" scope="session" value="${article.stageOfArticleNEW.id_stage}"></c:set>
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
							
							<input id='tags_2' type='text' class='tags' value="php,ios,javascript,ruby,android,kindle" />
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">
									Content</label>
								<form:textarea name="message" id="message" class="form-control" path="contentOfArticle" rows="20" cols="25" required="required"
									placeholder="type the content ..."></form:textarea>
							</div>
						</div>
						<div class="col-md-12">
						
							<button type="submit" class="btn btn-primary pull-right" id="btnContactUs">	
								Submit!</button>
						</div>
					</div>
					</form:form>
		
				</div>
			</div>
			<!--div class="col-md-4">
				<form>
				<legend><span class="glyphicon glyphicon-globe"></span>Â Our office</legend>
				<address>
					<strong>Twitter, Inc.</strong><br>
					795 Folsom Ave, Suite 600<br>
					San Francisco, CA 94107<br>
					<abbr title="Phone">
						P:</abbr>
					(123) 456-7890
				</address>
				<address>
					<strong>Full Name</strong><br>
					<a href="mailto:#">first.last@example.com</a>
				</address>
				</form>
			</div-->
		</div>
	</div>
	<script type="text/javascript">
		
		function onAddTag(tag) {
			alert("Added a tag: " + tag);
		}
		function onRemoveTag(tag) {
			alert("Removed a tag: " + tag);
		}
		
		function onChangeTag(input,tag) {
			alert("Changed a tag: " + tag);
		}
		
		$(function() {

			$('#tags_1').tagsInput({width:'auto'});
			$('#tags_2').tagsInput({
				width: 'auto',
				onChange: function(elem, elem_tags)
				{
					var languages = ['php','ruby','javascript'];
					$('.tag', elem_tags).each(function()
					{
						if($(this).text().search(new RegExp('\\b(' + languages.join('|') + ')\\b')) >= 0)
							$(this).css('background-color', 'yellow');
					});
				}
			});
			$('#tags_3').tagsInput({
				width: 'auto',

				//autocomplete_url:'test/fake_plaintext_endpoint.html' //jquery.autocomplete (not jquery ui)
				autocomplete_url:'test/fake_json_endpoint.html' // jquery ui autocomplete requires a json endpoint
			});
			

// Uncomment this line to see the callback functions in action
//			$('input.tags').tagsInput({onAddTag:onAddTag,onRemoveTag:onRemoveTag,onChange: onChangeTag});		

// Uncomment this line to see an input with no interface for adding new tags.
//			$('input.tags').tagsInput({interactive:false});
		});
	
	</script>
</body>
</html>