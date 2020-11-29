<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
					<div class="replyLi">
						<div class="d-inlineblock">&gt;&gt;</div>
						<div class="callout callout-warning d-inlineblock" data-rno={{rno}}>
		                  <p class="d-inline"><strong style="display:none;">{{rno}}</strong><i class="fa fa-user"></i>&nbsp;{{replyer}}</p>
		                  <span class="time float-right">
						    	<span>
						    		<i class="fa fa-clock"></i>{{regDate}}
						    	</span>
							 		<a class="btn btn-primary btn-xs" id="modifyReplyBtn" data-rno={{rno}} data-pron={{prno}}
										style="display:{{ replyer}};"
							    		data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">수정</a>
							    	<a class="btn btn-warning btn-xs" id="reReplyBtn" data-rno={{rno}} data-pron={{prno}}
										style="display:{{ replyer}};"
							    		data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">답글</a>
						  </span>
		                  
		                  <p id="{{rno}}-replytext">{{replyText}}</p>
		                </div>
		             </div>
{{/each}}	
</script>

<script>
window.onload=function(){
	var replyPage=1;
	
	
	getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+replyPage);
	
	function getPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			//alert(data.pageMaker.totalCount);
			printData(data.replyList, $('#repliesDiv'), $('#reply-list-template'));
			printPaging(data.pageMaker,$('#pagination'));
		});
	}
	
	$('.pagination').on('click','li a',function(event){
		event.preventDefault();
		replyPage=$(this).attr("href");
		getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+replyPage);
	});
	
	$('#replyAddBtn').on('click',function(e){
		var replyer=$('#newReplyWriter').val();
		var replyText=$('#newReplyText').val();
		
		if(replyText==""){
			alert('댓글내용은 필수입니다.');
			$('newReplyText').focus().css("boarder-color","red").attr('placeholder','내용은 필수입니다.');
			return;
		}
	
		var data={
				"bno":"${board.bno}",
				"prno":"0",
				"replyer":replyer,
				"replyText":replyText
		}
		alert(JSON.stringify(data));
		
		$.ajax({
			url:"<%=request.getContextPath()%>/replies/add.do",
			type:"post",
			data:JSON.stringify(data),
			success:function(data){
					alert('댓글이 등록되었습니다.');
					getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+data);
					$('#newReplyText').val("");
			},
			error:function(error){
				alert("댓글 등록을 실패했습니다.");
			}
		});
	});
	
}

var printData=function(replyArr, target, templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$('.replyLi').remove();
	target.after(html);
}


//reply pagination

var printPaging = function(pageMaker, target){
	
	var str="";
	
	if(pageMaker.prev){
		str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.startPage-1)
			+"'> <i class='fas fa-angel-left'/> </a></li>";
	}
	for(var i = pageMaker.startPage; i<= pageMaker.endPage; i++){
		var strClass = pageMaker.cri.page == i ? 'active' : '';
		str+="<li class='page-item " + strClass +"'><a class='page-link' href='" + i + "'>"+
		i+"</a></li>";
	}
	if(pageMaker.next){
		str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.endPage+1)
		+"'> <i class='fas fa-angel-right'/> </a></li>";
	}
	
	target.html(str);
	
}


</script>