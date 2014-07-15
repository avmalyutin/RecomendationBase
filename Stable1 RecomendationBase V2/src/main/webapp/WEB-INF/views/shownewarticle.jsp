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
	
	<script src="jquery.tagsinput.js"></script>
	<script src="jquery.tagsinput.min.js"></script>
	<link rel="stylesheet" type="text/css" href="jquery.tagsinput.css" />
	
	<style type="text/css">
		body {
			padding-top: 80px;
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}
		
		.btn-hover {
		  font-weight: normal;
		  color: #333333;
		  cursor: pointer;
		  background-color: inherit;
		  border-color: transparent;
		}

		.btn-hover-alt {
		  font-weight: normal;
		  color: #ffffff;
		  cursor: pointer;
		  background-color: inherit;
		  border-color: transparent;
		}
		
		.table {
			
		}
		
		.post-tag {
			color:#3e6d8e;
			background-color:#e0eaf1;
			border-bottom:1px solid #b3cee1;
			border-right:1px solid #b3cee1;
			padding:3px 4px 3px 4px;
			margin:2px 2px 2px 0;
			text-decoration:none;
			font-size:90%;
			line-height:1.4;
			white-space:nowrap;
			display:inline-block;
		}
	</style>
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
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<ul class="breadcrumb">
					<li>
						<a href="#">Общее</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Космические проблемы</a> <span class="divider">/</span>
					</li>
				</ul>
				<div class="page-header">
					<h1>
						${article.titleOfArticle}
					</h1>
				</div>	
				<div class="row">
					<div class="col-md-3">
						<a href="#" class="btn btn-sm btn-hover btn-primary"><span class="glyphicon glyphicon-thumbs-up"></span></a>
						<a href="#" class="btn btn-sm btn-hover btn-danger"><span class="glyphicon glyphicon-thumbs-down"></span></a>
						<a href="#" class="btn btn-sm btn-hover btn-success"><span class="glyphicon glyphicon-check"></span></a>
						<a href="#" class="btn btn-xs btn-hover btn-default">Print <span class="glyphicon glyphicon-print"></span></a>
					</div>
					<div class="col-md-9">
						<a href="/contactmanager/shownewarticle/${article.id}/remakearticle" class="btn btn-sm"><span class="glyphicon glyphicon-edit"></span> <strong>Edit</strong></a>
						<a href="/contactmanager/deletearticle/${article.id}" class="btn btn-sm"><span class="glyphicon glyphicon-trash"></span> <strong>Delete</strong></a>
					</div>
				</div>
				<div class="row" style="margin-top: 10px;">
					<div class="col-md-8 column">
						<table class="table">
							<tbody>
								<tr>
									<td class="col-md-4">Author: </td>
									<td class="col-md-8">${article.authorOfArticle}</td>
								</tr>
								<tr>
									<td class="col-md-4">Category: </td>
									<!-- <td class="col-md-8">${article.categoryOfArticle}</td> -->
									<td class="col-md-8">${article.categoryOfArticleNEW.descriptionOfCategory}</td>
								</tr>
								<tr>
									<td class="col-md-4">Software type: </td>
									<td class="col-md-8">${article.typeOfArticleNEW.descriptionOfType}</td>
								</tr>
								<tr>
									<td class="col-md-4">Development stage: </td>
									<td class="col-md-8">${article.stageOfArticleNEW.descriptionOfStage}</td>
								</tr>
								<tr>
									<td class="col-md-4">Tags: </td>
									<td class="col-md-8">
										<!--input id='tags_2' type='text' class='tags' value="php,ios,javascript,ruby,android,kindle" style="background-color: rgba(0,0,0,0.1);" readonly/-->
										<a href="#" class="post-tag">ios</a>
										<a href="#" class="post-tag">android</a>
										<a href="#" class="post-tag">php</a>
										<a href="#" class="post-tag">mysql</a>
										<a href="#" class="post-tag">ajax</a>
										<a href="#" class="post-tag">jquery</a>
										<a href="#" class="post-tag">node.js</a>
										<a href="#" class="post-tag">hadoop</a>
										<a href="#" class="post-tag">mongoDB</a>
										<a href="#" class="post-tag">Big Data</a>
										<a href="#" class="post-tag">OpenGL</a>
									</td>
								</tr>
								
								<!--div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">1. What is HTML?</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>HTML stands for HyperText Markup Language. HTML is the main markup language for describing the structure of Web pages. <a href="http://www.tutorialrepublic.com/html-tutorial/" target="_blank">Learn more.</a></p>
										</div>
									</div>
								</div-->	
							</tbody>
						</table>
						<div class="col-md-12">
							<legend>Description</legend>
							<p align = "justify" >${articleformattedtext}</p>
						</div>
					</div>
					<div class="col-md-4 column">
						<table class="table">
							<tbody>
								<tr>
									<td>Created: </td>
									<td>${article.getFormattedDate()}</td>
								</tr>
								<tr>
									<td>Updated: </td>
									<td>12/08/11 03:08 AM</td>
								</tr>
								<tr>
									<td>Related recomendations: </td>
									<td>
										<a href="#" class="glyphicon glyphicon-share"><strong>5 приемов изучения японского языка</strong></a>,
										<a href="#" class="glyphicon glyphicon-share">Как правильно варить рис</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--div class="col-md-4 column">
						<div class="list-group">
							 <a href="#" class="list-group-item active">ÐÐ¾ÑÐ¾Ð¶Ð¸Ðµ ÑÐµÐºÐ¾Ð¼ÐµÐ½Ð´Ð°ÑÐ¸Ð¸</a>
							<div class="list-group-item">
								ÐÐ¾Ð»Ð½Ð¾Ðµ Ð¿Ð¾Ð³ÑÑÐ¶ÐµÐ½Ð¸Ðµ
							</div>
							<div class="list-group-item">
								ÐÑÐµÐ¾Ð´Ð¾Ð»ÐµÐ½Ð¸Ðµ Ð´Ð°Ð²ÐºÐ¸
							</div>
							<div class="list-group-item">
								ÐÐ°Ðº Ð²ÑÐ¹ÑÐ¸ Ð¸Ð· Ð¾ÐºÑÑÐ¶ÐµÐ½Ð¸Ñ	
							</div>
						</div>
					</div-->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
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
		});	
	</script>
</body>
</html>