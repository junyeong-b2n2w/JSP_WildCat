<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Content Wrapper. Contains page content -->
  <div style="min-height:812px;">

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">글등록</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group ">
								<label for="title">게시판</label> 
								<input type="text" id="gb"
									name='gb' value="${gb}" readonly class="form-control">
							</div>		
							<div class="form-group ">
								<label for="category">카테고리</label> 
								 <select class="form-control" name="category" id ="category">
							 		<option value="">카테고리</option>
							 			<c:if test="${gb eq'자유게시판' }">
									 		<option value="냥자랑" ${cri.category =='냥자랑' ? 'selected' : '' }>냥자랑</option>
									 		<option value="꿀팁전수" ${cri.category =='꿀팁전수' ? 'selected' : '' }>꿀팁전수</option>
									 		<option value="테스트1" ${cri.category =='테스트1' ? 'selected' : '' }>테스트1</option>
								 		</c:if>
								 		<c:if test="${gb eq'공지사항' }">
									 		<option value="이벤트" ${cri.category =='이벤트' ? 'selected' : '' }>이벤트</option>
									 		<option value="긴급공지" ${cri.category =='긴급공지' ? 'selected' : '' }>긴급공지</option>
									 		<option value="테스트1" ${cri.category =='테스트1' ? 'selected' : '' }>테스트1</option>
								 		</c:if>
								 			<c:if test="${gb eq'소모임게시판' }">
									 		<option value="서울" ${cri.category =='서울' ? 'selected' : '' }>서울</option>
									 		<option value="경기" ${cri.category =='경기' ? 'selected' : '' }>경기</option>
									 		<option value="충남" ${cri.category =='충남' ? 'selected' : '' }>충남</option>
									 		<option value="충북" ${cri.category =='충북' ? 'selected' : '' }>충북</option>
									 		<option value="경남" ${cri.category =='경남' ? 'selected' : '' }>경남</option>
									 		<option value="경북" ${cri.category =='경북' ? 'selected' : '' }>경북</option>
									 		<option value="전남" ${cri.category =='전남' ? 'selected' : '' }>전남</option>
									 		<option value="전북" ${cri.category =='전북' ? 'selected' : '' }>전북</option>
									 		<option value="강원" ${cri.category =='강원' ? 'selected' : '' }>강원</option>
									 		<option value="제주" ${cri.category =='제주' ? 'selected' : '' }>제주</option>
								 		</c:if>
							 	</select>
							</div>	
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly
									name="writer" class="form-control" value="${loginUser.id }">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." ></textarea>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<script>

window.onload=function(){
	SmartEditor_summernote($('#content'));


	$('#registBtn').on('click',function(e){
		//alert("regist click");
		var form=document.registForm;
		
		if(form.title.value==""){
			alert("제목은 필수입니다.");
			return;
		}
		
		if(form.content.value.length>1000){
			alert("글자수가 1000자를 초과할 수 없습니다.");
			return;
		}
		
		form.submit();
	});
	
	$('#cancelBtn').on('click',function(e){
		//alert("cancel btn click");
		window.opener.location.href='list.do';
		window.close();
	});
}

</script>







  