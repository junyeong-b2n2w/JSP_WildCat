<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <script type="text/x-handlebars-template"  id="board-list-template" >
{{#each .}}
 <tr class="hot_freeBoard_tr">
	                      <td style="width:20px;">{{rownum}}.</td>
	                      <td><a href="board/detail.do?bno={{bno }}">[{{category}}]{{title}}</a></td>
	                    </tr>

{{/each}}	
</script>

<script>
window.onload=function(){
	
		
		$.getJSON("<%=request.getContextPath()%>/board/hot.do?gb=자유게시판",function(data){
			console.log(data)
			printData(data, $('.hot_freeBoard'), $('#board-list-template'));
		});	
		
  
		$.getJSON("<%=request.getContextPath()%>/board/new.do?gb=자유게시판",function(data){
			console.log(data)
			printData(data, $('.new_freeBoard'), $('#board-list-template'));
		});	

		$.getJSON("<%=request.getContextPath()%>/board/hot.do?gb=소모임게시판",function(data){
			console.log(data)
			printData(data, $('.hot_meetBoard'), $('#board-list-template'));
		});	
    
		$.getJSON("<%=request.getContextPath()%>/board/new.do?gb=소모임게시판",function(data){
			console.log(data)
			printData(data, $('.new_meetBoard'), $('#board-list-template'));
		});	
	
		$.getJSON("<%=request.getContextPath()%>/board/new.do?gb=공지사항",function(data){
			console.log(data)
			printData(data, $('.noticeBoard'), $('#board-list-template'));
		});	
		
    
}


     	var printData=function(boardArr, target, templateObject){
     		var template=Handlebars.compile(templateObject.html());
     		var html = template(boardArr);
     		$('.hot_freeBoard_tr').remove();
     		target.append(html);
     	}
</script>