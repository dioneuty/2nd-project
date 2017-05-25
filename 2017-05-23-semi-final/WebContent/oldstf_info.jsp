<%@page import="com.hb.board.model.BoardDto"%>
<%@page import="com.hb.student.model.StuDto"%>
<%@page import="com.hb.staff.model.TchrDto"%>
<%@page import="com.hb.staff.model.EduDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<title>한빛교육센터 홍대점</title>
<link href="../css/mygrid.css" rel="stylesheet" type="text/css" /> <!-- 전체 메뉴 및 content,footer 프레임 grid -->
<link href="../css/mygrid2.css" rel="stylesheet" type="text/css" /> <!-- content내의 submenu,subcontent 프레임  grid -->
<link href="../css/index.css" rel="stylesheet" type="text/css"/> <!-- 페이지 전체 내용 css -->
<link href="../css/menu02.css" rel="stylesheet" type="text/css"/> <!-- 작아진 메뉴 css -->
<link href="../css/sth_info.css" rel="stylesheet" type="text/css" /> <!-- subcontent 내부 내용 css -->
<meta charset="utf-8" />

<style type="text/css">
.container2 .smenu1-cont{
	display: none;
}
.container2 .smenu13-cont{
	display: inline-block;
}
.container2 .content>div{
	display: inline-block;
}

.container2 #status{
	width:280px;
	height: 120px;
	margin: 15px 15px 15px 15px;
	text-align: left;	
}
.container2 #status>h4{
	margin : 2px 1px;
	text-align: center;
}
.container2 #status p{
	margin : 2px 5px;
	font-size: 0.7em;
}

.container2 #button1,#button2{
	display:inline-block;
	margin: 15px 15px;
	width: 120px;
	height:120px;
}
.container2 #button1{
	background-image: url("../image/start.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
.container2 #button2{
	background-image: url("../image/end.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

.container2 #attend{
	height:40px;
	width: 90%;
	line-height: 40px;
	text-align: center;
	margin: 15px 15px;
	font-size: 0.7em;
}
.container2 #athay{
	width: 90%;
	height:230px;
	margin: 15px 15px;
}

.container2 table{
	width : 90%;
	height: 200px;
	margin: 15px auto;
	border: 1px solid gray;
	border-radius: 7px;
}
.container2 table *{
	border: 1px dashed gray;
	text-align: center;
}

.container2 img{
	width:200px;
	padding: 10px auto;
	margin:10px 0px;
}
.container2  .char1{
	width:80%;
	margin:10px auto;
	border-top: solid 2px #011548;
	border-bottom: solid 2px #011548;
	text-align:center;
	color:#011548;
}


.chkno{
	color: red;
	border: 2px solid red;				
}
.chkyes{
	color: green;
	border: 2px solid green;		
}

</style>
<%
	String uids = (String) session.getAttribute("uids");
	Boolean result = (Boolean) session.getAttribute("result");
	Integer usertype = (Integer)session.getAttribute("utype");
	String path = request.getContextPath();

	System.out.println("userid :" + uids + "/ login result :" + result);
%>

<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	var res =<%=result%>;
	var usertype = <%=usertype%>;
	console.log("login: "+res+"/ usertype: "+usertype);
	$(document).ready(function() {
		$(
			'.header>div:nth-child(1)>table>tbody>tr>th>a,.header>div:nth-child(3)>table>tbody>tr>th>a')
			.click(
				function(e) {
					e.preventHefault();
					$('.header>div:nth-child(6)')
							.slideToggle("slow");
					$('.header>div:nth-child(7)')
							.slideToggle("slow");
					$('.header>div:nth-child(8)')
							.slideToggle("slow");
				});
		
		$('#login>a').click(function(e) {
			e.preventHefault();
			$('.containers').css("display", "block");
		});
		$('#logout>a').click(function() {
			alert("로그아웃 되었습니다.");
			$('.containers').css("display", "none");
			$('#err').text(" ");
		});
		
		$('.tab').click(function(e) {
			e.preventDefault();

			if ($(this).hasClass('smenu1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu1-cont').show();
			}
			if ($(this).hasClass('smenu2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu2-cont').show();
			}
			if ($(this).hasClass('smenu3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu3-cont').show();
			}
			if ($(this).hasClass('smenu4')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu4-cont').show();
			}
			if ($(this).hasClass('smenu4-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu4-cont').show();
			}
			if ($(this).hasClass('smenu4-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu4-cont').show();
			}
			if ($(this).hasClass('smenu5')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu5-cont').show();
			}
			if ($(this).hasClass('smenu6')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu6-cont').show();
			}
			if ($(this).hasClass('smenu6-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu6-1-cont').show();
			}
			if ($(this).hasClass('smenu6-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu6-1-cont').show();
			}
			if ($(this).hasClass('smenu6-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu6-1-cont').show();
			}
			if ($(this).hasClass('smenu7-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu7-1-cont').show();
			}
			if ($(this).hasClass('smenu7-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu7-2-cont').show();
			}
			if ($(this).hasClass('smenu7-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu7-2-cont').show();
			}
			if ($(this).hasClass('smenu7-4')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu7-2-cont').show();
			}
			if ($(this).hasClass('smenu8')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu8-cont').show();
			}
			if ($(this).hasClass('smenu8-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu8-cont').show();
			}
			if ($(this).hasClass('smenu8-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu8-cont').show();
			}
			if ($(this).hasClass('smenu8-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu8-cont').show();
			}
			if ($(this).hasClass('smenu9')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu9-cont').show();
			}
			if ($(this).hasClass('smenu9-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu9-1-cont').show();
			}
			if ($(this).hasClass('smenu9-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu9-1-cont').show();
			}
			if ($(this).hasClass('smenu9-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu9-1-cont').show();
			}
			if ($(this).hasClass('smenu10')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu10-cont').show();
			}
			if ($(this).hasClass('smenu11')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu11-cont').show();
			}
			if ($(this).hasClass('smenu12')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu12-cont').show();
			}
			if ($(this).hasClass('smenu13')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu13-cont').show();
			}
			if ($(this).hasClass('smenu14')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu14-cont').show();
			}
			if ($(this).hasClass('smenu15')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu15-cont').show();
			}
			if ($(this).hasClass('smenu16')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu16-cont').show();
			}
		});

		if (res == null || res == true) {
			$('.containers').css("display", "none");
			$('#err').text(" ");
		} else {
			$('.containers').css("display", "block");
			$('#err').text("ID/비밀번호를 확인해 주세요.");
		}

		if(usertype == 1){
			$('.menuB, .menuJ, .menuP, .menuT, .menuC').hide();
		} else if(usertype == 2){
			$('.menuB, .menuJ, .menuP').hide();
		} else if(usertype == 3){
			$('.menuB, .menuJ, .menuT').hide();
		} else if(usertype == 4){
			$('.menuB, .menuP, .menuT').hide();
		} else if(usertype == 5){
			$('.menuB, .menuJ, .menuT').hide();
		}
		
		//되돌아가기버튼
		$('button[type="button"]').click(function(){
			window.history.back();
		});
		$('button[type="back"]').click(function(){
			window.history.back();
		});

		/* $('form #idchk').text('사용 불가: 중복된 아이디');
		$('form #idchk').css('color', 'red');
		$('form #id').css('border', '2px solid red');
		$('form #id').val('사용 불가: 중복된 아이디');	 */	
		
	});
	$(document).ajaxStart(function(){
		$('p#loading').text('ajax loading');
	});
	$(document).ajaxStop(function() {
		$('p#loading').text('');
	});
	
</script>
</head>

<body>

		<!-- content -->
		<div class="container2">
			<div class="row">
				<!-- menu start -->
				<div class="aside col-3">
					<img src="../image/staff.png" alt="a" />
					<p id="loading"></p>
					<%//TODO 메뉴:영업팀 %>
					<div class="menu menuB">
						<p id="mname">영업팀</p>
						<ul>
							<li><a href="#" class="tab smenu1">오프라인 교육생 등록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu2">온라인 교육생 등록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu3">상담 예정 수강생 목록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu4">수강 상담 게시판 관리 <span>→</span></a></li>
						</ul>
					</div>
					<%//TODO 메뉴:취업 지원팀%>
					<div class="menu menuJ">
						<p>취업 지원팀</p>
						<ul>
							<li><a href="#" class="tab smenu4-1">채용 공고 게시판 관리 <span>→</span></a></li>
							<li><a href="#" class="tab smenu4-2">취업 상담 게시판 관리 <span>→</span></a></li>
						</ul>
					</div>
					<%//TODO 메뉴:행정팀%>
					<div class="menu menuP">
						<p>행정팀</p>
						<ul>
							<li><a href="#" class="tab smenu5">회원관리 <span>→</span></a></li>
							
							<li><a href="#" class="tab smenu6">수강생 출결관리 <span>→</span></a></li>
							<li><a href="#" class="tab smenu6-1">수강생 목록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu6-2">수강생 수정 <span>→</span></a></li>
							<li><a href="#" class="tab smenu6-3">수강생 삭제 <span>→</span></a></li>
							
							<li><a href="#" class="tab smenu7-1">강사 목록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu7-2">강사 추가 <span>→</span></a></li>
							<li><a href="#" class="tab smenu7-3">강사 수정 <span>→</span></a></li>
							<li><a href="#" class="tab smenu7-4">강사 삭제 <span>→</span></a></li>
							
							<li><a href="#" class="tab smenu8">기타 직원 목록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu8-1">기타 직원 추가 <span>→</span></a></li>
							<li><a href="#" class="tab smenu8-2">기타 직원 수정 <span>→</span></a></li>
							<li><a href="#" class="tab smenu8-3">기타 직원 삭제 <span>→</span></a></li>
							
							<li><a href="#" class="tab smenu9">강의 목록 <span>→</span></a></li>
							<li><a href="#" class="tab smenu9-1">강의 개설 <span>→</span></a></li>
							<li><a href="#" class="tab smenu9-2">강의 수정 <span>→</span></a></li>
							<li><a href="#" class="tab smenu9-3">강의 삭제 <span>→</span></a></li>
							
							<li><a href="#" class="tab smenu10">게시판 관리 <span>→</span></a></li>
						</ul>
					</div>
					<%//TODO 메뉴:강사팀%>
					<div class="menu menuT">
						<p>강사팀</p>
						<ul>
							<li><a href="#" class="tab smenu11">출석승인 <span>→</span></a></li>
							<li><a href="#" class="tab smenu12">시험평가 <span>→</span></a></li>
						</ul>
					</div>
					<%//TODO 메뉴:직원공통%>
					<div class="menu menuC">
						<p>직원공통</p>
						<ul>
							<li><a href="#" class="tab smenu13 active">직원 개인정보 <span>→</span></a></li>
							<li><a href="#" class="tab smenu14">건의사항 <span>→</span></a></li>
							<li><a href="#" class="tab smenu15">공지사항 <span>→</span></a></li>
							<li><a href="#" class="tab smenu16">게시판 <span>→</span></a></li>
						</ul>
					</div>
					<div class="char1">
						<h1>교 육 문 의</h1>
					</div>
				</div>
				<!-- menu end -->
				
				<!-- content  -->
				<%//TODO 영업팀:오프라인 수강생 등록%>
				<div class="content col-8 smenu1-cont">
					
				<%-- 	<%
					ArrayList<EduDto> addStuFormList_elist = (ArrayList)request.getAttribute("addStuFormList_elist");
					%> --%>
				
					<h1>오프라인 수강생 등록</h1>
					<span id=oaddstatus></span>
					<form action="addstu_result.hb" method="post" class="addOffline">
						<div>
							<label for="id">아이디: </label>
							<input type="text" name="id" id="id">
							<span id="idchk"></span>
						</div>
						<div>
							<label for="pw">비밀번호: </label>
							<input type="text" name="pw" id="pw" />
						</div>
						<div>
							<label for="name">이름: </label>
							<input type="text" name="name" id="name" />
						</div>
						<div>
							<label for="email">이메일: </label>
							<input type="text" name="email" id="email" />
						</div>
						<div>
							<label for="phone">전화번호: </label>
							<input type="text" name="phone" id="phone" />
						</div>			
						<div>
							<label for="enum">수강코스: </label>
							<select name="enum" id="offadd">
							<%-- <%for(EduDto bean: addStuFormList_elist){%> 
								<option value="<%=bean.getEnum2()%>"><%=bean.getEname() %> </option>
							<%}%>	 --%>
							</select>
						</div>	
						<div>
							<button type="submit">오프라인 수강생 등록</button>
							<button type="back">뒤로</button>
						</div>
					</form>
					
				</div>
				<script type="text/javascript">
					$('.menuB li>a.smenu1').on("click", function(){
						$('.smenu1-cont select#offadd>option').remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp;
								
								for(i=0; i < d.addStuFormList_elist.length; i++){
									tmp = '<option value="'+d.addStuFormList_elist[i].enum2+'">'+d.addStuFormList_elist[i].ename+'</option>';
									$('.smenu1-cont select#offadd').append(tmp);
								}
								$('.smenu1-cont select#offadd').css('cursor','hand');
							}
						});
					});
				
					var nxt=false;
					/* 		
					//공란 검사
					$('.smenu1-cont form').on('submit', function(){
						$('.content form input').each(function(){
							if($(this).val()=='')return false;
						});
					if(nxt)return false;
					});		 
					*/		
					
					//중복 검사
					$('.smenu1-cont form #id').on("keyup",function(){
						
						//alert('키보드 입력');
						var value=$('.smenu1-cont form #id').val();
						if(value.trim()!=''){
							//alert(value);
						$.ajax({
							'url': 'idchk.hb',
							'data': {'id':value},
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(jqXHR, textStatus){
								alert(textStatus);
							},
							'success': function(data){
								if(data.chk[0].result){
									nxt=true;
									$('span#oaddstatus').empty();
									$('.smenu1-cont form #idchk').text('사용 불가: 중복된 아이디').css('color', 'red');
									$('.smenu1-cont form #id').removeClass('chkyes');
									$('.smenu1-cont form #id').addClass('chkno');
								}else{
									nxt=false;
									$('span#oaddstatus').empty();
									$('.smenu1-cont form #idchk').text('사용가능한 아이디').css('color', 'green');
									$('.smenu1-cont form #id').removeClass('chkno');
									$('.smenu1-cont form #id').addClass('chkyes');
								}
							}
						});
						}
					}).blur(function(){
						if(nxt==false){
							$('.smenu1-cont form #idchk').empty();	
						}
					});	

					//공란 검사, 값 전송
					$('.smenu1-cont form').on('submit', function(event){
						event.preventHefault();
						//공란 검사
						$('.smenu1-cont form input').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						$('.smenu1-cont form select').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						if(nxt==false){
							//값 전송	
							$.ajax({
								'url': 'addstu_result.hb',
								'method': 'post',
								'data': $('.smenu1-cont form').serialize(),
								'dataType': 'json',
								'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
								'error': function(jqXHR, textStatus){
									alert(textStatus);
								},
								'success': function(data){
									if(data.submit[0].result){
										$('span#oaddstatus').text('추가 성공했습니다.');
										$('.smenu1-cont form input').val('');
									}else{
										$('span#oaddstatus').text('추가 실패했습니다.');
										$('.smenu1-cont form input').val('');
									}
								}
							})
						}else{
							return;
						}	
					});
				</script>
				<%//TODO 영업팀:온라인 교육생 등록%>
				<div class="content col-8 smenu2-cont">
					<h1>온라인 교육생 등록</h1>
					<%-- <%
					ArrayList<HanbUserDto> updateStuForm_ulist = (ArrayList)request.getAttribute("updateStuForm_ulist");
					ArrayList<EduDto> updateStuForm_elist = (ArrayList)request.getAttribute("updateStuForm_elist");
					%> --%>
					<div>
						<form action="updatestu_result.hb" method="post">
					 		<div>
								<h1>승급할 사용자를 고르세요</h1>
								<span id=uaddstatus></span>
							</div>
							<div>
								<label for="unum">승급할 수강생: </label>
								<select name="unum" id="onaddS">
							<%-- 	<%for(HanbUserDto ubean:updateStuForm_ulist){%> 
									<option value="<%=ubean.getUnum()%>"> <%=ubean.getUids()%> : <%=ubean.getUname() %> </option>
								<%}%>	 --%>
								</select>
							</div>
							<div>
								<label for="enum">수강코스: </label>
								<select name="enum" id="onaddC">
							<%-- 	<%for(EduDto ebean:updateStuForm_elist){%> 
									<option value="<%=ebean.getEnum2()%>"><%=ebean.getEname() %> </option>
								<%}%>	 --%>
								</select>
							</div>
							<div>
								<button type="submit">수강생 승급</button>
								<button type="back">뒤로</button>
							</div>
						</form>
					</div>		
				</div>
				<script>
					$('.menuB li>a.smenu2').on("click", function(){
						$('.smenu1-cont select#onaddS>option').remove();
						$('.smenu1-cont select#onaddC>option').remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp;
								
								for(i=0; i < d.updateStuForm_ulist.length; i++){
									tmp = '<option value="'+d.updateStuForm_ulist[i].unum+'">ID: '+d.updateStuForm_ulist[i].uids+' : 이름: '+d.updateStuForm_ulist[i].uname+'</option>';
									$('.smenu2-cont select#onaddS').append(tmp);
								}
								for(i=0; i < d.updateStuForm_elist.length; i++){
									tmp = '<option value="'+d.updateStuForm_elist[i].enum2+'">'+d.updateStuForm_elist[i].ename+'</option>';
									$('.smenu2-cont select#onaddC').append(tmp);
								}
								$('.smenu2-cont select#onaddS').css('cursor','hand');
								$('.smenu2-cont select#onaddC').css('cursor','hand');
							}
						});
					});
					
					//공란 검사, 값 전송
					$('.smenu2-cont form').on('submit', function(event){
						event.preventHefault();
						//값 전송	
						$.ajax({
							'url': 'updatestu_result.hb',
							'method': 'post',
							'data': $('.smenu2-cont form').serialize(),
							'dataType': 'json',
							'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
							'error': function(jqXHR, textStatus){
								alert(textStatus);
							},
							'success': function(data){
								if(data.submit[0].result){
									$('span#uaddstatus').text('승급 성공했습니다.');
								}else{
									$('span#uaddstatus').text('승급 실패했습니다.');
								}
							}
						})
					});
					$('.smenu2-cont select').on("focusin", function(){
						$('span#uaddstatus').empty();
					});
				</script>
				
				<div class="content col-8 smenu3-cont">
					<h1>상담 예정 목록</h1>
				</div>
				
				<div class="content col-8 smenu4-cont">
					<h1>수강 상담 게시판 관리</h1>
				</div>
				
				
				<%//TODO 상담 예정 수강생 목록%>
				<div class="content col-8 smenu4-1-cont">
					<h1>취업 상담 예정 수강생 목록</h1>
					<table class="jbCnsltStuList">
						<tr>
							<!-- student 테이블 -->
							<th>이름</th>
							<th>아이디</th>
							<th>수강강좌</th>
							<th>취업여부</th>
							<th>취업상담여부</th>
						</tr>
					</table>
				</div>
				<script type="text/javascript">
					$('content smenu4-1').on('click',function(){
						$('.smenu4-1-cont tr:first').nextAll().remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp='';
								
								for(i=0; i < d.jbCnsltStuList.length; i++){
									tmp = '<tr id="tclick'+i+'">';
									tmp += '<th>'+d.jbCnsltStuList[i].uname+'</th>';
									tmp += '<th>'+d.jbCnsltStuList[i].uids+'</th>';
									tmp += '<th>'+d.jbCnsltStuList[i].ename+'</th>';
									tmp += '<th>'+d.jbCnsltStuList[i].s_empoly+'</th>';
									tmp += '<th>'+d.jbCnsltStuList[i].s_sucemp+'</th>';
									tmp += '</tr>';
									
									$('.smenu4-1-cont table.jbCnsltStuList').append(tmp);
								}
								$('.smenu4-1-cont tr').css('cursor','hand');
							}
						});
					});				
				</script>
				
				<%//TODO 채용 공고 게시판 관리%>
				<div class="content col-8 smenu4-2-cont">
					<h1>채용 공고 게시판 관리</h1>
					<table class="jbNtcList">
						<tr>
							<th>기업명</th>
							<th>등록일자</th>
							<th>제목</th>
						</tr>
					</table>
				</div>
				<script type="text/javascript">
					$('.content .smenu4-2').on('click',function(){
						$.ajax({
							'url':'stf_result.hb',
							'method':'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var rows=d.numbers.rows;
								var pages=d.numbers.pages;
								var y=1;
								var cnt=0;
								var tmp;
								for(var i=1; i <=d.numbers.pages; i++){
									$('.content .smenu4-2-cont div').append('<table class="boardPage'+i+'">');
									for(var j=1; j<=10; j++){
										
										if(cnt<d.jbNtcList.length){

										tmp = '<tr>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].date+'</th>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].idx+'</th>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].uids+'</th>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].title+'</th>';
										tmp += '</tr>';
										
										$('div>table').append(tmp);
																		
										cnt++;
										}else{
											break;
										}
									}
									$('div').append('</table>');
									$('ul#num>').append('<li>'+i+'<li>');
								}
									$('.smenu4-2-cont .jbNtcList table').append(tmp);
								$('.smenu4-2-cont .jbNtcList tr').css('cursor','hand');
							}
						});
					});
				</script>

				<%//TODO 취업 상담 게시판 관리%>
				<div class="content col-8 smenu4-3-cont">
					<h1>취업 상담 게시판 관리</h1>
					<div class="jbCnsltList">
						<table>
							<tr id="headrow">
								<th>날짜</th>
								<th>글번호</th> 
								<th>글쓴이</th>
								<th>제목</th>
							</tr>
						</table>
					</div>
				</div>
				<script type="text/javascript">
					$('content smenu4-3').on('click',function(){
						$('div#jbCnsltList>table>tr:first').nextAll().remove();
						$.ajax({
							'url':'stf_result.hb',
							'method':'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var rows=d.numbers.rows;
								var pages=d.numbers.pages;
								var y=1;
								var cnt=0;
								var tmp;
								for(var i=1; i <=d.numbers.pages; i++){
									$('.content .smenu4-3-cont div').append('<table class="boardPage'+i+'">');
									for(var j=1; j<=10; j++){
										
										if(cnt<d.jbNtcList.length){

										tmp = '<tr>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].date+'</th>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].idx+'</th>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].uids+'</th>';
										tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].title+'</th>';
										tmp += '</tr>';
										
										$('div>table').append(tmp);
																		
										cnt++;
										}else{
											break;
										}
									}
									$('div').append('</table>');
									$('ul#num>').append('<li>'+i+'<li>');
								}
									$('.smenu4-3-cont .jbNtcList table').append(tmp);
								$('.smenu4-3-cont .jbNtcList tr').css('cursor','hand');
							}
						});
					});
				</script>


				<%//TODO 회원관리%>
				<div class="content col-8 smenu5-cont">
					<h1>회원관리</h1>
				<%--  <%
				 ArrayList<HanbUserDto> userList=(ArrayList)request.getAttribute("userList");
				 %> --%>
				 <table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>타입</th>
					</tr>
				  	<!-- <--%for(HanbUserDto bean:userList){ %>	
	  					<t<%-- r>
	  						<th><%=bean.getUids()%></th>
	  						<th><%=bean.getUname() %></th>
	  						<th><%=bean.getUemail() %></th>
	  						<th><%=bean.getUphone() %></th>
	  						<th>
	  						<%
	  						Integer utype=bean.getUtype(); 
	  						if(utype==0)%>미승인 회원
	  						<% if(utype==1)%>수강생
	  						<% if(utype==2)%>강사팀
	  						<% if(utype==3)%>영업팀
	  						<% if(utype==4)%>취업지원팀
	  						<% if(utype==5)%>행정팀
	  						<% if(utype==6)%>관리자
	  						</th>	 --%>
	  					</tr>
				  	<%-- <% } --%> --%> -->
				 </table>	
				
				</div>
				<script>
				$('.menuP li>a.smenu5').on("click", function(){
					$('.smenu5-cont tr:first').nextAll().remove();
					$.ajax({
						'url': 'stf_result.hb',
						'method': 'get',
						'dataType': 'json',
						'contentType':'application/json; charset=UTF-8',
						'error': function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    },
						'success': function(d){
							var tmp, utype;
							
							for(i=0; i < d.userList.length; i++){
								
								if(utype=0) name = '미승인 회원';
								if(utype==1) name = '수강생';
								if(utype==2) name = '강사팀';
								if(utype==3) name = '영업팀';
								if(utype==4) name = '취업지원팀';
								if(utype==5) name = '행정팀';
								if(utype==6) name = '관리자';
								
								tmp = '<tr id="tclick'+i+'">';
								tmp += '<th>'+d.userList[i].uids+'</th>';
								tmp += '<th>'+d.userList[i].uname+'</th>';
								tmp += '<th>'+d.userList[i].uemail+'</th>';
								tmp += '<th>'+d.userList[i].uphone+'</th>';
								tmp += '<th>'+d.userList[i].utype;+'</th>';
								tmp += '</tr>';
								
								$('.smenu5-cont table').append(tmp);
							}
							$('.smenu5-cont tr').css('cursor','hand');
						}
					});
				});
				</script>
				
				
				<%//TODO 행정팀:수강생 출결관리%>
				<div class="content col-8 smenu6-cont">
					<h1>수강생 출결관리</h1>
					<table>
						<tr>
							<th>수강생 이름</th>
							<th>수강생 아이디</th>
							<th>수강생 총 수강일수</th>
							<th>수강생 출석일수</th>
							<th>수강생 지각/조퇴일수</th>
							<th>수강생 결석일수</th>
						</tr>
					</table>
				</div>
				<script type="text/javascript">
				$('.menuP li>a.smenu6').on("click", function(){
					$('.smenu6-cont tr:first').nextAll().remove();
					$.ajax({
						'url': 'stf_result.hb',
						'method': 'get',
						'dataType': 'json',
						'contentType':'application/json; charset=UTF-8',
						'error': function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    },
					    //jsonArray atndMngList
					    //select uname, udis, s_total, s_append, s_early, s_absent from hanb_user u student s where u.uname=s.name;
						'success': function(d){
							var tmp;
							
							for(i=0; i < d.atndMngList.length; i++){
								
								tmp = '<tr id="tclick'+i+'">';
								tmp += '<th>'+d.atndMnglist[i].uname+'</th>';
								tmp += '<th>'+d.atndMnglist[i].uids+'</th>';
								tmp += '<th>'+d.atndMnglist[i].s_total+'</th>';
								tmp += '<th>'+d.atndMnglist[i].s_append+'</th>';
								tmp += '<th>'+d.atndMnglist[i].s_early+'</th>';
								tmp += '<th>'+d.atndMnglist[i].s_absent+'</th>';
								tmp += '</tr>';
								
								$('.smenu6-cont table').append(tmp);
							}
							$('.smenu6-cont tr').css('cursor','hand');
						}
					});
				});
				</script>
				
				<%//TODO 행정팀:수강생 목록 %>
				<div class="content col-8 smenu6-1-cont">
					<%-- <%ArrayList<StuDto> stusList_slist=(ArrayList)request.getAttribute("stusList_slist"); %> --%>
					<h1>수강생 목록</h1>
					<table>
						<tr>
							<th>수강생 이름</th>
							<th>교육과목 명</th>
							<th>수강과목1 </th>
							<th>점수 </th>
							<th>수강과목2 </th>
							<th>점수 </th>
							<th>수강과목3</th>
							<th>점수 </th>
							<th>총수강일수</th>
							<th>출석일수</th>
							<th>지각/조퇴일수</th>
							<th>결석일수</th>
							<th>취업 알선 여부</th>
							<th>수료 여부</th>
							<th>취엽 성공 여부</th>
						</tr>
						<%-- <%for(StuDto stu:stusList_slist){ %>
						<tr>
							<th><%=stu.getUname() %></th>
							<th><%=stu.getEname() %></th>
							<th><%=stu.getEsub1() %></th>
							<th><%=stu.getFir_sub() %></th>
							<th><%=stu.getEsub2() %></th>
							<th><%=stu.getSec_sub() %></th>
							<th><%=stu.getEsub3() %></th>
							<th><%=stu.getThr_sub() %></th>
							<th><%=stu.getS_total() %></th>
							<th><%=stu.getS_append() %></th>
							<th><%=stu.getS_early() %></th>
							<th><%=stu.getS_empoly() %></th>
							<th><%=stu.getS_cmpt() %></th>
							<th><%=stu.getS_sucemp()%></th>
						</tr>
						<%}%> --%>
					</table>
				</div>
				<script>
				$('.menuP li>a.smenu6-1').on("click", function(){
					$('.smenu6-1-cont tr:first').nextAll().remove();
					$.ajax({
						'url': 'stf_result.hb',
						'method': 'get',
						'dataType': 'json',
						'contentType':'application/json; charset=UTF-8',
						'error': function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    },
						'success': function(d){
							var tmp='';
							
							for(i=0; i < d.stusList_slist.length; i++){
								tmp = '<tr id="tclick'+i+'">';
								tmp += '<th>'+d.stusList_slist[i].uname+'</th>';
								tmp += '<th>'+d.stusList_slist[i].ename+'</th>';
								tmp += '<th>'+d.stusList_slist[i].esub1+'</th>';
								tmp += '<th>'+d.stusList_slist[i].fir_sub+'</th>';
								tmp += '<th>'+d.stusList_slist[i].esub2+'</th>';
								tmp += '<th>'+d.stusList_slist[i].sec_sub+'</th>';
								tmp += '<th>'+d.stusList_slist[i].esub3+'</th>';
								tmp += '<th>'+d.stusList_slist[i].thr_sub+'</th>';
								tmp += '<th>'+d.stusList_slist[i].s_total+'</th>';
								tmp += '<th>'+d.stusList_slist[i].s_append+'</th>';
								tmp += '<th>'+d.stusList_slist[i].s_early+'</th>';
								tmp += '<th>'+d.stusList_slist[i].s_empoly+'</th>';
								tmp += '<th>'+d.stusList_slist[i].s_cmpt+'</th>';
								tmp += '<th>'+d.stusList_slist[i].s_sucemp+'</th>';
								tmp += '</tr>';
								
								$('.smenu6-1-cont table').append(tmp);
							}
							$('.smenu6-1-cont tr').css('cursor','hand');
						}
					});
				});
				</script>
				
				<%//TODO 행정팀:수강생 수정 %>
				<div class="content col-8 smenu6-2-cont">
					<h1>수강생 수정</h1>	
					<form action="modify_stu.hb" method="post">
						<label for="uname">수강생 이름</label>
						<input type="text" name="uname" />
						
						<label for="ename">교육이름</label>
						<select name="ename" id="Modifyename">
							<!-- <option value=""> dfe</option> -->
						</select>
						<!-- select s_total from student where unum=?-->
						
						<!-- max=s_total -->
						<!-- $('smenu6-2cont input[type="number"]').attr("max",s_total);-->
						<label for="s_append">출석일수</label>
						<input type="number" name="s_append" min="0" />
						
						<label for="s_early">지각/조퇴일수</label>
						<input type="number" name="s_early" min="0" />
						
						<label for="s_absent">결석일수</label>
						<input type="number" name="s_absent" min="0" /> 
						
						<label for="s_empoly">취업 알선 여부</label>
						<select name="s_empoly">
							<option value="1">예</option>
							<option value="0">아니오</option>
						</select>
						
						<label for="s_cmpt">수료 여부</label>
						<select name="s_cmpt">
							<option value="1">예</option>
							<option value="0">아니오</option>
						</select>
						
						<label for="s_sucemp">취업 성공 여부</label>
						<select name="s_sucemp">
							<option value="1">예</option>
							<option value="0">아니오</option>
						</select>
					</form>	
				</div>
				
				<%//TODO 행정팀:수강생 삭제 %>
				<div class="content col-8 smenu6-3-cont">
					<h1>수강생 삭제</h1>
					<form action="del_stu.hb" method="post">
						<label for="stuList">삭제할 수강생</label>
						<select name="stuList" id="stuList">
							<!-- <option value="">student.uname</option> -->
						</select>
						
						<input type="radio" name="notStu" value="1" checked="checked" />비수강생으로 전환
						<!-- delete from student where uids=""-->
						<!-- update hanb_user set utype=1 where uids=""-->
						<input type="radio" name="notStu" value="0" />삭제 및 회원탈퇴
						<!-- delete from student where uids=""-->
						<!-- delete from hanb_user where uids=""-->
					</form>
				</div>
				<script type="text/javascript">
				</script>
				
				
				<%//TODO 행정팀:강사목록 %>
				<div class="content col-8 smenu7-1-cont">
					<h1>강사 목록</h1>
					
					<%-- <%
						ArrayList<TchrDto> tchList_tlist=(ArrayList)request.getAttribute("tchList_tlist");
					%> --%>
					<table>
						<tr>
							<th>강사이름</th>
							<th>담당교육</th>
						</tr>
					</table>
					<%-- <%for(TchrDto thto:tchList_tlist){ %>
						<tr>
							<th><%=thto.getUname() %></th>
							<th><%=thto.getEname() %></th>	
						</tr>
					<%} %> --%>
				</div>
				
				<script>
				$('.menuP li>a.smenu7-1').on("click", function(){
					$('.smenu7-1-cont tr:first').nextAll().remove();
					$.ajax({
						'url': 'stf_result.hb',
						'method': 'get',
						'dataType': 'json',
						'contentType':'application/json; charset=UTF-8',
						'error': function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    },
						'success': function(d){
							var tmp='';
							
							for(i=0; i < d.tchList_tlist.length; i++){
								uname = d.tchList_tlist[i].uname;
								ename = d.tchList_tlist[i].ename;
								
								tmp = '<tr id="tclick'+i+'">';
								tmp += '<th>'+uname+'</th>';
								tmp += '<th>'+ename+'</th>';
								tmp += '</tr>';
								
								$('.smenu7-1-cont table').append(tmp);
							}
							$('.smenu7-1-cont tr').css('cursor','hand');
						}
					});
				});
				</script>
				
				
				<%//TODO 행정팀:강사추가 %>
				<div class="content col-8 smenu7-2-cont">
					<h1>강사 추가</h1>
					<span id="taddstatus"></span>
					<%-- 	<%
					ArrayList<EduDto> addTchrForm_elist=(ArrayList)request.getAttribute("addTchrForm_elist");
					%> --%>
					<form action="addteacher_result.hb" method="post">
						<div>	
							<label for="id">아이디: </label>
							<input type="text" name="id" id="id" />
							<span id="idchk"></span>
						</div>
						<div>
							<label for="pw">비밀번호: </label>
							<input type="text" name="pw" id="pw" />
						</div>
						<div>
							<label for="name">이름: </label>
							<input type="text" name="name" id="name" />
						</div>
						<div>
							<label for="email">이메일: </label>
							<input type="text" name="email" id="email" />
						</div>
						<div>
							<label for="phone">전화번호: </label>
							<input type="text" name="phone" id="phone" />
						</div>
						<div>
							<label for="cls">담당강의: </label>
							<select name="cls" id="cls">
							</select>
							<%-- <% for(EduDto edto:addTchrForm_elist){ %>
								<option value="<%=edto.getEnum2() %>"><%=edto.getEname() %></option>
							<%} %> --%>
						</div>
						<div>
							<button type="submit">강사추가</button>
							<button type="back">뒤로</button>
						</div>
				    </form>
					
				</div>
				<script type="text/javascript">
					$('.menuP li>a.smenu7-2').on("click", function(){
						$('.smenu7-2-cont select#cls>option').remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp;
								
								for(i=0; i < d.addTchrForm_elist.length; i++){
									tmp = '<option value="'+d.addTchrForm_elist[i].enum2+'">'+d.addTchrForm_elist[i].ename+'</option>';
									$('.smenu7-2-cont select#cls').append(tmp);
								}
								$('.smenu7-2-cont select#cls').css('cursor','hand');
							}
						});
					});
				
				
					var nxt=false;
					
					//중복 검사
					$('.smenu7-2-cont form #id').on("keyup",function(){
						//alert('키보드 입력');
						var value=$('.smenu7-2-cont form #id').val();
						if(value.trim()!=''){
							//alert(value);
						$.ajax({
							'url': 'idchk.hb',
							'data': {'id':value},
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(jqXHR, textStatus){
								alert(textStatus);
							},
							'success': function(data){
								if(data.chk[0].result){
									nxt=true;
									$('span#taddstatus').empty();
									$('.smenu7-2-cont form #idchk').text('사용 불가: 중복된 아이디').css('color', 'red');
									$('.smenu7-2-cont form #id').removeClass('chkyes');
									$('.smenu7-2-cont form #id').addClass('chkno');
								}else{
									nxt=false;
									$('span#taddstatus').empty();
									$('.smenu7-2-cont form #idchk').text('사용가능한 아이디').css('color', 'green');
									$('.smenu7-2-cont form #id').removeClass('chkno');
									$('.smenu7-2-cont form #id').addClass('chkyes');
								}
							}
						});
						}
					}).blur(function(){
						if(nxt==false){
						$('.smenu7-2-cont form #idchk').empty();
						}
					});	
					

					//공란 검사, 값 전송
					$('.smenu7-2-cont form').on('submit', function(event){
						event.preventHefault();
						//공란 검사
						$('.smenu7-2-cont form input').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						$('.smenu7-2-cont form select').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						if(nxt==false){
							//값 전송	
							$.ajax({
								'url': 'addteacher_result.hb',
								'method': 'post',
								'data': $('.smenu7-2-cont form').serialize(),
								'dataType': 'json',
								'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
								'error': function(jqXHR, textStatus){
									alert(textStatus);
								},
								'success': function(data){
									if(data.submit[0].result){
										$('span#taddstatus').text('추가 성공했습니다.');
										$('.smenu7-2-cont form input').val('');
									}else{
										$('span#taddstatus').text('추가 실패했습니다.');
										$('.smenu7-2-cont form input').val('');
									}
								}
							})
						}else{
							return;
						}	
					});

				</script>


				<div class="content col-8 smenu7-3-cont">
					<h1>강사 수정</h1>
					<form action="">
						<label for="modifyTchr">수정할 강사</label>
						<select name="modifyTchr" id="">
							<option value=""></option>
						</select>
						<lable for="ename">담당교육</lable>
						<select name="ename" class="selectEname">
							<option value="unum">uname</option></select>
						<label for="tchrName">강사이름</label>
						<input type="text" name="tchrName" />
						
						<!--update hanb_user set uname= where unum=? -->
						<!--update teacher set uname= where unum=? -->
					</form>
				</div>
				<script type="text/javascript"></script>

				<div class="content col-8 smenu7-4-cont">
					<h1>강사 삭제</h1>
					<form action="del_tchr.hb" method="post">
						<label for="tchrList">삭제할 강사</label>
						<select name="tchrList" id="tchrList">
							<!-- <option value="">teacher.uname</option> -->
						</select>
						
						<input type="radio" name="notTchr" value="1" checked="checked" /><!-- 일반 회원으로 전환 -->
						<!-- delete from teacher where uids=""-->
						<!-- update hanb_user set utype=1 where uids=""-->
						
						<input type="radio" name="notTchr" value="0" /><!-- 삭제 및 회원탈퇴 -->
						<!-- delete from teacher where uids=""-->
						<!-- delete from hanb_user where uids=""-->
					</form>
				</div>

				<%//TODO 행정팀: 기타직원추가 %>
				<div class="content col-8 smenu8-cont">
					<h1>기타 직원 추가</h1>
					<span id="stfaddstatus"></span>
					<form action="addstaff_result.hb" method="post">
						<div>
							<label for="id">아이디: </label>
							<input type="text" name="id" id="id" />
							<span id="idchk"></span> 
						</div>
						<div>
							<label for="pw">비밀번호: </label>
							<input type="text" name="pw" id="pw" />
						</div>
						<div>
							<label for="name">이름: </label>
							<input type="text" name="name" id="name" />
						</div>
						<div>
							<label for="email">이메일: </label>
							<input type="text" name="email" id="email" />
						</div>
						<div>
							<label for="phone">전화번호: </label>
							<input type="text" name="phone" id="phone" />
						</div>
						<div>
							<label for="utype">직원타입: </label>
							<select name="utype" id="selUtype">
								<option value="3">영업팀</option>
								<option value="4">취업지원팀</option>
								<option value="5">행정팀</option>
								<option value="6">관리자</option>
							</select>
						</div>
						<div>
							<button type="submit">회원가입</button>
							<button type="button">뒤로</button>
						</div>
					</form>
						
				</div>
				
				<script type="text/javascript">
					var nxt=false;
					
					//중복 검사
					$('.smenu8-cont form #id').on("keyup",function(){
						//alert('키보드 입력');
						var value=$('.smenu8-cont form #id').val();
						if(value.trim()!=''){
							//alert(value);
						$.ajax({
							'url': 'idchk.hb',
							'data': {'id':value},
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(jqXHR, textStatus){
								alert(textStatus);
							},
							'success': function(data){
								if(data.chk[0].result){
									nxt=true;
									$('span#stfaddstatus').empty();
									$('.smenu8-cont form #idchk').text('사용 불가: 중복된 아이디').css('color', 'red');
									$('.smenu8-cont form #id').removeClass('chkyes');
									$('.smenu8-cont form #id').addClass('chkno');
								}else{
									nxt=false;
									$('span#stfaddstatus').empty();
									$('.smenu8-cont form #idchk').text('사용가능한 아이디').css('color', 'green');
									$('.smenu8-cont form #id').removeClass('chkno');
									$('.smenu8-cont form #id').addClass('chkyes');
								}
							}
						});
						}
					}).blur(function(){
						if(nxt==false){
						$('.smenu8-cont form #idchk').empty();
						}
					});	
					

					//공란 검사, 값 전송
					$('.smenu8-cont form').on('submit', function(event){
						event.preventHefault();
						//공란 검사
						$('.smenu8-cont form input').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						$('.smenu8-cont form select').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						if(nxt==false){
							//값 전송	
							$.ajax({
								'url': 'addstaff_result.hb',
								'method': 'post',
								'data': $('.smenu8-cont form').serialize(),
								'dataType': 'json',
								'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
								'error': function(jqXHR, textStatus){
									alert(textStatus);
								},
								'success': function(data){
									if(data.submit[0].result){
										$('span#stfaddstatus').text('추가 성공했습니다.');
										$('.smenu8-cont form input').val('');
									}else{
										$('span#stfaddstatus').text('추가 실패했습니다.');
										$('.smenu8-cont form input').val('');
									}
								}
							})
						}else{
							return;
						}	
					});
				</script>
				
				<div class="content col-8 smenu8-2-cont">
					<h1>기타 직원 수정</h1>
					<form action="">
						<label for="modifyTchr">수정할 기타 직원</label>
						<select name="modifyTchr" id="">
							<option value="3">영업팀</option>
							<option value="4">취업지원팀</option>
							<option value="5">행정팀</option>
							<option value="6">운영자</option>
						</select>
						<lable for="utype">소속</lable>
						<select name="utype" id="">
							<option value="utype">소속부서 이름(강사 제외)</option>
						</select>
					</form>
					<!--update staff set utype= where unum=? -->
					<!--update hanb_user set utype= where unum=? -->
				</div>
				<script type="text/javascript">
					/* utype=기타직원.utype;
					$(option).val(utype).hide(); */
				</script>

				<div class="content col-8 smenu8-3-cont">
					<h1>기타 직원 삭제</h1>
					<form action="del_stf.hb" method="post">
						<label for="stfList">삭제할 기타 직원</label>
						<select name="stfList" id="stfList">
							<!-- <option value="">teacher.uname</option> -->
						</select>
						<input type="radio" name="notStaff" value="1" checked="checked" /><!--일반 회원으로 전환-->
						<!-- delete from teacher where uids=""-->
						<!-- update hanb_user set utype=1 where uids=""-->
						<input type="radio" name="notStaff" value="0" /><!-- 삭제 및 회원탈퇴 -->
						<!-- delete from teacher where uids=""-->
						<!-- delete from hanb_user where uids=""-->
					</form>
				</div>

				<%//TODO 행정팀:강의 목록 %>
				<div class="content col-8 smenu9-cont">
				  	<h1>강의 목록</h1>	
					<%-- 	<%
					ArrayList<EduDto> clsList_elist=(ArrayList)request.getAttribute("clsList_elist");
					%> --%>
				    <table>
						<tr>
							<th>교육번호</th>
							<th>교육이름</th>
							<th>교육과목1</th>
							<th>교육과목2</th>
							<th>교육과목3</th>
							<th>교육시작일</th>
							<th>교육종료일</th>
							<th>총 교육일 수 </th>
							<th>담당강사</th>
							<th>신청인원</th>
						</tr>
					<%-- <%for(EduDto bean:clsList_elist){ %>	
						<tr>
							<th><%=bean.getEnum2() %></th>
							<th><%=bean.getEname() %></th>
							<th><%=bean.getEsub1() %></th>
							<th><%=bean.getEsub2() %></th>
							<th><%=bean.getEsub3() %></th>
							<th><%=bean.getStarthate() %></th>
							<th><%=bean.getEnddate() %></th>
							<th><%=bean.getEtotalday() %></th>
							<th><%=bean.getUname() %></th>
							<th><%=bean.getStnum() %></th>
						</tr>
					<%} %> --%>
				    </table>	
				</div>
				<script>
					$('.menuP li>a.smenu9').on("click", function(){
						$('.smenu9-cont tr:first').nextAll().remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp='';
								
								for(i=0; i < d.clsList_elist.length; i++){
									tmp = '<tr id="tclick'+i+'">';
									tmp += '<th>'+d.clsList_elist[i].enum2+'</th>';
									tmp += '<th>'+d.clsList_elist[i].ename+'</th>';
									tmp += '<th>'+d.clsList_elist[i].esub1+'</th>';
									tmp += '<th>'+d.clsList_elist[i].esub2+'</th>';
									tmp += '<th>'+d.clsList_elist[i].esub3+'</th>';
									tmp += '<th>'+d.clsList_elist[i].starthate+'</th>';
									tmp += '<th>'+d.clsList_elist[i].enddate+'</th>';
									tmp += '<th>'+d.clsList_elist[i].etotalday+'</th>';
									tmp += '<th>'+d.clsList_elist[i].uname+'</th>';
									tmp += '<th>'+d.clsList_elist[i].stnum+'</th>';
									tmp += '</tr>';
									
									$('.smenu9-cont table').append(tmp);
								}
								$('.smenu9-cont tr').css('cursor','hand');
							}
						});
					});
				</script>
				<%//TODO 행정팀:강의 개설%>
				<div class="content col-8 smenu9-1-cont">	
					<h1>강의 개설</h1>
					<span id="caddstatus"></span>
					<%-- 	<% ArrayList<HanbUserDto> newClsForm_ulist = (ArrayList)request.getAttribute("newClsForm_ulist"); %> --%>
					<form action="newcls_result.hb" method="post">
						<div>
							<label for="ename" value=" ">교육이름: </label>
							<input type="text" name="ename" id="ename" />
							<span id="enamechk"></span>
						</div>
						<div>
							<label for="esub1" value=" ">교육과목1: </label>
							<input type="text" name="esub1" id="esub1" />
						</div>
						<div> 
							<label for="esub2" value=" ">교육과목2: </label>
							<input type="text" name="esub2" id="esub2" />
						</div>
						<div>
							<label for="esub3" value=" ">교육과목3: </label>
							<input type="text" name="esub3" id="esub3" />
						</div>
						<div>
							<label for="starthate" >교육시작일: </label>
							<input type="date" name="starthate" value="2017-01-01" id="starthate" />
						</div>
						<div>
							<label for="enddate" >교육종료일: </label>
							<input type="date" name="enddate" value="2017-01-30" id="enddate" />
						</div>
						<div>
							<label for="etotalday" value="0">총 교육일 수: </label>
							<input type="number" name="etotalday" id="etotalday" min="0"/>
						</div>
						<div>
							<label for="tchr">담당강사: </label>
							<select name="tchr" id="tchr">
								<%-- 	<% for(HanbUserDto udto:newClsForm_ulist){ %>			 --%>		
							    <%-- <%if(udto.getUname()==null||udto.getUnum()==null){ %>	
								<option value="0">기본</option>
							    <%}else{%> --%>
								<%-- 	<option value="<%=udto.getUnum() %>"><%=udto.getUname() %></option>
								<% System.out.println("값:"+udto.getUname()+" "+udto.getUnum()); %>
							    <%} %>
								<%} %> --%>
							</select>							
						</div>
						<div>
							<label for="stnum">신청인원: </label>
							<input type="number" name="stnum" id="stnum" value="0" min="0" max="50" />
						</div>
						<div>
							<button type="submit">교육등록</button>
							<button type="back">뒤로</button>
						</div>
					</form>
	            </div>
	            
	            	<script type="text/javascript">
	            	//목록 표시
	            	$('.menuP li>a.smenu9-1').on("click", function(){
						$('.smenu9-1-cont select#tchr option').remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var date,idx,uids,title;
								var tmp='';
								
								for(i=0; i < d.newClsForm_ulist.length; i++){
									tmp = '<option id="tclick'+i+'" value="'+d.newClsForm_ulist[i].unum+'">';
									tmp += d.newClsForm_ulist[i].uname;
									tmp += '</option>';
									
									$('.smenu9-1-cont select#tchr').append(tmp);
								}
								$('.smenu9-1-cont tr').css('cursor','hand');
							}
						});
					});
	            	
					var nxt=false;
					
					//중복 검사
					$('.smenu9-1-cont form #ename').on("keyup",function(){
						//alert('키보드 입력');
						var value=$('.smenu9-1-cont form #ename').val();
						if(value.trim()!=''){
							//alert(value);
						$.ajax({
							'url': 'checkename.hb',
							'data': {'ename':value},
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(jqXHR, textStatus){
								alert(textStatus);
							},
							'success': function(d){
								if(d.chk[0].result){
									nxt=true;
									$('span#caddstatus').empty();
									$('.smenu9-1-cont form #enamechk').text('사용 불가: 중복된 교육명').css('color', 'red');
									$('.smenu9-1-cont form #ename').removeClass('chkyes');
									$('.smenu9-1-cont form #ename').addClass('chkno');
								}else{
									nxt=false;
									$('span#caddstatus').empty();
									$('.smenu9-1-cont form #enamechk').text('사용가능한 교육명').css('color', 'green');
									$('.smenu9-1-cont form #ename').removeClass('chkno');
									$('.smenu9-1-cont form #ename').addClass('chkyes');
								}
							}
						});
						}
					}).blur(function(){
						if(nxt==false){
						$('.smenu9-1-cont form #idchk').empty();
						}
					});	
					

					//공란 검사, 값 전송
					$('.smenu9-1-cont form').on('submit', function(event){
						event.preventHefault();
						//공란 검사
						$('.smenu9-1-cont form input').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						$('.smenu9-1-cont form select').each(function(){
							if($(this).val()==''){
								nxt=true;
							}
						});
						if(nxt==false){
							//값 전송	
							$.ajax({
								'url': 'newcls_result.hb',
								'method': 'post',
								'data': $('.smenu9-1-cont form').serialize(),
								'dataType': 'json',
								'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
								'error': function(jqXHR, textStatus){
									alert(textStatus);
								},
								'success': function(data){
									if(data.submit[0].result){
										$('span#caddstatus').text('추가 성공했습니다.');
										$('.smenu9-1-cont form input').val('');
									}else{
										$('span#caddstatus').text('추가 실패했습니다.');
										$('.smenu9-1-cont form input').val('');
									}
								}
							})
						}else{
							return;
						}	
					});
				</script>

				<div class="content col-8 smenu9-2-cont">
					<h1>강의 수정</h1>
					<form action="modify_cls.hb" method="post">
						<label for="modifyCls">수정할 강의</label>
						<select name="modifyCls" id="modifyCls">
							<option value=""></option>
						</select>
						<lable for="tmpEname">교육이름</lable>
						<select name="tmpEname" id="">
							<!-- <option value="enum">ename</option> -->
						</select>
							<!-- ///////////// -->

						<label for="ename" value=" ">교육이름: </label>
						<input type="text" name="ename" id="ename" />
						<span id="enamechk"></span>
						
						<label for="esub1" value=" ">교육과목1: </label>
						<input type="text" name="esub1" id="esub1" />

						<label for="esub2" value=" ">교육과목2: </label>
						<input type="text" name="esub2" id="esub2" />

						<label for="esub3" value=" ">교육과목3: </label>
						<input type="text" name="esub3" id="esub3" />

						<label for="starthate" >교육시작일: </label>
						<input type="date" name="starthate" value="2017-01-01" id="starthate" />

						<label for="enddate" >교육종료일: </label>
						<input type="date" name="enddate" value="2017-01-30" id="enddate" />

						<label for="etotalday">총 교육일 수: </label>
						<input type="number" name="etotalday" id="etotalday" min="0"/>
						
						<label for="tchr">담당강사: </label>
						<select name="tchr" id="tchr">
						</select>							
						
						<div>
							<label for="stnum">신청인원: </label>
							<input type="number" name="stnum" id="stnum" value="0" min="0" max="50" />
						</div>
						<div>
							<button type="submit">교육등록</button>
							<button type="back">뒤로</button>
						</div>
					</form>	
					
						<!--update hanb_user set uname= where unum=? -->
						<!--update teacher set uname= where unum=? -->
			
				</div>
				<script type="text/javascript"></script>

				<div class="content col-8 smenu9-3-cont">
					<h1>강의 삭제</h1>
					<form action="del_cls.hb" method="post">
						<label for="clsList">삭제할 강의</label>
						<select name="clsList" id="clsList">
							<!-- <option value="education.enum">education.ename</option> -->
						</select>

						<!-- 
						delete from education where enum=?
						update teacher set enum=0 where enum=?;
						update student set enum=0 where enum=?
						update student set fir_sub='', sec_sub='', thr_sub='' where enum=?; 
						-->

						<button type="submit">확인</button>
						<button type="back">취소</button>
					</form>
				</div>	

				<%//TODO 행정팀: 게시판관리%>
				<div class="content col-8 smenu10-cont">
					<h1>게시판 관리</h1>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">자유게시판</a></li>
						<li><a href="#">건의사항</a></li>
						<li><a href="#">취업상담게시판</a></li>
						<li><a href="#">채용게시판</a></li>
					</ul>
				</div>
				<%//TODO 강사팀: 출석승인%>
				<div class="content col-8 smenu11-cont">
					<h1>출석승인</h1>
					<%-- <% 
					ArrayList<StuDto> ChkAtndForm_ulist = (ArrayList)request.getAttribute("ChkAtndForm_ulist"); 
					%> --%>
					<table>
						<tr>
							<th>수강생 아이디<th>
							<th>수강생 이름</th>				
						</tr>
						<%-- 	<%for(StuDto atndUdto:ChkAtndForm_ulist){ %>
						<tr>
							<th><%=atndUdto.getUids() %></th>
							<th><%=atndUdto.getUname() %></th>			
						</tr>
						<%} %> --%>
					</table>
					<form action="chkatnd_result.hb" method="post">
						<div>
							<label for="oneStu">수강생 선택</label>
							<select name="oneStu" id="oneStu">
								<%-- <%for(StuDto atndUdto:ChkAtndForm_ulist){ %>
								<option value="<%=atndUdto.getUnum()%>"><%=atndUdto.getUids() %> : <%=atndUdto.getUname()%></option>
							<%} %>	 --%>
							</select>
						</div>
						<script>
						
						
						</script>
						<div>
							<input type="date" name="athate" id="athate" value="2017-01-01" />
							<span id="idchk"></span> 
						</div>
						<div>
							<label for="stTime">입실시간: </label>
							<input type="time" name="stTime" id="stTime" value="09:00" />
						</div>
						<div>
							<label for="edTime">퇴실시간: </label>
							<input type="time" name="edTime" id="edTime" value="18:00" />
						</div>
						<span>출결상태: </span>
						<select name="atStatus">
							<option value=0>결석</option>
							<option value=1>정상</option>
							<option value=2>지각</option>
							<option value=3>조퇴</option>
						</select>
						<button id="ok" value="ok">강사승인</button>
						<div>
							<button type="submit">출결갱신</button>
							<button type="button">뒤로</button>
						</div>
					</form>	
					
				</div>
				<script type="text/javascript">
					$('.menuT li>a.smenu11').on("click", function(){
						$('.smenu11-cont tr:first').nextAll().remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp='';
								
								for(i=0; i < d.chkAtndForm_ulist.length; i++){
									tmp = '<tr id="tclick'+i+'">';
									tmp += '<th>'+d.chkAtndForm_ulist[i].uids+'</th>';
									tmp += '<th>'+d.chkAtndForm_ulist[i].uname+'</th>';
									tmp += '</tr>';
									
									$('.smenu11-cont table').append(tmp);
								}
								$('.smenu11-cont tr').css('cursor','hand');
								for(i=0; i < d.chkAtndForm_ulist.length; i++){
									tmp = '<option id="tclick'+i+'" value="'+d.chkAtndForm_ulist[i].unum+'">';
									tmp += d.chkAtndForm_ulist[i].uids+': '+d.chkAtndForm_ulist[i].uname;
									tmp += '</option>';
									
									$('.smenu11-cont select#oneStu').append(tmp);
								}								
							}
						});
					});
				</script>
				<%//TODO 강사팀:시험평가%>
				<div class="content col-8 smenu12-cont">
					<%-- 		<%ArrayList<StuDto> chkExamForm_ulist = (ArrayList)request.getAttribute("chkExamForm_ulist");%> --%>
					<h1>시험평가</h1>
					<form action="chkexam_result.hb" method="post">
						<label for="stuList">학생선택:</label>
						<select name="stud" class=stuList>
						<%-- 			<%for(StuDto studto : chkExamForm_ulist){%>
							<option value="<%=studto.getUnum()%>" selected><%=studto.getUname() %></option>
						<%} %> --%>
						</select>
						<div>
							<h3>과목1</h3>
							<label for="sub1" id="sub1label"></label>
							<input type="text" name="sub1" id="sub1" />
						</div>
						<div>
							<h3>과목2</h3>
							<label for="sub2" id="sub2label"></label>
							<input type="text" name="sub2" id="sub2" />
						</div>
						<div>
							<h3>과목3</h3>
							<label for="sub3" id="sub3label"></label>
							<input type="text" name="sub3" id="sub3" />
						</div>
						<div>
							<button type="submit">시험 점수 갱신</button>
							<button type="button">뒤로</button>
						</div>
					</form>
				</div>
				<script type="text/javascript">
					$('.menuT li>a.smenu12').on("click", function(){
						$('.smenu12-cont .stuList>option').remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp='';
								
								for(i=0; i < d.chkExamForm_ulist.length; i++){
									tmp = '<option id="tclick'+i+'" value="'+d.chkExamForm_ulist[i].unum+'">';
									tmp += d.chkExamForm_ulist[i].uname;
									tmp += '</option>';
									
									$('.smenu12-cont select.stuList').append(tmp);
								}								
							}
						});
					});
				
					
					$('.stuList>option:selected').each(function(){
						var value = $(this).val();
						if(value.trim()!=''){
							//alert(value);
						$.ajax({
							'url': 'subshow.hb',
							'data': $.param({'unum':value}),
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(jqXHR, textStatus){
								alert(textStatus);
							},
							'success': function(d){
								var esub1 = data.subject[0].esub1;
								var esub2 = data.subject[0].esub2;
								var esub3 = data.subject[0].esub3;
								console.log("sub1: "+esub1+" / sub2: "+esub2+" / sub3: "+esub3);
								$('#sub1label').text(esub1);
								$('#sub2label').text(esub2);
								$('#sub3label').text(esub3);
							}
						});
						}
					});
					$('.stuList').change(function(){
						$('.stuList>option:selected').each(function(){
							var value = $(this).val();
							if(value.trim()!=''){
								alert(value);
							$.ajax({
								'url': 'subshow.hb',
								'data': $.param({'unum':value}),
								'method': 'get',
								'dataType': 'json',
								'contentType':'application/json; charset=UTF-8',
								'error': function(jqXHR, textStatus){
									alert(textStatus);
								},
								'success': function(d){
									var esub1 = d.subject[0].esub1;
									var esub2 = d.subject[0].esub2;
									var esub3 = d.subject[0].esub3;
									console.log("sub1: "+esub1+" / sub2: "+esub2+" / sub3: "+esub3);
									$('#sub1label').text(esub1);
									$('#sub2label').text(esub2);
									$('#sub3label').text(esub3);
								}
							});
							}
						});
					});
				</script>
				<%//TODO 직원공통:직원 개인정보%>
				<div class="content col-8 smenu13-cont">
					<%-- 		<%@page import="com.hb.user.model.HanbUserDto"%>
					<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
					<% HanbUserDto infoUdto = (HanbUserDto) request.getAttribute("info_udto"); %> --%>
					<h1>직원 개인정보</h1>
					<div>
						<ul id="infoUl">
							<%-- <li>아이디 <%=infoUdto.getUids()%></li>
							<li>이름 <%=infoUdto.getUname() %></li>
							<li>이메일 <%=infoUdto.getUemail() %></li>
							<li>전화번호 <%=infoUdto.getUphone() %></li> --%>
							<%-- 	<li>
								<%
								Integer utype=infoUdto.getUtype(); 
								if(utype==0)%>타입: 미승인 회원
								<% if(utype==1)%>타입: 수강생
								<% if(utype==2)%>타입: 강사팀
								<% if(utype==3)%>타입: 영업팀
								<% if(utype==4)%>타입: 취업지원팀
								<% if(utype==5)%>타입: 행정팀
								<% if(utype==6)%>타입: 관리자
								</li>	 --%>
						</ul>	
					</div>
				</div>
				<script>
					$('.menuC li>a.smenu13').on("click", function(){
						$('.smenu13-cont ul#infoUl').empty();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(d){
								var tmp='';
								
								for(i=0; i < d.info_udto.length; i++){
									utype = d.info_udto[i].utype;
									
									if(utype=0) utype ='미승인 회원';
									if(utype==1) utype ='수강생';
									if(utype==2) utype ='강사팀';
									if(utype==3) utype ='영업팀';
									if(utype==4) utype ='취업지원팀';
									if(utype==5) utype ='행정팀';
									if(utype==6) utype ='관리자';
									
									tmp = '<li>'+d.info_udto[i].uids+'</li>';
									tmp += '<li>'+d.info_udto[i].uname+'</li>';
									tmp += '<li>'+d.info_udto[i].uemail+'</li>';
									tmp += '<li>'+d.info_udto[i].uphone+'</li>';
									tmp += '<li>'+utype+'</li>';
									
									$('.smenu13-cont ul').append(tmp);
								}
								$('.smenu13-cont tr').css('cursor','hand');
							}
						});
					});
				</script>
				
				<%//TODO 직원공통:건의사항 %>
				<div class="content col-8 smenu14-cont">
				<!-- idx number primary key,
				utype number not null,
				uids varchar2(12) not null,
				upw varchar2(15) not null,	
				regdate date default sysdate not null,  
				cntnt clob 
				-->
				<%-- 	<%ArrayList<BoardDto>noticeBoard_blist = (ArrayList) request.getAttribute("noticeBoard_blist"); %> --%>
				
					<h1>건의사항</h1>
					<div class="suggest">
						<form action="newsuggest_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<input type="hidden" id="id" name="id" readonly>
								<label for="pw">비밀번호</label>
								<input type="text" id="pw" name="pw" />
								<label for="title">제목</label>
								<input type="text" id="title" name="title" />
							</div>
							<div>
								<textarea name="sgsttext" id="sgsttext" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="button">뒤로</button>
							</div>
						</form>
					</div>
				</div>
				
				<%//TODO 직원공통:공지사항 %>
				<div class="content col-8 smenu15-cont">
					<%-- <%for(ArtclDto ardto: noticeList_blist){%>
						<th>ardto.get
					<%} %>	 --%>
					
					<h1>공지사항</h1>
					<div class="noticeList">
						<table>
							<tr id="headrow">
								<th>날짜</th>
								<th>글번호</th> 
								<th>글쓴이</th>
								<th>제목</th>
							</tr>
						</table>
					</div>
					
					<div class="noticeDetail">
						<div>
							<ul>
								<li>글쓴이: <span id="noticeAuthor"></span></li>
								<li>제목: <span id="noticeTitle"></span></li>
							</ul>
						</div>
						<div>
							<textarea name="noticeCntnt" id="noticeCntnt" rows="10" cols="30"></textarea>
						</div>
					</div>
				</div>
				<script>
					$('.menuC li>a.smenu15').on("click", function(){
						$('content smenu15-cont div.noticeDetail').hide();
						$('.noticeList tr:first').nextAll().remove();
						$.ajax({
							'url': 'stf_result.hb',
							'method': 'get',
							'dataType': 'json',
							'contentType':'application/json; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(data){
								var date,idx,uids,title;
								var tmp='';
								
								for(i=0; i < data.noticeBoard_blist.length; i++){
									date = data.noticeBoard_blist[i].regdate;
									idx = data.noticeBoard_blist[i].idx;
									uids = data.noticeBoard_blist[i].uids;
									title = data.noticeBoard_blist[i].title;
									
									tmp = '<tr id="tclick'+i+'">';
									tmp += '<th>'+date+'</th>';
									tmp += '<th id="idx">'+idx+'</th>';
									tmp += '<th>'+uids+'</th>';
									tmp += '<th>'+title+'</th>';
									tmp += '</tr>';
									
									$('.smenu15-cont .noticeList table').append(tmp);
								}
								$('.smenu15-cont .noticeList tr').css('cursor','hand');
							}
						});
					});
					
					$('.smenu15-cont .noticeList tr').click(function(){
						var idx = $(this).text();
						alert(idx);
						/* $.ajax({
							'url':'read_noticedetail.hb',
							'date':{},
							'method': 'post',
							'dataType': 'json',
							'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
							'error': function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    },
							'success': function(data){
								alert('진행 전');
								var date,idx,uids,title;
								var tmp='';
								
								for(i=0; i < data.noticeList.length; i++){
									date = data.noticeList[i].regdate;
									idx = data.noticeList[i].idx;
									uids = data.noticeList[i].uids;
									title = data.noticeList[i].title;
									
									tmp = '<tr class="tclick'+i+'">';
									tmp += '<th>'+date+'</th>';
									tmp += '<th>'+idx+'</th>';
									tmp += '<th>'+uids+'</th>';
									tmp += '<th>'+title+'</th>';
									tmp += '</tr>';
									
									$('.smenu15-cont .noticeList table').append(tmp);
								}
							}
						}); */
					});
					
					//{"noticeList":[{idx:"", uids:"" },{idx:"", uids:""},{idx:"", udis:""}]}
					// noticeList = [{idx:"", uids:"" },{idx:"", uids:""},{idx:"", udis:""}]
				</script>
				<%//TODO 직원공통:게시판%>
				<div class="content col-8 smenu16-cont">
					<h1>게시판</h1>
					<div class="boardPage1">
						<table class="boardList">
							<tr class="boardListRow1">
								<th>날짜</th>
								<th>글번호</th>
								<th>글쓴이</th>
								<th>제목</th>
							</tr>
							<tr class="boardListRow2"> 
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>	
							<tr class="boardListRow3">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>	
							<tr class="boardListRow4">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>	
							<tr class="boardListRow5">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>
							<tr class="boardListRow6">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>
							<tr class="boardListRow7">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>
							<tr class="boardListRow8">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>
							<tr class="boardListRow9">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>
							<tr class="boardListRow10">
								<th>' </th>
								<th>' </th>
								<th>' </th>
								<th>' </th>
							</tr>
						</table>
						<div class="pageNumber">
						<ul>
							<li>1</li>
						</ul>
						</div>
						<div>
							<button value="write">쓰기</button>
							<button value="search">검색</button>
						</div>
					</div>
					
					<div>
						<table>
						
						</table>
					</div>
					<div>
						<table>
						
						</table>
					</div>
					<div>
						<table>
						
						</table>
					</div>
				</div>

				<!-- content end -->

			</div>
			<script type="text/javascript">
				$('.content .smenu16-cont').on('click',function(){
					$.ajax({
						'url':'read_noticelist.hb',
						'method':'get',
						'dataType': 'json',
						'contentType':'application/json; charset=UTF-8',
						'error': function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    },
						'success': function(d){
							var rows=d.numbers.rows;
							var pages=d.numbers.pages;
							var y=1;
							var cnt=0;
							var tmp;
							for(var i=1; i <=d.numbers.pages; i++){
								$('.content .smenu16-cont div').append('<table class="boardPage'+i+'">');
								for(var j=1; j<=10; j++){
									
									if(cnt<data.noticeList.length){
	
									tmp = '<tr>';
									tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].date+'</th>';
									tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].idx+'</th>';
									tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].uids+'</th>';
									tmp += '<th class="boardRow'+cnt+'">'+d.noticeList[cnt].title+'</th>';
									tmp += '</tr>';
									
									$('div>table').append(tmp);
																	
									cnt++;
									}else{
										break;
									}
								}
								$('div').append('</table>');
								$('ul#num>').append('<li>'+i+'<li>');
							}
								$('.smenu15-cont .noticeList table').append(tmp);
							$('.smenu15-cont .noticeList tr').css('cursor','hand');
						}
					});
				});
			</script>
		</div>
		<div class="row" id="mid-menu">
			<%//TODO 후기임당%>
			<div class="col-12 mol-12">
				<p>~~후기임당~~</p>
				<table>
					<tr>
						<th>수강후기</th>
						<th>취업후기</th>
						<th>취업현황</th>
					</tr>
				</table>
			</div>

		</div>
		<!-- footer -->
		<div class="row footer">
			<div class="col-2 mcol-0" id="mlogos">logo</div>
			<div class="col-10 mcol-12">copyright</div>
		</div>
</body>

</html>