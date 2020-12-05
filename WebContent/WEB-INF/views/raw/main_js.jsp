<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/x-handlebars-template"  id="ingre-list-template" >
{{#each .}}
<option class="ingre" value="{{ingNo}}">{{ingName}}</option>
{{/each}}	
</script>
    
    
   <script>
            	window.onload=function(){
            		
           		$.getJSON("<%=request.getContextPath()%>/raw/ingreList.do",function(data){
           			console.log(data)
           			printData(data.results, $('.ingreList'), $('#ingre-list-template'));
           		});	
            		
                $('.ingreList').select2();

                
            	

            	
            	}
            	
            	var printData=function(ingreArr, target, templateObject){
            		var template=Handlebars.compile(templateObject.html());
            		var html = template(ingreArr);
            		$('.ingre').remove();
            		target.append(html);
            	}
            	
  </script>