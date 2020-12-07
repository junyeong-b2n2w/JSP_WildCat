<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
    
<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}
	<a href="javascript:goPage('{{murl}}', '{{mcode}}' , '{{mname}}');" class="nav-link subMenu">
             <p class="text-dark" style="margin-top:8px;margin-bottom:8px;"><i class="fas fa-paw"></i> {{mname }}</p>
        </a>     

	
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="mainMenu-list-template" >
{{#each .}}
 	<li class="nav-item d-none d-sm-inline-block">
        <a href="javascript:subMenu('{{mcode}}');location.href='<%=request.getContextPath()%>{{murl}}?mCode={{mcode}}';"
        	onclick=""
         class="nav-link"><i class="fas fa-paw"></i> {{mname}}</a>
      </li>
{{/each}}
</script>
      
<script>
	
	
	
	var printMainData = function(mainMenuArr, target, templateObject){
		console.log(mainMenuArr)
		var template = Handlebars.compile(templateObject.html());
		var html = template(mainMenuArr);
		$('.mainMenu').empty();
		target.append(html);
	}

	var printData = function(subMenuArr, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(subMenuArr);
		$('.subMenu').remove();
		target.append(html);
	}

	
	function mainMenu(){
		$.getJSON("<%=request.getContextPath()%>/common/mainMenu.do", function(data){
			printMainData(data, $('.mainMenu'), $('#mainMenu-list-template'));
		});	
	}
	

	function subMenu(mCode){
		if(mCode != "M000000"){
			$.getJSON("<%=request.getContextPath()%>/common/subMenu.do?mCode="+mCode, function(data){
				printData(data, $('.subMenuList'), $('#subMenu-list-template'));
			});	
		}else{
			$('.subMenuList').html("");
		}
		
		
	}
	
	function goPage(url, mCode, mname){
		//HTML5 브라우저에서 사용가능
		if(typeof(history.pushState) == 'function'){
			//현재주소를 가져온다
			var renewURL = location.href;
			//현재주소중 .do 뒷부분이 있다면 날려버린다
			renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
			
			if( mCode != 'M000000'){
				renewURL += "?mCode=" + mCode;
			}
			
			
			//페이지를 리로드 하지 않고 페이지 주소만 변경할때 사용
			history.pushState(mCode, null, renewURL);
			
		}else{
			location.hash = "#" + mCode ;
		}
		
		//게시판에 구분 주기
		if(mCode.substring(0,4) == 'M020'){
			url += "?gb=" + mname;
		}
		
		$('#if').attr("src", "<%=request.getContextPath()%>"+url);
	}
	

	mainMenu();
	subMenu('<%=request.getParameter("mCode")%>'.substring(0,3)+"0000");

	 
	function detailOpener(url){
		history.pushState(  url ,null,'<%=request.getContextPath()%>/board/main.do?mCode=M020000');
		
		$('#if').attr('src',url);		
		window.popState();
	}
	
	
</script>
