<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:1200px;min-width:420px;margin:0 auto;min-height:812px;">
   
    <!-- Main content -->
    <section class="content ">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info" style="font-size:0.85rem;">
					<div class="card-header">
						<h3 class="card-title"><span style="color:gray">[${board.category }]</span>&nbsp;&nbsp;${board.title }</h3>
					</div>
					<div class="card-body">
						
						<div class="row">	
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<input type="text" class="form-control" id="writer" 
									value="${board.writer }" readonly />
							</div>		
							
						
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<input type="text" class="form-control" id="regDate" 
									value="<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd" />" readonly />
							
							</div>
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<input type="text" class="form-control" id="viewcnt" 
									value="${board.viewcnt }" readonly />
							</div>
						</div>		
						<hr>
						<div class="form-group col-sm-12">
							<div id="content" style="border:1px solid #EEEEEE; padding:5px; height:300px">${board.content }</div>	
						</div>
												
					</div>
					<div class="card-footer d-flex flex-row-reverse ">		
						<div>				
						<c:if test="${loginUser.id eq board.writer }">
							<button type="button" id="modifyBtn" class="btn btn-light">수정하기</button>						
						    <button type="button" id="removeBtn" class="btn btn-light">삭제하기</button>		
						    </c:if>			    
						    <button type="button" id="listBtn" class="btn btn-outline-dark">리스트로</button>
						</div>
					</div>									
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
		
		<!-- reply component start --> 
		<div class="row">
			<div class="col-md-12">
				<div class="card card-info">					
					<div class="card-body">
					
						<div id="repliesDiv">
						
						
						
						
						</div>
					
		                
		                
						  		
		                
		                
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0">
								
							</ul>
						</div>
					</div>
					<div class="card-footer">
						
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginUser.id }"> 
						<label for="newReplyText">댓글 입력</label>
						<input class="form-control" type="text"	 id="newReplyText">
						<br/>
						<button type="button" class="btn btn-primary" id="replyAddBtn">댓글달기</button>
					</div>				
				</div>			
				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <form role="form">
  	<input type='hidden' name='bno' value ="${board.bno}">
  	<input type='hidden' name='page' value ="${param.page}">
    <input type='hidden' name='perPageNum' value ="${param.perPageNum}">
    <input type='hidden' name="searchType" 
		         value="${param.searchType }" />
	<input type='hidden' name="keyword" 
		         value="${param.keyword }" />
  </form>

<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
           <span>수정하기</span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" id="replyModBtn">수정</button>
        <button type="button" class="btn btn-light" id="replyDelBtn">삭제</button>
        <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div id="replyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <span>답글쓰기</span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" id="replyPrno" data-prno>
        <p><input type="text" id="rereplytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light" id="reReplyBtn">답글달기</button>
        <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="reply_js.jsp" %>






















  