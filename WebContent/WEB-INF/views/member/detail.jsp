<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="detail-box mt-5">
  <div class="card">
    <div class="card-body register-card-body">
  
    
    
       <form id="modify" action="<%=request.getContextPath() %>/member/modify.do" method="post" >
       
       <div class="input-group mb-3">
       		<label for="id" class="col-sm-2 col-form-label">id</label>
          <input type="text" class="form-control" id ="id" name="id" readOnly value="${loginUser.id }" placeholder="id">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-id-badge"></span>
            </div>
          </div>
        </div>
        
       
        
        <div class="input-group mb-3">
        <label for="pwd" class="col-sm-2 col-form-label">pwd</label>
          <input type="password" id="pwd" class="form-control" name="pwd" readOnly value="${loginUser.pwd }" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
 
        
         <div class="input-group mb-3">
         <label for="name" class="col-sm-2 col-form-label">name</label>
          <input type="text"  id="name"class="form-control" name="name" readOnly value="${loginUser.name }"  placeholder="Full name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        
         <div class="input-group mb-3">
         <label for="email" class="col-sm-2 col-form-label">email</label>
          <input type="email"  id="email" class="form-control" name="email" readOnly value="${loginUser.email }"  placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
       
        
         <div class="input-group mb-3">
        	<div class="input-group">
         <label for="phone" class="col-sm-2 col-form-label">phone</label>
				<select style="width:100px;" name="phone" disabled id="phone" class="form-control float-left">
					<option value="">-선택-</option>
					<option value="010" <c:if test="${fn:substring(loginUser.phone,0,3) eq '010' }" >selected </c:if> >010</option>
					<option value="011" <c:if test="${fn:substring(loginUser.phone,0,3) eq '011' }" >selected </c:if> >011</option>
					<option value="017" <c:if test="${fn:substring(loginUser.phone,0,3) eq '017' }" >selected </c:if> >017</option>
					<option value="018" <c:if test="${fn:substring(loginUser.phone,0,3) eq '018' }" >selected </c:if> >018</option>
				</select>							
				<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-&nbsp;</label>										
				<input style="width:80px;" name="phone" readOnly value="${fn:substring(loginUser.phone,3,7) }" type="text"   class="form-control float-left" />
				<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-</label>
				<input style="width:80px;" name="phone"  readOnly value="${fn:substring(loginUser.phone, 7,11) }" type="text" class="form-control float-right" />						
			</div>
        </div>
        </form>
        
        <div class="row">
         
          <!-- /.col -->
          <div class="col-6 mb-3">
            <button type="button" id="modiBtn" onclick="modi_active();" class="btn btn-warning btn-block">정보 수정하기 </button>
          </div>
           <div class="col-6 mb-3">
            <button type="button" id="deleteBtn" onclick="delete_user();" class="btn btn-danger btn-block">회원 탈퇴 하기 </button>
          </div>
          <!-- /.col -->
        </div>
        
        <script>
        	function modi_active(){
        		$('input[name="pwd"]').attr('readonly',false);
        		$('input[name="email"]').attr('readonly',false);
        		$('input[name="name"]').attr('readonly',false);
        		$('input[name="phone"]').attr('readonly',false);
        		$('select[name="phone"]').attr('disabled',false);
        		
        		$('#modiBtn').removeAttr('onclick');
        		$('#modiBtn').attr('onclick', 'modi_submit();');
        		
        		
        	}
        	
        	function modi_submit(){
        		$('form#modify').submit();
        	
        	}
        	
        	function delete_user(){
        		 if(confirm("회원 탈퇴 하겠냥? "))
        		 {
        		 	alert("회원 탈퇴한다냥");
        		 	location.href="<%=request.getContextPath() %>/member/remove.do?id=${loginUser.id}";
        		 }
        		
        	}
        	
        </script>
        
        
        
        
        
   

			
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->