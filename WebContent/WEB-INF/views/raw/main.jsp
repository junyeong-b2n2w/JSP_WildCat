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
	<div id="cat_info" class="card card-warning">
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
                        <select class="form-control" id = "mainCate">
                          <option value="">대분류 선택</option>
                          <option value="자묘">자묘</option>
                          <option value="성묘">성묘</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>소분류</label>
                         <select class="form-control" id = "subCate">
						    <option value="">선택</option>
						    
						    
					 <option value="1.2" data-min="1.2">성묘(중성화)</option>
					 <option value="1.4" data-min="1.4">성묘(비중성화)</option>
					 <option value="1.6" data-min="1.6">성묘(활동적인)</option>
					 <option value="1" data-min="1">비만체질</option>
					 <option value="0.8" data-min="0.8">체중감량 필요</option>
					 <option value="1.4" data-min="1.2">체중증량 필요</option>
					 <option value="2" data-min="1.6">임신묘</option>
					 <option value="6" data-min="2">수유묘</option>
					 <option value="1" data-min="1">환자묘</option>
					 <option value="1.4" data-min="1.2">성장기(12개월 이전)</option>
						</select>
                      </div>
                    </div>
                  </div>
                
                
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>몸무게(kg)</label>
                        <input type="text" class="form-control" id="weight" placeholder="Enter ...">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>급여일수</label>
                        <input type="text" class="form-control" id="feedday"  placeholder="Enter ..." >
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
					
					<select class="ingreList form-control ">
  
					</select>
					
         	<div class="form-group" style="margin-top:20px">
                   <table class="table table-condensed">
                  <thead>
                    <tr>
                      <th>식품 리스트</th>
                      <th style="width: 120px"></th>
                      <th style="width: 80px"></th>
                    </tr>
                  </thead>
                  <tbody class="clickedItem" >
                  
                    
                    
                  </tbody>
                </table>
            </div>      


 
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
                    	<td id="rec_cal"></td>
                    	<td id="rec_cal_day"></td>
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
                    	<td id="rec_calcium"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>철</td>
                    	<td>mg</td>
                    	<td id="rec_iron"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>마그네슘</td>
                    	<td>mg</td>
                    	<td id="rec_magnesium"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>인</td>
                    	<td>mg</td>
                    	<td id="rec_phosphorus"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>칼륨</td>
                    	<td>mg</td>
                    	<td id="rec_potassium"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>나트륨</td>
                    	<td>mg</td>
                    	<td id="rec_sodium"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>아연</td>
                    	<td>mg</td>
                    	<td id="rec_zinc"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>구리</td>
                    	<td>mg</td>
                    	<td id="rec_copper"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>망간</td>
                    	<td>mg</td>
                    	<td id="rec_manganese"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>셀레늄</td>
                    	<td>mcg</td>
                    	<td id="rec_selenium"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>요오드</td>
                    	<td>mcg</td>
                    	<td id="rec_iodine"></td>
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
                    	<td id="rec_protein"></td>
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
                    	<td id="rec_fat"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>콜레스테롤</td>
                    	<td>mg</td>
                    	<td id=""></td>
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
                    	<td id="rec_vitaminA"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민B6</td>
                    	<td>mg</td>
                    	<td id="rec_vitaminB6"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민B12</td>
                    	<td>mcg</td>
                    	<td id="rec_vitaminB12"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>티아민</td>
                    	<td>mg</td>
                    	<td id="rec_thiamine"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>리보플라빈</td>
                    	<td>mg</td>
                    	<td id="rec_riboflavin"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>나이아신</td>
                    	<td>mg</td>
                    	<td id="rec_niacin"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>판토텐산</td>
                    	<td>mg</td>
                    	<td id="rec_pantothenic_acid"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>콜린</td>
                    	<td>mg</td>
                    	<td id="rec_choline"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
					<tr>
						<td>폴산</td>
						<td>mcg</td>
						<td id="rec_folic_acid"></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
                    	<td>비타민D</td>
                    	<td>IU</td>
                    	<td id="rec_vitaminD"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민E</td>
                    	<td>IU</td>
                    	<td id="rec_vitaminE"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>비타민K</td>
                    	<td>mcg</td>
                    	<td id="rec_vitaminK"></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td>타우린</td>
                    	<td>mg</td>
                    	<td id="rec_taurine"></td>
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

<%@ include file="main_js.jsp" %>