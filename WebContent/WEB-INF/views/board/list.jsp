<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <!-- Main content -->
    	<section class="content mt-3">
    	  <div class="card">    		
    	  	<div class="card-header with-border">
    	  		<button type="button" class="btn btn-sm btn-warning" onclick="" >새 글 등록</button>
    	  		<div id="keyword" class="card-tools" style="width:550px;">
				  <div class="input-group row">	
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
		    			<tr>
		                	<th scope="col">글번호</th>
		                	<th scope="col">글 제목</th>
		                	<th scope="col">작성자</th>
		                	<th scope="col">작성일</th>
		                	<th scope="col">조회수</th> <!-- yyyy-MM-dd  -->
		               	</tr>
		               	<tr>
		               		<td>
		               			1
		               		</td>
		               		<td><a href="#">글 제목 1</a> </td>
		               		<td>작성자 1 </td>
		               		<td>작성일</td>
		               		<td>
		               			2013-12-12
		               		</td>
		               	</tr>
		               
		               
		               
		    		</table>
    		   </div> <!-- col-sm-12 -->
    		 </div> <!-- row -->
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
          </div> <!-- card  -->
         </div>
    	</section>	
