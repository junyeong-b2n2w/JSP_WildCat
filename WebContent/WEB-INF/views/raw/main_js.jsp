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
   			$('#rec_calcium').text(		max_cal * 0.001 * base.calcium); 
   			$('#rec_phosphorus').text(max_cal * 0.001 * base.phosphorus);
   			$('#rec_potassium').text(max_cal * 0.001 * base.potassium);
   			$('#rec_sodium').text(max_cal * 0.001 * base.sodium);
   			$('#rec_magnesium').text(max_cal * 0.001 * base.magnesium);
   			$('#rec_iron').text(max_cal * 0.001 * base.iron);
   			$('#rec_copper').text(max_cal * 0.001 * base.copper);
   			$('#rec_manganese').text(max_cal * 0.001 * base.manganese);
   			$('#rec_zinc').text(max_cal * 0.001 * base.zinc);
   			$('#rec_iodine').text(max_cal * 0.001 * base.iodine);
   			$('#rec_selenium').text(max_cal * 0.001 * base.selenium);
   			$('#rec_vitaminA').text(max_cal * 0.001 * base.vitaminA);
   			$('#rec_vitaminD').text(max_cal * 0.001 * base.vitaminD);
   			$('#rec_vitaminE').text(max_cal * 0.001 * base.vitaminE);
   			$('#rec_vitaminK').text(max_cal * 0.001 * base.vitaminK);
   			$('#rec_thiamine').text(max_cal * 0.001 * base.thiamine);
   			$('#rec_riboflavin').text(max_cal * 0.001 * base.riboflavin);
   			$('#rec_pantothenic_acid').text(max_cal * 0.001 * base.pantothenic_acid); 
   			$('#rec_niacin').text(max_cal * 0.001 * base.niacin);
   			$('#rec_vitaminB6').text(max_cal * 0.001 * base.vitaminB6);
   			$('#rec_folic_acid').text(max_cal * 0.001 * base.folic_acid);
   			$('#rec_vitaminB12').text(max_cal * 0.001 * base.vitaminB12);
   			$('#rec_choline').text(max_cal * 0.001 * base.choline);
   			$('#rec_taurine').text(max_cal * 0.001 * base.taurine);
   				}
   				
 	window.onload=function(){
            	
            	
            	
            	
            		
            		
            		
           		$.getJSON("<%=request.getContextPath()%>/raw/ingreList.do",function(data){
           			//console.log(data)
           			printData(data.results, $('.ingreList'), $('#ingre-list-template'));
           		});	
            		
                $('.ingreList').select2();

                
                calcArr = [];
                
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
                	console.log(this.value)
                	console.log($(this).data("ingno"))
                })
                
                
                //권장량 계산
                
                //cat info
                
                $('#cat_info').on('change', function(){
                	
                		//cal	
                	  var cal = $('#weight').val() * 30 + 70 ;
                	  var max_cal = parseFloat($('#subCate').val()) * cal;
                	
                	  console.log(max_cal)
                      $('#rec_cal').text(max_cal) ;
                   
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