<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
					<div class="replyLi" style="margin-left:{{replyPadding level}}px;">
						<div class="callout callout-warning d-inlineblock" data-rno="{{rno}}">
		                  <p class="d-inline"><strong style="display:none;">{{rno}}</strong>   <i class="fas  fa-angle-double-right" style="color:blue;display:{{rereIcon prno}};">&nbsp;&nbsp;</i> <i class="fa fa-user"></i>&nbsp;{{replyer}}</p>
		                  <span class="time float-right">
						    	<span style="color:lightgray;">
						    		{{prettifyDate regDate}}
						    	</span>
							 		<a class="text-gray" id="modifyReplyBtn" data-rno="{{rno}}" data-pron="{{prno}}"
										style="display:{{loginUserCheck replyer}};"
							    		data-replyer="{{replyer}}" data-toggle="modal" data-target="#modifyModal">수정</a>
							    	<a class="text-gray" id="reReplyBtn" data-rno="{{rno}}" data-pron="{{prno}}"
							    		data-replyer="{{replyer}}" data-toggle="modal" data-target="#replyModal">답글</a>
						  </span>
		                  
		                  <p id="{{rno}}-replytext">{{replyText}}</p>
		                </div>
		             </div>
{{/each}}	
</script>

<script>
window.onload=function(){
	var formObj = $("form[role='form']");

	$('button#modifyBtn').on('click',function(evnet){
		//alert('modify btn click');
		formObj.attr({
			'action':'modifyForm.do',
			'method':'post'
		});
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove.do");
			formObj.attr("method", "post");
			formObj.submit();
		}
	});
	
	$("#listBtn").on("click", function(){
		window.opener.location.reload(true);
		window.close();
	});
	
	
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
				"prno":"",
				"replyer":replyer,
				"replyText":replyText
		}
		//alert(JSON.stringify(data));
		
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
	
	$('div#repliesDiv').on('click','#modifyReplyBtn',function(){
		var rno = $(this).attr("data-rno");
		var replyer = $(this).attr("data-replyer");
		var replyText = $('#'+rno+'-replytext').text();
		
		$('#replytext').val(replyText);
		$('.modal-title').text(rno);
		
	});
	
	$('div#repliesDiv').on('click','#reReplyBtn',function(){
		var prno = $(this).attr("data-rno");
		
		$('#replyPrno').attr("data-prno", prno);
	});
	
	$('#reReplyBtn').on('click',function(e){
		var replyer=${loginUser.id}+""
		var replyText=$('#rereplytext').val();
		
		if(replyText==""){
			alert('답글내용은 필수입니다.');
			$('#rereplytext').focus().css("boarder-color","red").attr('placeholder','내용은 필수입니다.');
			return;
		}
	
		var data={
				"bno":"${board.bno}",
				"prno":$('#replyPrno').attr("data-prno"),
				"replyer":replyer,
				"replyText":replyText
		}
		//alert(JSON.stringify(data));
		
		$.ajax({
			url:"<%=request.getContextPath()%>/replies/add.do",
			type:"post",
			data:JSON.stringify(data),
			success:function(data){
					alert('답글이 등록되었습니다.');
					getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+data);
					$('#rereplytext').val("");
			},
			error:function(error){
				alert("댓글 등록을 실패했습니다.");
			},
			complete:function(){
				$('#replyModal').modal('hide');
			}
		});
	});
	
	
	$('#replyModBtn').on('click', function(event){
		//alert("mod!");
		var rno=$('.modal-title').text();
		var replytext = $('#replytext').val();
		
		var sendData = {
				"rno" : rno,
				"replyText" : replytext
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/replies/update.do",
			type:"post",
			data: JSON.stringify(sendData),
			success: function(result){
				alert("수정되었습니다.");
				getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+replyPage);
			},
			error:function(error){
				alert("수정실패햇습니다.")
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		});
	});
	
	$('#replyDelBtn').on('click', function(event){
		var rno=$('.modal-title').text();
		
		var sendData = {
				bno:"${board.bno}",
				rno : rno,
				page : replyPage
		};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/replies/remove.do",
			type:'post',
			data:JSON.stringify(sendData),
			success:function(page){
				alert("삭제되었습니다");
				replyPage=page;
				getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+page);
			},
			error:function(error){
				alert("삭제 실패하였습니다.");
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		});
		

	
	});	
	
}

var printData=function(replyArr, target, templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$('.replyLi').remove();
	target.append(html);
}


Handlebars.registerHelper(
	"prettifyDate", function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date=dateObj.getDate();
	var hour = dateObj.getHours();
	var min = dateObj.getMinutes();
	return String(year).substr(2,2) + "/"+month+"/"+date+" "+hour+":"+min;
	})
	
Handlebars.registerHelper(
	"loginUserCheck",function(replyer){
		return "${loginUser.id}"==replyer ? "visible" : "none"; 
	})	
	
Handlebars.registerHelper(
	"rereIcon",function(prno){
		return prno ? "visible" : "none"; 
	})	
Handlebars.registerHelper(
	"replyPadding",function(level){
		return (level * 15) - 15 	
	})
	
	

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