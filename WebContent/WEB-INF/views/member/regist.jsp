<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
<title>와일드냥 회원가입</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  

  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
   <a href="<%=request.getContextPath() %>/"><b>와일드</b>냥 <i class="fas fa-paw"></i></a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">너 내 동료가 되라냥 <i class="fas fa-paw"></i></p>

      <form action="regist.do" role="form" method="post">
      
       <div class="input-group mb-3">
          <input type="text" class="form-control" name="id" placeholder="id">
          <div class="input-group-append">
				<button type="button" onclick="idCheck_go();"  class="btn btn-warning btn-xs btn-append">중복확인</button>
          </div>
        </div>
        
       
        
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="pwd" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
         <div class="input-group mb-3">
          <input type="text" class="form-control" name="name" placeholder="Full name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        
         <div class="input-group mb-3">
          <input type="email" class="form-control" name="email" placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
       
        
         <div class="input-group mb-3">
        	<div class="input-group">
				<select style="width:100px;" name="phone" id="phone" class="form-control float-left">
					<option value="">-선택-</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="018">018</option>
				</select>							
				<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-&nbsp;</label>										
				<input style="width:80px;" name="phone" type="text" class="form-control float-left" />
				<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-</label>
				<input style="width:80px;" name="phone" type="text" class="form-control float-right" />						
			</div>
        </div>
        
        
        <div class="row">
         
          <!-- /.col -->
          <div class="col-12 mb-3">
            <button type="button" onclick="submit_go();" class="btn btn-warning btn-block">동료가될거다냥</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

 

      <a href="<%=request.getContextPath() %>/common/loginForm.do" class="text-center">난 이미 동료다 냥 <i class="fas fa-paw"></i></a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<%@ include file="regist_js.jsp" %>
</body>
</html>
