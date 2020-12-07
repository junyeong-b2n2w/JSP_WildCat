<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
    
<body>
 	
 	
 	<div class="container" style="margin-top:20px; max-width:1500px; font-size:0.85rem">
 		
 		
 		<div class="row">
          <div class="col-4">
          <div class="card card-warning">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">인기 자유게시판</h3>
              
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active">
                        
                        <table class="table table-bordered">
                
	                  <tbody class="hot_freeBoard">
	                    
	                   
	                  </tbody>
                </table>
                        
                        
                          
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
          
          </div>
          
          
          
          <div class="col-4">
          <div class="card card-warning">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">최신 자유게시판 </h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <table class="table table-bordered">
               
                  <tbody class="new_freeBoard">
                   
                  </tbody>
                </table>
                  </div>
      
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
          
          </div>
          
          
          
          
          <!-- /.col (right) -->
          <div class="col-md-4">
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">생식 계산기</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="carousel-item active carousel-item-left">
                      <a href="raw/main.do"><img class="d-block w-75 mx-auto" src="<%=request.getContextPath() %>/resources/i/maincat.jpg" alt="First slide"></a>
                    </div>
                    <div class="carousel-item carousel-item-next carousel-item-left">
                      <a href="raw/main.do"><img class="d-block w-75 mx-auto" src="<%=request.getContextPath() %>/resources/i/maincat.jpg" alt="Second slide"></a>
                    </div>
                    <div class="carousel-item">
                      <a href="raw/main.do"><img class="d-block w-75 mx-auto" src="<%=request.getContextPath() %>/resources/i/maincat.jpg" alt="Third slide"></a>
                    </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          
          
        </div>
 		<!-- row -->
 		
 		<div class="row">
          <div class="col-4">
          <div class="card card-primary">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">인기 소모임게시판</h3>
              
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active">
                        
                        <table class="table table-bordered">
                
	                  <tbody class="hot_meetBoard">
	                    
	                   
	                  </tbody>
                </table>
                        
                        
                          
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
          
          </div>
          
          
          
          <div class="col-4">
          <div class="card card-primary">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">최신 소모임게시판 </h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <table class="table table-bordered">
               
                  <tbody class="new_meetBoard">
                   
                  </tbody>
                </table>
                  </div>
      
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
          
          </div>
          
          
          
          
          <!-- /.col (right) -->
          <div class="col-md-4">
            <div class="card card-info">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3"> 공지사항 </h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <table class="table table-bordered">
               
                  <tbody class="noticeBoard">
                   
                  </tbody>
                </table>
                  </div>
      
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
          
          
        </div>
 		<!-- row -->
 		
 		
 		<!--  -->
 		
 		
          
          </div>
        
 	</div>
 	<%@ include file="index_js.jsp" %>
 	
</body>