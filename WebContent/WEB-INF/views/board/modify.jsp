<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!-- Content Wrapper. Contains page content -->
  <div >

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header row">
						<h4 class="col-md-8">글수정</h4>
						<div class="col-md-4">
							<div class="float-right">
								<button type="button" class="btn btn-warning" id="modifyBtn">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default " id="cancelBtn">취 소</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify.do" name="modifyForm">
							
							<input type="hidden" name="bno" value="${board.bno }" />
							<input type='hidden' name='page' value="${param.page}">
							<input type='hidden' name='perPageNum' value="${param.perPageNum}">
							<input type='hidden' name='searchType' value="${param.searchType}">
							<input type='hidden' name='keyword' value="${param.keyword}">
							
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" value="${board.title }"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly
									name="writer" class="form-control" value="${board.writer }">
							</div>
							
							<div class="form-group ">
								<label for="category">카테고리</label> 
								 <select class="form-control" name="category" id ="category">
							 		<option value="">카테고리</option>
							 			<c:if test="${board.gb eq'자유게시판' }">
									 		<option value="냥자랑" ${cri.category =='냥자랑' ? 'selected' : '' }>냥자랑</option>
									 		<option value="꿀팁전수" ${cri.category =='꿀팁전수' ? 'selected' : '' }>꿀팁전수</option>
									 		<option value="테스트1" ${cri.category =='테스트1' ? 'selected' : '' }>테스트1</option>
								 		</c:if>
								 		<c:if test="${board.gb eq'공지사항' }">
									 		<option value="이벤트" ${cri.category =='이벤트' ? 'selected' : '' }>이벤트</option>
									 		<option value="긴급공지" ${cri.category =='긴급공지' ? 'selected' : '' }>긴급공지</option>
									 		<option value="테스트1" ${cri.category =='테스트1' ? 'selected' : '' }>테스트1</option>
								 		</c:if>
								 			<c:if test="${board.gb eq'소모임게시판' }">
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
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="3"
									placeholder="500자 내외로 작성하세요.">${fn:escapeXml(board.content) }</textarea>
							</div>
							
							
							
							
						</form>
					</div><!--end card-body  -->
					
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
	
	$('#modifyBtn').on('click',function(e){				
		var title=$('input[name="title"]');
		if(title.val()==""){
			alert("제목은 필수입니다.");			
			title.focus();
			return;
		}
		var form=document.modifyForm;		
		form.submit();
	});
	
	$('#cancelBtn').on('click',function(e){
		history.go(-1);
	});
}
</script>







  