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
   			$('#rec_vitaminB12').text(max_cal * 0.001 * base.vitaminB12);
   			$('#rec_choline').text(max_cal * 0.001 * base.choline);
   			$('#rec_taurine').text(max_cal  * base.taurine);
   				}
   				
   	function total_ingre(){
   		 
   		
   		for( var i =0; i< calcArr.length; i++){
   			//console.log(calcArr[i])
   			
   		
	   		sum_arr = {		
	   				"calcium":	( sum_arr.calcium ? sum_arr.calcium : 0 )+calcArr[i].calcium,
	   				"calories": (sum_arr.calories ? sum_arr.calories	: 0 )+ calcArr[i].calories	,
					"carbohydrates": (sum_arr.carbohydrates	? sum_arr.carbohydrates	: 0 )+ calcArr[i].carbohydrates	,
					"cholesterol": (sum_arr.cholesterol	? sum_arr.cholesterol	: 0) + calcArr[i].cholesterol	,
					"choline": (sum_arr.choline	? sum_arr.choline	: 0 )+ calcArr[i].choline	,
					"copper": (sum_arr.copper	? sum_arr.copper	: 0 )+ calcArr[i].copper	,
					"dietaryfiber":( sum_arr.dietaryfiber	? sum_arr.dietaryfiber	: 0 )+ calcArr[i].dietaryfiber	,
					"fat": (sum_arr.fat	? sum_arr.fat	: 0 )+ calcArr[i].fat	,
					"folate": (sum_arr.folate	? sum_arr.folate	: 0) + calcArr[i].folate	,
					"iodine": (sum_arr.iodine	? sum_arr.iodine	: 0 )+ calcArr[i].iodine	,
					"iron": (sum_arr.iron	? sum_arr.iron	: 0 )+ calcArr[i].iron	,
					"magnesium": (sum_arr.magnesium	? sum_arr.magnesium	: 0 )+ calcArr[i].magnesium	,
					"manganese": (sum_arr.manganese	? sum_arr.manganese	: 0 )+ calcArr[i].manganese	,
					"niacin": (sum_arr.niacin	? sum_arr.niacin	: 0) + calcArr[i].niacin	,
					"omega3": (sum_arr.omega3	? sum_arr.omega3	: 0) + calcArr[i].omega3	,
					"omega6": (sum_arr.omega6	? sum_arr.omega6	: 0) + calcArr[i].omega6	,
					"pantothenicacid": (sum_arr.pantothenicacid	? sum_arr.pantothenicacid	: 0 )+ calcArr[i].pantothenicacid	,
					"phosphorus":( sum_arr.phosphorus	? sum_arr.phosphorus	: 0) + calcArr[i].phosphorus	,
					"potassium":( sum_arr.potassium	? sum_arr.potassium	: 0)+ calcArr[i].potassium	,
					"protein": (sum_arr.protein	? sum_arr.protein	: 0) + calcArr[i].protein	,
					"riboflavin":( sum_arr.riboflavin	? sum_arr.riboflavin	: 0 )+ calcArr[i].riboflavin	,
					"selenium": (sum_arr.selenium	? sum_arr.selenium	: 0 )+ calcArr[i].selenium	,
					"sodium": (sum_arr.sodium	? sum_arr.sodium	: 0) + calcArr[i].sodium	,
					"sugars": (sum_arr.sugars	? sum_arr.sugars	: 0) + calcArr[i].sugars	,
					"taurine": (sum_arr.taurine	? sum_arr.taurine	: 0) + calcArr[i].taurine	,
					"thiamin": (sum_arr.thiamin	? sum_arr.thiamin	: 0) + calcArr[i].thiamin	,
					"vitaminA": (sum_arr.vitaminA	? sum_arr.vitaminA	: 0 )+ calcArr[i].vitaminA	,
					"vitaminB6": (sum_arr.vitaminB6	? sum_arr.vitaminB6	: 0) + calcArr[i].vitaminB6	,
					"vitaminB12": (sum_arr.vitaminB12	? sum_arr.vitaminB12	: 0) + calcArr[i].vitaminB12	,
					"vitaminC": (sum_arr.vitaminC	? sum_arr.vitaminC	: 0 )+ calcArr[i].vitaminC	,
					"vitaminD": (sum_arr.vitaminD	? sum_arr.vitaminD	: 0 )+ calcArr[i].vitaminD	,
					"vitaminE": (sum_arr.vitaminE	? sum_arr.vitaminE	: 0 )+ calcArr[i].vitaminE	,
					"vitaminK": (sum_arr.vitaminK	? sum_arr.vitaminK	: 0 )+ calcArr[i].vitaminK	,
					"water": (sum_arr.water	? sum_arr.water	: 0 )+ calcArr[i].water	,
					"zinc": (sum_arr.zinc	? sum_arr.zinc	: 0 )+ calcArr[i].zinc	,
	   				
	   				
	   		}
   		
   			
   			
   		}
   		
   		console.log("sumarr", sum_arr);
   		
   	}			
   	
    calcArr = [];
   	
 	sum_arr=[]
    
 	window.onload=function(){
            	
            	
            	
            	
            		
            		
            		
           		$.getJSON("<%=request.getContextPath()%>/raw/ingreList.do",function(data){
           			//console.log(data)
           			printData(data.results, $('.ingreList'), $('#ingre-list-template'));
           		});	
            		
                $('.ingreList').select2();

                
                //calcArr = [];
                
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
                
                
                //var feedday = max_cal / (  $('#feedday').val() ?  $('#feedday').val() : 1);
                //$('#rec_cal_day').text( feedday);

                
                
                
            	
       	}
            	
            	function removeIngre(ingNo){
            		
            		if (calcArr){
            			const index = calcArr.findIndex(ingre => ingre.ingNo === ingNo); 
            			console.log("idx" , index);
            			
            			calcArr.splice(index,1);
            			$('#ing-'+ingNo).remove();
            		}
            		
            	}
            	
            
            	
            	var printData=function(ingreArr, target, templateObject){
            		var template=Handlebars.compile(templateObject.html());
            		var html = template(ingreArr);
            		$('.ingre').remove();
            		target.append(html);
            	}
            	
            	var clickedIngre=function(ingreArr,target, templateObject){
            		var template=Handlebars.compile(templateObject.html());
            		var html = template(ingreArr);
            		target.append(html);
            	}
            	
  </script>
  
  
