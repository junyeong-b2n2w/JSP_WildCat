<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.table td{
	padding:0.5rem;
	}
</style>


<div class="text-center " style="padding:20px 10px;">
<h1><i class="fas fa-paw"></i> 생식비율계산기</h1>
</div>



<div class="row">
	
	<!--div left -->
	<div class="col-4">
	
	<!--고양이 정보 -->
	<div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">고양이 정보</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form role="form">
                
                      <div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>대분류</label>
                        <select class="form-control">
                          <option value="">대분류 선택</option>
                          <option value="자묘">자묘</option>
                          <option value="성묘">성묘</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>소분류</label>
                         <select name="rp_airlinecd" id="rp_airlinecd" class="form-control isNotNull" data-value="<?php echo @$_POST['rp_type']?>">
						    <option value="">선택</option>
						</select>
                      </div>
                    </div>
                  </div>
                
                
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>몸무게(kg)</label>
                        <input type="text" class="form-control" placeholder="Enter ...">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>급여일수</label>
                        <input type="text" class="form-control" placeholder="Enter ..." >
                      </div>
                    </div>
                  </div>


                </form>
              </div>
              <!-- /.card-body -->
            </div>
            
            <!-- 메뉴선택 -->
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">레시피</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form role="form">
             
             
             <div class="form-group">
                  <label>select2 찾기 </label>
					
					<select class="js-states form-control ">
  
					</select>
            
            <script>
            	window.onload=function(){
                $('.js-states').select2();
            
            	}
            </script>
            


 
            </div>


                </form>
              </div>
              <!-- /.card-body -->
            </div>
            
            
	</div>
	
	<!-- div right -->
	
	<div class="col-4">
	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">급여 정보</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead class="text-center">                  
                    <tr>
                      <th>#</th>
                      <th>Unit</th>
                      <th>권장량</th>
                      <th>일급여량</th>
                      <th>total</th>
                    </tr>
                  </thead>
                  <tbody style="font-size:0.8em;">
                    <tr>
                    	<td>총량</td>
                    	<td>g</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>열량</td>
                    	<td>kcal</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>수분</td>
                    	<td>ml</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>수분율</td>
                    	<td>%</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>음수량</td>
                    	<td>ml</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td colspan="3">별도급여 음수량</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
	
	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">주요 비율</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead class="text-center">                  
                    <tr>
                      <th>#</th>
                      <th>비율</th>
                      <th>A</th>
                      <th>B</th>
                    </tr>
                  </thead>
                  <tbody style="font-size:0.8em;">
                    <tr>
                    	<td>인 : 칼슘</td>
                    	<td>1 : 1</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>일급여량(mg)</td>
                    	<td>(인:칼슘)</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>오메가3 : 오메가6</td>
                    	<td>1 : 5</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>일급여량(mg)</td>
                    	<td>(오3:오6)</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
	
	
	
	
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">미네랄</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead class="text-center">                  
                    <tr>
                      <th>#</th>
                      <th>Unit</th>
                      <th>권장량</th>
                      <th>일급여량</th>
                      <th>RDI (%)</th>
                    </tr>
                  </thead>
                  <tbody style="font-size:0.8em;">
                    <tr>
                    	<td>칼슘</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>철</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>마그네슘</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>인</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>칼륨</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>나트륨</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>아연</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>구리</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>망간</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>셀레늄</td>
                    	<td>mcg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>요오드</td>
                    	<td>mcg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    
                    
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
	
	</div>
	
	
	
	
	<!-- div right -->
	<div class="col-4">
	
	
		
	
			<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">주요 영양 정보</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead class="text-center">                  
                    <tr>
                      <th>#</th>
                      <th>Unit</th>
                      <th>권장량</th>
                      <th>일급여량</th>
                      <th>RDI (%)</th>
                    </tr>
                  </thead>
                  <tbody style="font-size:0.8em;">
                    <tr>
                    	<td>단백질</td>
                    	<td>g</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>탄수화물</td>
                    	<td>g</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>식이섬유</td>
                    	<td>g</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>당류</td>
                    	<td>g</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>지방</td>
                    	<td>g</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>콜레스테롤</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                   
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">비타민</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead class="text-center">                  
                    <tr>
                      <th>#</th>
                      <th>Unit</th>
                      <th>권장량</th>
                      <th>일급여량</th>
                      <th>RDI (%)</th>
                    </tr>
                  </thead>
                  <tbody style="font-size:0.8em;">
                    <tr>
                    	<td>비타민A</td>
                    	<td>IU</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민B6</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민B12</td>
                    	<td>mcg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>티아민</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>리보플라빈</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>나이아신</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>판토텐산</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>콜린</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
					<tr>
						<td>폴산</td>
						<td>mcg</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
                    	<td>비타민D</td>
                    	<td>IU</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민E</td>
                    	<td>IU</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민K</td>
                    	<td>mcg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>타우린</td>
                    	<td>mg</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
	


	
	
	</div>
</div>

