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
            	window.onload=function(){
            		
           		$.getJSON("<%=request.getContextPath()%>/raw/ingreList.do",function(data){
           			console.log(data)
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
               			console.log(calcArr)
               		});	
                	
                	
                })
            	

                $('.clickedItem').on('change', 'td input[type="text"]', function(){
                	console.log(this.value)
                	console.log($(this).data("ingNo"))
                })
            	
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