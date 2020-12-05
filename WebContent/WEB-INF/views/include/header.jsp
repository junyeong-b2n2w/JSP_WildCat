<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title><decorator:title default="와일드 냥"/></title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css">
  <link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2/css/select2.min.css" rel="stylesheet" />
  
  <decorator:head />
</head>

  <body>
<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left:50px;margin-right:50px;">
    <a href="<%=request.getContextPath() %>/" class="navbar-brand">
	<strong><i class="fas fa-paw"></i>
        <span class="brand-text font-weight-light"><strong>와일드</strong> 냥</span></strong>
      </a>
    
 
 
    <ul class="navbar-nav mainMenu">
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <c:if test="${empty loginUser}">
	       <li class="nav-item">
	      	<a class="nav-link"  href="<%=request.getContextPath() %>/common/loginForm.do">
	       <i class="fas fa-cat"></i> 로그인
	      </a>
	      </li>
      </c:if>
        <c:if test="${not empty loginUser}">
        	
        	<li class="nav-item">
        	<a class="nav-link"  href="<%=request.getContextPath() %>/member/main.do?mCode=M010000" >
        	
        		<span > <i class="fas fa-paw"></i> ${loginUser.id}</span>
        		</a>
        	</li>
        
        
        
	       <li class="nav-item dropdown">
	      	<a class="nav-link"  href="<%=request.getContextPath() %>/common/logout.do">
	       <i class="fas fa-cat"></i> 로그아웃
	      </a>
	      </li>
      </c:if>
    </ul>
  </nav>
  <div class="container" style="max-width:1600px;">
  <!-- /.navbar -->