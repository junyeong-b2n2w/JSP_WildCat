<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/x-handlebars-template"  id="ingre-list-template" >
{{#each .}}
<option class="ingre" value="{{ingNo}}">{{ingName}}</option>
{{/each}}	
</script>
    
    <script type="text/x-handlebars-template"  id="ingre-item-template" >
{{#each .}}
 <tr id="ing-{{ingNo}}">
                      <td>
                      	{{ingName}} 
                      </td>
                      <td class="row">
                      	<input type="text" class="form-control ingreInput" data-ingNo={{ingNo}} style="width:70%;margin-right:5px;" placeholder="">&nbsp;{{unit}}
                      </td>
                      <td>
                    <button type="button" class="btn " onclick="removeIngre({{ingNo}})" ><i class="fas fa-times"></i></button>
                      </td>
                    </tr>
                    


{{/each}}	
</script>
    

   <script>
   
   				var growth_base = {
   						"protein" : 75,
   						"fat":22.5,
   						"calcium":2.5, 
   						"phosphorus" :2,
   						"potassium" :1.5,
   						"sodium" :0.5,
   						"magnesium" :0.2,
   						"iron" :20,
   						"copper":2.1,
   						"manganese": 1.9,
   						"zinc" :18.8,
   						"iodine" :0.45,
   						"selenium": 0.075,
   						"vitaminA":1667,
   						"vitaminD" :70,
   						"vitaminE":10,
   						"vitaminK" :0.025,
   						"thiamine" :1.4,
   						"riboflavin" :1,
   						"pantothenic_acid":1.44, 
   						"niacin" :15,
   						"vitaminB6" :1,
   						"folic_acid" :0.2,
   						"vitaminB12" :0.005,
   						"choline":600,
   						"taurine":0.5
   						
   				}
   				
   				var adult_base = {
   						"protein" : 65,
   						"fat":22.5,
   						"calcium":1.5, 
   						"phosphorus" :1.25,
   						"potassium" :1.5,
   						"sodium" :0.5,
   						"magnesium" :0.1,
   						"iron" :20,
   						"copper":1.25,
   						"manganese": 1.9,
   						"zinc" :18.8,
   						"iodine" :0.15,
   						"selenium": 0.075,
   						"vitaminA":833,
   						"vitaminD" :70,
   						"vitaminE":10,
   						"vitaminK" :0.025,
   						"thiamine" :1.4,
   						"riboflavin" :1,
   						"pantothenic_acid":1.44, 
   						"niacin" :15,
   						"vitaminB6" :1,
   						"folic_acid" :0.2,
   						"vitaminB12" :0.005,
   						"choline":600,
   						"taurine":0.5
   				}
   				
 	// 권장량 데이터   				
	function recommend_data(base , max_cal){
   			$('#rec_protein').text(	max_cal * 0.001 * base.protein );
   			$('#rec_fat').text(		max_cal * 0.001 * base.fat);
   			$('#rec_calcium').text(		max_cal  * base.calcium); 
   			$('#rec_phosphorus').text(max_cal * 0.001 * base.phosphorus);
   			$('#rec_potassium').text(max_cal * base.potassium);
   			$('#rec_sodium').text(max_cal * 0.001 * base.sodium);
   			$('#rec_magnesium').text(max_cal * base.magnesium);
   			$('#rec_iron').text(max_cal * 0.001 * base.iron);
   			$('#rec_copper').text(max_cal * 0.001 * base.copper);
   			$('#rec_manganese').text(max_cal * 0.001 * base.manganese);
   			$('#rec_zinc').text(max_cal  * base.zinc);
   			$('#rec_iodine').text(max_cal * 0.001 * base.iodine);
   			$('#rec_selenium').text(max_cal* base.selenium);
   			$('#rec_vitaminA').text(max_cal * 0.001 * base.vitaminA);
   			$('#rec_vitaminD').text(max_cal * 0.001 * base.vitaminD);
   			$('#rec_vitaminE').text(max_cal * 0.001 * base.vitaminE);
   			$('#rec_vitaminK').text(max_cal * base.vitaminK);
   			$('#rec_thiamine').text(max_cal * 0.001 * base.thiamine);
   			$('#rec_riboflavin').text(max_cal * 0.001 * base.riboflavin);
   			$('#rec_pantothenic_acid').text(max_cal * 0.001 * base.pantothenic_acid); 
   			$('#rec_niacin').text(max_cal * 0.001 * base.niacin);
   			$('#rec_vitaminB6').text(max_cal * 0.001 * base.vitaminB6);
   			$('#rec_folic_acid').text(max_cal  * base.folic_acid);
   			$('#rec_vitaminB12').text(max_cal  * base.vitaminB12);
   			$('#rec_choline').text(max_cal * 0.001 * base.choline);
   			$('#rec_taurine').text(max_cal  * base.taurine);
   				}
   				
   	function total_ingre(){
   		 
   		sum_arr = []
   		// 리스트 더하기
   		for( var i =0; i< calcArr.length; i++){
   			//console.log(calcArr[i])
   			
   			//계산 객체
			var hud = calcArr[i].value * 0.01;
	   		sum_arr = {		
	   				"calcium":	( sum_arr.calcium ? sum_arr.calcium : 0 )+calcArr[i].calcium * hud,
	   				"calories": (sum_arr.calories ? sum_arr.calories	: 0 )+ calcArr[i].calories	* hud,
					"carbohydrates": (sum_arr.carbohydrates	? sum_arr.carbohydrates	: 0 )+ calcArr[i].carbohydrates * hud	,
					"cholesterol": (sum_arr.cholesterol	? sum_arr.cholesterol	: 0) + calcArr[i].cholesterol * hud	,
					"choline": (sum_arr.choline	? sum_arr.choline	: 0 )+ calcArr[i].choline	* hud,
					"copper": (sum_arr.copper	? sum_arr.copper	: 0 )+ calcArr[i].copper	* hud,
					"dietaryfiber":( sum_arr.dietaryfiber	? sum_arr.dietaryfiber	: 0 )+ calcArr[i].dietaryfiber	* hud,
					"fat": (sum_arr.fat	? sum_arr.fat	: 0 )+ calcArr[i].fat	* hud,
					"folate": (sum_arr.folate	? sum_arr.folate	: 0) + calcArr[i].folate	* hud,
					"iodine": (sum_arr.iodine	? sum_arr.iodine	: 0 )+ calcArr[i].iodine	* hud * 1000,
					"iron": (sum_arr.iron	? sum_arr.iron	: 0 )+ calcArr[i].iron	* hud,
					"magnesium": (sum_arr.magnesium	? sum_arr.magnesium	: 0 )+ calcArr[i].magnesium	* hud,
					"manganese": (sum_arr.manganese	? sum_arr.manganese	: 0 )+ calcArr[i].manganese	* hud,
					"niacin": (sum_arr.niacin	? sum_arr.niacin	: 0) + calcArr[i].niacin	* hud,
					"omega3": (sum_arr.omega3	? sum_arr.omega3	: 0) + calcArr[i].omega3	* hud,
					"omega6": (sum_arr.omega6	? sum_arr.omega6	: 0) + calcArr[i].omega6	* hud,
					"pantothenicacid": (sum_arr.pantothenicacid	? sum_arr.pantothenicacid	: 0 )+ calcArr[i].pantothenicacid	* hud,
					"phosphorus":( sum_arr.phosphorus	? sum_arr.phosphorus	: 0) + calcArr[i].phosphorus	* hud ,
					"potassium":( sum_arr.potassium	? sum_arr.potassium	: 0)+ calcArr[i].potassium	* hud,
					"protein": (sum_arr.protein	? sum_arr.protein	: 0) + calcArr[i].protein	* hud,
					"riboflavin":( sum_arr.riboflavin	? sum_arr.riboflavin	: 0 )+ calcArr[i].riboflavin	* hud,
					"selenium": (sum_arr.selenium	? sum_arr.selenium	: 0 )+ calcArr[i].selenium* hud,
					"sodium": (sum_arr.sodium	? sum_arr.sodium	: 0) + calcArr[i].sodium	* hud * 1000,
					"sugars": (sum_arr.sugars	? sum_arr.sugars	: 0) + calcArr[i].sugars	* hud,
					"taurine": (sum_arr.taurine	? sum_arr.taurine	: 0) + calcArr[i].taurine	* hud,
					"thiamin": (sum_arr.thiamin	? sum_arr.thiamin	: 0) + calcArr[i].thiamin	* hud,
					"vitaminA": (sum_arr.vitaminA	? sum_arr.vitaminA	: 0 )+ calcArr[i].vitaminA	* hud,
					"vitaminB6": (sum_arr.vitaminB6	? sum_arr.vitaminB6	: 0) + calcArr[i].vitaminB6	* hud,
					"vitaminB12": (sum_arr.vitaminB12	? sum_arr.vitaminB12	: 0) + calcArr[i].vitaminB12	* hud *1000 ,
					"vitaminC": (sum_arr.vitaminC	? sum_arr.vitaminC	: 0 )+ calcArr[i].vitaminC	* hud,
					"vitaminD": (sum_arr.vitaminD	? sum_arr.vitaminD	: 0 )+ calcArr[i].vitaminD	* hud,
					"vitaminE": (sum_arr.vitaminE	? sum_arr.vitaminE	: 0 )+ calcArr[i].vitaminE	* hud,
					"vitaminK": (sum_arr.vitaminK	? sum_arr.vitaminK	: 0 )+ calcArr[i].vitaminK	* hud,
					"water": (sum_arr.water	? sum_arr.water	: 0 )+ calcArr[i].water	* hud,
					"zinc": (sum_arr.zinc	? sum_arr.zinc	: 0 )+ calcArr[i].zinc	* hud / 1000 ,
					"weight" : (sum_arr.weight	? sum_arr.weight	: 0 )+ calcArr[i].value,
	   		}
   		}
   		
   		console.log("sumarr", sum_arr);
   		
   		//랜더링
   		
   		//--급여 정보 
   		//총량
   		$('#tot_weight').text(sum_arr.weight);
   		$('#day_weight').text( parseFloat( sum_arr.weight) / parseInt($('#feedday').val()));
   		
   		//칼로리
   		$('#tot_cal').text(sum_arr.calories)
   		$('#day_cal').text( parseFloat( sum_arr.calories ) / parseInt( $('#feedday').val()));
   		
   		//수분
   		$('#tot_water').text(sum_arr.water)
   		$('#day_water').text( parseFloat( sum_arr.water ) / parseInt( $('#feedday').val()));
   		$('#day_water_per').text( parseFloat( $('#day_water').text() ) / parseFloat( $('#day_weight').text())  *100 )
   		$('#day_water2').text( parseFloat($('#tot_water').text())   /   parseInt( $('#feedday').val())  )
   		
   		$('#eat_water').text( parseFloat( $('#rec_water').text()) -  parseFloat( $('#day_water2').text()) )
   	
   		
   		
   		
   		//--주요 영양정보 
   		//단백질 
   		$('#day_protein').text( parseFloat(sum_arr.protein) / parseInt( $('#feedday').val()))
   		$('#rdi_protein').text( parseFloat(  $('#day_protein').text() ) /   parseFloat(  $('#rec_protein').text()  ) * 100 + " %" )
   		
   		//지방
   		
   		$('#day_fat').text( parseFloat(sum_arr.fat) / parseInt( $('#feedday').val())   )
   		$('#rdi_fat').text( parseFloat(  $('#day_fat').text() ) /   parseFloat(  $('#rec_fat').text()  ) * 100 + " %" )
   		
   		//콜레스테롤
   		$('#day_cholesterol').text(parseFloat(sum_arr.carbohydrates) / parseInt( $('#feedday').val()) )
   		
   		
   		//--미네랄 
   		//칼슘
   		$('#day_calcium').text( parseFloat(sum_arr.calcium) / parseInt( $('#feedday').val())   )
   		$('#rdi_calcium').text( parseFloat(  $('#day_calcium').text() ) /   parseFloat(  $('#rec_calcium').text()  ) * 100 + " %" )
   		
   		//철
   		$('#day_iron').text( parseFloat(sum_arr.iron) / parseInt( $('#feedday').val())   )
   		$('#rdi_iron').text( parseFloat(  $('#day_iron').text() ) /   parseFloat(  $('#rec_iron').text()  ) * 100 + " %" )
   		
   		//마그네슘
   		$('#day_magnesium').text( parseFloat(sum_arr.magnesium) / parseInt( $('#feedday').val())   )
   		$('#rdi_magnesium').text( parseFloat(  $('#day_magnesium').text() ) /   parseFloat(  $('#rec_magnesium').text()  ) * 100 + " %" )
   		
   		//인
		$('#day_phosphorus').text( parseFloat(sum_arr.phosphorus) / parseInt( $('#feedday').val())   )
   		$('#rdi_phosphorus').text( parseFloat(  $('#day_phosphorus').text() ) /   parseFloat(  $('#rec_phosphorus').text()  ) * 100 + " %" )
   		
   		//칼륨
   		$('#day_potassium').text( parseFloat(sum_arr.potassium) / parseInt( $('#feedday').val())   )
   		$('#rdi_potassium').text( parseFloat(  $('#day_potassium').text() ) /   parseFloat(  $('#rec_potassium').text()  ) * 100 + " %" )
   		
   		//나트륨
   		$('#day_sodium').text( parseFloat(sum_arr.sodium) / parseInt( $('#feedday').val())   )
   		$('#rdi_sodium').text( parseFloat(  $('#day_sodium').text() ) /   parseFloat(  $('#rec_sodium').text()  ) * 100 + " %" )
   		
   		//아연
   		$('#day_zinc').text( parseFloat(sum_arr.zinc) / parseInt( $('#feedday').val())   )
   		$('#rdi_zinc').text( parseFloat(  $('#day_zinc').text() ) /   parseFloat(  $('#rec_zinc').text()  ) * 100 + " %" )
   		
   		//구리
   		$('#day_copper').text( parseFloat(sum_arr.copper) / parseInt( $('#feedday').val())   )
   		$('#rdi_copper').text( parseFloat(  $('#day_copper').text() ) /   parseFloat(  $('#rec_copper').text()  ) * 100 + " %" )
   	
   		//망간
   		$('#day_manganese').text( parseFloat(sum_arr.manganese) / parseInt( $('#feedday').val())   )
   		$('#rdi_manganese').text( parseFloat(  $('#day_manganese').text() ) /   parseFloat(  $('#rec_manganese').text()  ) * 100 + " %" )
   		
   		
   		//셀레늄
   		$('#day_selenium').text( parseFloat(sum_arr.selenium) / parseInt( $('#feedday').val())   )
   		$('#rdi_selenium').text( parseFloat(  $('#day_selenium').text() ) /   parseFloat(  $('#rec_selenium').text()  ) * 100 + " %" )
   		
   		
   		//요오드 
   		$('#day_iodine').text( parseFloat(sum_arr.iodine) / parseInt( $('#feedday').val())   )
   		$('#rdi_iodine').text( parseFloat(  $('#day_iodine').text() ) /   parseFloat(  $('#rec_iodine').text()  ) * 100 + " %" )
   		
   		
   		
   		//비타민 
   		//비타민A
   		$('#day_vitaminA').text( parseFloat(sum_arr.vitaminA) / parseInt( $('#feedday').val())   )
   		$('#rdi_vitaminA').text( parseFloat(  $('#day_vitaminA').text() ) /   parseFloat(  $('#rec_vitaminA').text()  ) * 100 + " %" )
   		
   		//비타민B6
   		$('#day_vitaminB6').text( parseFloat(sum_arr.vitaminB6) / parseInt( $('#feedday').val())   )
   		$('#rdi_vitaminB6').text( parseFloat(  $('#day_vitaminB6').text() ) /   parseFloat(  $('#rec_vitaminB6').text()  ) * 100 + " %" )
   		
   		
   		//비타민B12
   		$('#day_vitaminB12').text( parseFloat(sum_arr.vitaminB12) / parseInt( $('#feedday').val()) / 1000  )
   		$('#rdi_vitaminB12').text( parseFloat(  $('#day_vitaminB12').text() ) /   parseFloat(  $('#rec_vitaminB12').text()  ) * 100 + " %" )
   		
   		//티아민
   		$('#day_thiamine').text( parseFloat(sum_arr.thiamin) / parseInt( $('#feedday').val())   )
   		$('#rdi_thiamine').text( parseFloat(  $('#day_thiamine').text() ) /   parseFloat(  $('#rec_thiamine').text()  ) * 100 + " %" )
   		
   		//리보플라빈
   		$('#day_riboflavin').text( parseFloat(sum_arr.riboflavin) / parseInt( $('#feedday').val())   )
   		$('#rdi_riboflavin').text( parseFloat(  $('#day_riboflavin').text() ) /   parseFloat(  $('#rec_riboflavin').text()  ) * 100 + " %" )
   		
   		//나이아신
   		$('#day_niacin').text( parseFloat(sum_arr.niacin) / parseInt( $('#feedday').val())   )
   		$('#rdi_niacin').text( parseFloat(  $('#day_niacin').text() ) /   parseFloat(  $('#rec_niacin').text()  ) * 100 + " %" )
   		
   		//판토텐산
   		$('#day_pantothenic_acid').text( parseFloat(sum_arr.pantothenicacid) / parseInt( $('#feedday').val())   )
   		$('#rdi_pantothenic_acid').text( parseFloat(  $('#day_pantothenic_acid').text() ) /   parseFloat(  $('#rec_pantothenic_acid').text()  ) * 100 + " %" )
   		
   		//콜린
   		$('#day_choline').text( parseFloat(sum_arr.choline) / parseInt( $('#feedday').val())   )
   		$('#rdi_choline').text( parseFloat(  $('#day_choline').text() ) /   parseFloat(  $('#rec_choline').text()  ) * 100 + " %" )
   		
   		
   		//폴산
   		$('#day_folic_acid').text( parseFloat(sum_arr.folate) / parseInt( $('#feedday').val())   )
   		$('#rdi_folic_acid').text( parseFloat(  $('#day_folic_acid').text() ) /   parseFloat(  $('#rec_folic_acid').text()  ) * 100 + " %" )
   		
   		//비타민D
   		$('#day_vitaminD').text( parseFloat(sum_arr.vitaminD) / parseInt( $('#feedday').val())   )
   		$('#rdi_vitaminD').text( parseFloat(  $('#day_vitaminD').text() ) /   parseFloat(  $('#rec_vitaminD').text()  ) * 100 + " %" )
   		
   		//비타민E
   		$('#day_vitaminE').text( parseFloat(sum_arr.vitaminE) / parseInt( $('#feedday').val())   )
   		$('#rdi_vitaminE').text( parseFloat(  $('#day_vitaminE').text() ) /   parseFloat(  $('#rec_vitaminE').text()  ) * 100 + " %" )
   		
   		//비타민K
   		$('#day_vitaminK').text( parseFloat(sum_arr.vitaminK) / parseInt( $('#feedday').val())   )
   		$('#rdi_vitaminK').text( parseFloat(  $('#day_vitaminK').text() ) /   parseFloat(  $('#rec_vitaminK').text()  ) * 100 + " %" )
   		
   		//타우린
   		$('#day_taurine').text( parseFloat(sum_arr.taurine) / parseInt( $('#feedday').val())   )
   		$('#rdi_taurine').text( parseFloat(  $('#day_taurine').text() ) /   parseFloat(  $('#rec_taurine').text()  ) * 100 + " %" )
   		
   		
   		//주요 비율
   		// 인 : 칼슘 
   		$('#tot_phosphorus').text( parseFloat(sum_arr.phosphorus) /  parseInt( $('#feedday').val()) )
   		$('#tot_calcium').text( parseFloat(sum_arr.calcium) /  parseInt( $('#feedday').val()) )
   		$('#pho_cal').text(  parseFloat(  $('#tot_calcium').text() ) /   parseFloat(  $('#tot_phosphorus').text()  ) )
   		
   		//오3 오6
   		$('#tot_omega3').text( parseFloat(sum_arr.omega3) /  parseInt( $('#feedday').val()) )
   		$('#tot_omega6').text( parseFloat(sum_arr.omega6) /  parseInt( $('#feedday').val()) )
   		$('#om3_om6').text(  parseFloat(  $('#tot_omega6').text() ) /   parseFloat(  $('#tot_omega3').text()  )  )
   		
   		
   	}			
   	
    calcArr = [];
   	
 	sum_arr=[]
    
 	window.onload=function(){
            	
 				// 레시피 리스트 얻어오기
           		$.getJSON("<%=request.getContextPath()%>/raw/ingreList.do",function(data){
           			//console.log(data)
           			printData(data.results, $('.ingreList'), $('#ingre-list-template'));
           		});	
            		
                $('.ingreList').select2();

                
                
                // 선택된 레시피 선택 리스트에 추가히기
                $('.ingreList').on('select2:select',function(){
                	
                	$.getJSON("<%=request.getContextPath()%>/raw/ingre.do?ingNo="+ this.value ,function(data){
               			
               			clickedIngre(data, $('.clickedItem')  ,$('#ingre-item-template'));
               			
               			const thisarr = {
               					...data[0],
               					value:0
               			}
               			
               			calcArr.push(thisarr);
               			//console.log(calcArr)
               			
               			
               		});	
                	
                	
                })
            	

                $('.clickedItem').on('change', 'td input[type="text"]', function(){
                	
                	var index = calcArr.findIndex(ingre => ingre.ingNo === $(this).data("ingno")); 
                	calcArr[index].value = parseFloat(this.value)
                	
                	total_ingre();
                })
                
                
                //권장량 계산
                
                //cat info
                
                $('#cat_info').on('change', function(){
                	
                		//cal	
                	  var cal = $('#weight').val() * 30 + 70 ;
                	  var max_cal = parseFloat($('#subCate').val()) * cal;
                	  var water = 	($('#weight').val() ** 0.75) * 70 *1.2 ;
                	  
                	  console.log(max_cal)
                      $('#rec_cal').text(max_cal) ;
                	  $('#rec_water').text(water) ;
                      if($('#mainCate').val()== "자묘"){
                    	  recommend_data( growth_base ,max_cal)
                      }else if($('#mainCate').val() == "성묘"){
                    	  recommend_data( adult_base ,max_cal)
                      }
                      
                     
                })
                
       	}
            	
 				// 리스트에서 해당재료 지우기
            	function removeIngre(ingNo){
            		
            		if (calcArr){
            			const index = calcArr.findIndex(ingre => ingre.ingNo === ingNo); 
            			console.log("idx" , index);
            			
            			calcArr.splice(index,1);
            			$('#ing-'+ingNo).remove();
            		}
            		
            	}
            	
            
            	//재료 셀렉트 옵션 추가하기
            	var printData=function(ingreArr, target, templateObject){
            		var template=Handlebars.compile(templateObject.html());
            		var html = template(ingreArr);
            		$('.ingre').remove();
            		target.append(html);
            	}
            	
            	//재료 선택시 출력하기
            	var clickedIngre=function(ingreArr,target, templateObject){
            		var template=Handlebars.compile(templateObject.html());
            		var html = template(ingreArr);
            		target.append(html);
            	}
            	
  </script>
  
  
