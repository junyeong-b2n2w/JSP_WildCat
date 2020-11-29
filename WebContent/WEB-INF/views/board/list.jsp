<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <!-- Main content -->
   <c:set var="pageMaker" value="${dataMap.pageMaker }" />	
   <c:set var="cri" value="${dataMap.pageMaker.cri }" />	
   
    	<section class="content mt-3">
    	  <div class="card">    		
    	  	<div class="card-header with-border">
    	  		<h1>${dataMap.cri.gb }</h1>
    	  		<button type="button" class="btn btn-sm btn-warning" onclick="location.href='registForm.do?gb=${cri.gb}'" >새 글 등록</button>
    	  		<div id="keyword" class="card-tools" style="width:550px;">
				  <div class="input-group row">	
				  <select class="form-control col-md-3" name="category" id ="category">
				 		<option value="">카테고리</option>
				 		<c:if test="${cri.gb eq'자유게시판' }">
					 		<option value="냥자랑" ${cri.category =='냥자랑' ? 'selected' : '' }>냥자랑</option>
					 		<option value="꿀팁전수" ${cri.category =='꿀팁전수' ? 'selected' : '' }>꿀팁전수</option>
					 		<option value="테스트1" ${cri.category =='테스트1' ? 'selected' : '' }>테스트1</option>
				 		</c:if>
				 		<c:if test="${cri.gb eq'공지사항' }">
					 		<option value="이벤트" ${cri.category =='이벤트' ? 'selected' : '' }>이벤트</option>
					 		<option value="긴급공지" ${cri.category =='긴급공지' ? 'selected' : '' }>긴급공지</option>
					 		<option value="테스트1" ${cri.category =='테스트1' ? 'selected' : '' }>테스트1</option>
				 		</c:if>
				 			<c:if test="${cri.gb eq'소모임게시판' }">
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
				  <!-- sort num -->
				 	<select class="form-control col-md-3" name="perPageNum" id ="perPageNum">
				 		<option value="10">정렬갯수</option>
				 		<option value="2" ${cri.perPageNum ==2 ? 'selected' : '' }>2개씩</option>
				 		<option value="3" ${cri.perPageNum ==3 ? 'selected' : '' }>3개씩</option>
				 		<option value="5" ${cri.perPageNum ==5 ? 'selected' : '' }>5개씩</option>
				 	</select>
					
					<!--search bar -->
					<select class="form-control col-md-3" name="searchType" id ="searchType">
				 		<option value="" ${cri.searchType eq '' ? 'selected' : '' }>검색구분</option>
				 		<option value="t" ${cri.searchType eq 't' ? 'selected' : '' }>제목</option>
				 		<option value="a" ${cri.searchType eq 'a' ? 'selected' : '' }>작성자</option>
				 	</select>
				 	
				 	
				 	<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
				 	<input class="form-control" type="hidden" name="gb" placeholder="검색어를 입력하세요." value="${cri.gb }"/>
				 	
				 	<span class="input-group-append">
						<button class="btn btn-warning" type="button" id="searchBtn"
						data-card-widget="search" onclick="searchList_go(1);">
							<i class="fa fa-fw fa-search"></i>
						</button>				 	
				 	</span>
				 	<!-- end : search bar -->
				  </div>
				 </div>    	  		
    	  	</div>	  
    		<div class="card-body" style="text-align:center;">
    		  <div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr  style="font-size:0.85em;">
		                	<th style="width:10%;">글번호</th>
		                	<th style="width:15%;">카테고리</th>
		                	<th style="width:48%;">글 제목</th>
		                	<th style="width:10%;">작성자</th>
		                	<th style="width:10%;">작성일</th>
		                	<th style="width:7%;">조회수</th> <!-- yyyy-MM-dd  -->
		               	</tr>
		           <c:if test="${empty dataMap.boardList }" >
						<tr>
							<td colspan="6">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${dataMap.boardList }" var="board">
						<tr style='font-size:0.75em;'>
							<td>${board.bno }</td>
							<td style="color:gray;">${board.category }</td>
							<td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
							<a href="detail.do?bno=${board.bno }">
								<span class="col-sm-12 ">${board.title }
								</span>
							</a>
							</td>
							<td>${board.writer }</td>
							<td>
								<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><span class="badge bg-red">${board.viewcnt }</span></td>
						</tr>
					</c:forEach>
		               
		               
		               
		    		</table>
    		   </div> <!-- col-sm-12 -->
    		 </div> <!-- row -->
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
          </div> <!-- card  -->
         </div>


	
    	</section>	
    	
    	
    	    
    <!-- /.content -->

  <!-- /.content-wrapper -->

   	
