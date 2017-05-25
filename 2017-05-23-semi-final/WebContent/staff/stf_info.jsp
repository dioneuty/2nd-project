<%@page import="com.hb.student.model.HomeworkDto"%>
<%@page import="com.hb.board.model.BoardDto"%>
<%@page import="com.hb.student.model.StuDto"%>
<%@page import="com.hb.staff.model.TchrDto"%>
<%@page import="com.hb.staff.model.EduDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">

<!-- //TODO -->
<head>
<title>한빛교육센터 홍대점</title>
<meta name="viewport" content="width = device-width, initial-scale=1.0"> 
<link rel="stylesheet" type="text/css" href="../css/mygrid.css">
<link rel="stylesheet" type="text/css" href="../css/contentsTitle.css">
<link href="../css/mygrid2.css" rel="stylesheet" type="text/css" /> <!-- content내의 submenu,subcontent 프레임  grid -->
<link href="../css/std_info.css" rel="stylesheet" type="text/css" /> <!-- subcontent 내부 내용 css -->
<link href="../css/board.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
<meta charset="UTF-8" />

<!-- //TODO -->
<style type="text/css">
.container2{
	background-color: white;
}
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

.container2 table{
	overflow-x: scroll;
}

.container2 #attend{
	height:40px;
	width: 90%;
	line-height: 40px;
	text-align: center;
	margin: 15px 15px;
	font-size: 0.7em;
}
.container2 #atday{
	width: 90%;
	height:230px;
	margin: 15px 15px;
}

.container2 table{
	width : 90%;
	margin: 15px auto;
	border: 1px solid black;
	overflow-x: scroll;

}

container2 table td {
    border: 1px solid black;
    text-align: center;
}
.container2 table tr:first-child td{
	background-color: dodgerblue;
}
.container2 table th{
	background-color: dodgerblue;
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

.hide{
	display: none;
}



/*id 체크 유무*/
.chkno{
	color: red;
	border: 2px solid red;				
}
.chkyes{
	color: green;
	border: 2px solid green;		
}

/* 게시판 목록, 게시판 글쓰기 공간 */
.showList{
	width:100%;
} 
.showWrite{
	width: 100%;
}
.showWrite .p{
	border: 1px solid white;
	background-color: dodgerblue;
	color: white;
}
.showWrite .input_form input{
	width: 100%;
	display: block;
}
.showWrite .input_form textarea{
	width: 100%;
}
.users{
	width: 100%;
	
}
</style>
<%
	Integer usertype = (Integer)session.getAttribute("utype");
	ArrayList<HomeworkDto> hlist = (ArrayList<HomeworkDto>) request.getAttribute("hbean");
	String pathStf = request.getContextPath();
%>

<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>

<!-- //TODO -->

</head>

<!--//TODO -->
<body>
	<%@ include file="../temple/menu.jspf"%>
	<script type="text/javascript">
	var res =<%=result%>;
	var usertype = <%=usertype%>;
	console.log("login: "+res+"/ usertype: "+usertype);
	$(document).ready(function() {
		$(
			'.header>div:nth-child(1)>table>tbody>tr>td>a,.header>div:nth-child(3)>table>tbody>tr>td>a')
			.click(
				function(e) {
					e.preventDefault();
					$('.header>div:nth-child(6)')
							.slideToggle("slow");
					$('.header>div:nth-child(7)')
							.slideToggle("slow");
					$('.header>div:nth-child(8)')
							.slideToggle("slow");
				});
		
		$('#login>a').click(function(e) {
			e.preventDefault();
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
				$('.smenu4-1-cont').show();
			}
			if ($(this).hasClass('smenu4-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu4-2-cont').show();
			}
			if ($(this).hasClass('smenu4-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu4-3-cont').show();
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
				$('.smenu6-2-cont').show();
			}
			if ($(this).hasClass('smenu6-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu6-3-cont').show();
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
				$('.smenu7-3-cont').show();
			}
			if ($(this).hasClass('smenu7-4')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu7-4-cont').show();
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
				$('.smenu8-1-cont').show();
			}
			if ($(this).hasClass('smenu8-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu8-2-cont').show();
			}
			if ($(this).hasClass('smenu8-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu8-3-cont').show();
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
				$('.smenu9-2-cont').show();
			}
			if ($(this).hasClass('smenu9-3')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu9-3-cont').show();
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
			if ($(this).hasClass('smenu12-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu12-1-cont').show();
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
			if ($(this).hasClass('smenu16-1')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu16-1-cont').show();
			}
			if ($(this).hasClass('smenu16-2')) {
				$('.tab').removeClass('active');
				$(this).addClass('active');
				$('.content').hide();
				$('.smenu16-2-cont').show();
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
		$('button[type="reset"]').click(function(){
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
		$('p#loading').text('ajax 로딩 중');
		$('p#loading').css({'text-align':'center','color':'blue','border':'2px solid red'});
	});
	$(document).ajaxSuccess(function() {
		$('p#loading').text('ajax 로딩 완료');
		$('p#loading').css({'text-align':'center','color':'green','border':'2px solid blue'});
	})
	$(document).ajaxError(function() {
		$('p#loading').text('ajax 에러');
		$('p#loading').css({'text-align':'center','color':'red','border':'2px solid yellow','backgroundColor':'red'});
	})
</script>
	
	<!-- content -->
	<div class="container2">
		<div class="row">
		
			<!-- menu start -->
			<div class="aside col-2 mcol-9">
				<img src="../imgs/staff.png" alt="a" />
				<p id="loading"></p>
				
				<div class="menu menuB">
					<p id="mname">영업팀</p> <!-- 교육생 등록, 수강생 등록, 상담 -->
					<ul>
						<li><a href="#" class="tab smenu1">오프라인 교육생 등록 <span>→</span></a></li>
						<li><a href="#" class="tab smenu2">온라인 교육생 등록 <span>→</span></a></li>
						<li><a href="#" class="tab smenu3">상담 예정 수강생 목록 <span>→</span></a></li>
						<li><a href="#" class="tab smenu4">수강 상담 게시판 관리 <span>→</span></a></li>
					</ul>
				</div>
				
				<!--//FIN 메뉴:취업 지원팀-->
				<div class="menu menuJ">
					<p>취업 지원팀</p>	<!-- 취업상담, 취업지원, 취업상담 여부 목록 -->
					<ul>
						<li><a href="#" class="tab smenu4-1">취업 상담 예정 수강생 목록 <span>→</span></a></li>
						<li><a href="#" class="tab smenu4-2">채용 공고 게시판 관리 <span>→</span></a></li>
						<li><a href="#" class="tab smenu4-3">취업 상담 게시판 관리 <span>→</span></a></li>
					</ul>
				</div>
				
				<!--//TODO 메뉴:행정팀-->
				<!-- 수강생 관리, 강사 관리, 기타 직원 관리, 강의 관리 -->
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
				
				<!--//TODO 메뉴:강사팀-->
				<div class="menu menuT">
					<p>강사팀</p>
					<ul>
						<li><a href="#" class="tab smenu11">출석승인 <span>→</span></a></li>
						<li><a href="#" class="tab smenu12">시험평가 <span>→</span></a></li>
						<li><a href="#" class="tab smenu12-1">과제게시판 <span>→</span></a></li>
					</ul>
				</div>
				
				<!--//TODO 메뉴:직원공통-->
				<div class="menu menuC">
					<p>직원공통</p>
					<ul>
						<li><a href="#" class="tab smenu13 active">직원 개인정보 <span>→</span></a></li>
						<li><a href="#" class="tab smenu14">건의사항 <span>→</span></a></li>
						<li><a href="#" class="tab smenu15">공지사항 <span>→</span></a></li>
						<li><a href="#" class="tab smenu16">자유게시판 <span>→</span></a></li>
						<li><a href="#" class="tab smenu16-1">교육후기게시판 <span>→</span></a></li>
						<li><a href="#" class="tab smenu16-2">취업현황 <span>→</span></a></li>
					</ul>
				</div>
				
				<div class="char1">
					<img src="../imgs/char.png" alt="a" />
					<h2> 02 ㆍ 707 ㆍ 1480 </h2>
					<h4> 평일  09:00 ~ 22:00</h4>
					<h4> 토~일,공휴일  </h4>
					<h4> 10:00 ~ 18:00 </h4>
					<img src="../imgs/main/kakaotalkdirect.png" alt="" style="width:100%;">
				</div>
			</div>
			<!-- menu end -->
			
			<!-- content  -->
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu1-cont">
				<div id="title-left">오프라인 등록</div>
				<div id="title-right"></div>
				<span id=oaddstatus></span>
				<form action="addstu_result.hb" method="post" class="addOffline">
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
						<label for="enum">수강코스: </label>
						<select name="enum" id="offadd">
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
					
					$.get('stf_result.hb',{'signal':1},function(d){
						var tmp;
						
						for(i=0; i < d.addStuFormList_elist.length; i++){
							tmp = '<option value="'+d.addStuFormList_elist[i].enum2+'">'+d.addStuFormList_elist[i].ename+'</option>';
							$('.smenu1-cont select#offadd').append(tmp);
						}
						$('.smenu1-cont select#offadd').css('cursor','hand');
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
						$.get('idchk.hb',{'id':value},function(d){
							if(d.result){
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
						});
					}
				}).blur(function(){
					if(nxt==false){
						$('.smenu1-cont form #idchk').empty();	
					}
				});	

				//공란 검사, 값 전송
				$('.smenu1-cont form').on('submit', function(event){
					event.preventDefault();
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
						$.post('addstu_result.hb',$('.smenu1-cont form').serialize(),function(d){
							if(d.result){
								$('span#oaddstatus').text('추가 성공했습니다.');
								$('.smenu1-cont form input').val('');
							}else{
								$('span#oaddstatus').text('추가 실패했습니다.');
								$('.smenu1-cont form input').val('');
							}
						});
					}else{
						return;
					}	
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu2-cont">
				<div id="title-left">온라인 등록</div>
				<div id="title-right"></div>
				<div>
					<form action="confirmstu_result.hb" method="post">
				 		<div>
							<h1>승급할 사용자를 고르세요</h1>
							<span id=uaddstatus></span>
						</div>
						<div>
							<label for="unum">승급할 수강생: </label>
							<select name="unum" id="onaddS">
							</select>
						</div>
						<div>
							<label for="enum">수강코스: </label>
							<select name="enum" id="onaddC">
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
					$.get('stf_result.hb',{'signal':2},function(d){
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
					});
				});
				
				//공란 검사, 값 전송
				$('.smenu2-cont form').on('submit', function(event){
					event.preventDefault();
					//값 전송	
					$.post('confirmstu_result.hb',$('.smenu2-cont form').serialize(),function(d){
						if(d.result){
							$('span#uaddstatus').text('승급 성공했습니다.');
						}else{
							$('span#uaddstatus').text('승급 실패했습니다.');
						}
					});
				});
				$('.smenu2-cont select').on("focusin", function(){
					$('span#uaddstatus').empty();
				});
			</script>
			
			<!--//FIXME -->
			<div class="content col-7 mcol-9 smenu3-cont">
				<div id="title-left">상담 목록</div>
				<div id="title-right"></div>
				<!-- select u.uname, u.uids, e.ename from student s, hanb_user u, education e where u.unum=s.unum and s.s_empoly=0 and e.enum=s.enum; -->
				<table class="waitFutureStu">
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>전화번호</th>
					</tr>
				</table>
			</div>
			<script type="text/javascript">
				$('.menuB li>a.smenu3').on('click',function(){
					$.get('stf_result.hb',{'signal':3},function(d){
						var tmp='';
							
						for(i=0; i < d.cnsltWaiting.length; i++){
							tmp = '<tr id="tclick'+i+'">'
								+ '<td>'+d.cnsltWaiting[i].uname+'</td>'
								+ '<td>'+d.cnsltWaiting[i].uids+'</td>'
								+ '<td>'+d.cnsltWaiting[i].uphone+'</td>'
								+ '</tr>';
							
							$('.smenu3-cont table.waitFutureStu').append(tmp);
						}
						$('.smenu3-cont tr').css('cursor','hand');
					});
				});
			</script>
			
			<!--//FIXME -->
			<div class="content col-7 mcol-9 smenu4-cont">
				<div id="title-left">상담 관리</div>
				<div id="title-right"></div>
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			

			<!-- //TODO 상담 예정 수강생 목록 -->
			<div class="content col-7 mcol-9 smenu4-1-cont">
				<div id="title-left">상담예정 수강생</div>
				<div id="title-right"></div>
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
				$('.menuJ li>a.smenu4-1').on('click',function(){
					$('.smenu4-1-cont tr:first').nextAll().remove();

					$.get('stf_result.hb',{'signal':41},function(d){
						var tmp='';
						var empoly='아니오'; 
						var sucemp='아니오';
						
						for(i=0; i < d.jbCnsltStuList_ulist.length; i++){
							if(d.jbCnsltStuList_ulist[i].s_empoly==1){
								empoly='예';
							}
							if(d.jbCnsltStuList_ulist[i].s_sucemp==1){
								sucemp=='예';
							}
							
							tmp = '<tr id="tclick'+i+'">'
								+ '<td>'+d.jbCnsltStuList_ulist[i].uname+'</td>'
								+ '<td>'+d.jbCnsltStuList_ulist[i].uids+'</td>'
								+ '<td>'+d.jbCnsltStuList_ulist[i].ename+'</td>'
								+ '<td>'+empoly+'</td>'
								+ '<td>'+sucemp+'</td>'
								+ '</tr>';
							
							$('.smenu4-1-cont table.jbCnsltStuList').append(tmp);
						}
						$('.smenu4-1-cont tr').css('cursor','hand');
					});
				});				
			</script>
			
			<!-- //TODO 채용 공고 게시판 관리 -->
			<div class="content col-7 mcol-9 smenu4-2-cont">
				<div class="showList">
					<h1>채용 공고 게시판 관리</h1>
					<table>
						<tr>
							<th>업체명</th>
							<th>작성일</th>
							<th>모집인원</th>
							<th>고용형태</th>
							<th>마감날짜</th>
						</tr>
					</table>
					<div class="listLink">
					</div>
					<p>
					<button type="callWrite">쓰기</button>			
					</p>
					<a name="link"></a>
				</div>
				<div class="showWrite">
					<div id="title-left">채용 공고 게시판 글쓰기</div>
					<div id="title-right"></div>
					<div class="suggest">
						<span id="suggestStatus"></span>
						<form id="ntcForm" action="newjbntc_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="ji_num">채용정보번호</label>
								<input type="number" name="ji_num" id="ji_num" placeholder="숫자를 입력하세요" />
								<label for="ji_comp">업체명</label>
								<input type="text" name="ji_comp" id="ji_comp" placeholder="채용하는 업체명" />
								<label for="ji_area">지역</label>
								<input type="text" name="ji_area" id="ji_area" placeholder="채용하는 지역명" />
								<label for="ji_recruit">모집인원</label>
								<input type="number" name="ji_recruit" id="ji_recruit" min="0" placeholder="숫자를 입력하세요" />
								<label for="ji_type">고용형태</label>
								<input type="text" name="ji_type" id="ji_type" placeholder="정직원/계약직 등" />
								<label for="ji_enddate">마감날짜</label>
								<input type="text" name="ji_enddate" id="ji_enddate" placeholder="채용이 마감되는 날짜" />
								<label for="ji_date">작성일</label>
								<input type="date" name="ji_date" id="ji_date" placeholder="채용공고가 시작되는 날" />
								<label for="ji_pay">급여</label>
								<input type="text" name="ji_pay" id="ji_pay" placeholder="연봉/월급/주급/시급 등" />
								<label for="ji_phone">연락처</label>
								<input type="text" name="ji_phone" id="ji_phone" placeholder="휴대폰/일반전화" />
							</div>
							<div>
								<p><label for="ji_cont">채용내용</label></p>
								<textarea name="ji_cont" id="ji_cont" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
						</form>
					</div>
				</div>
				<div class="showDetail">
				</div>
			</div>
			
			<script>
				$('.smenu4-2-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu4-2-cont div.showList').hide();
					$('.smenu4-2-cont div.showWrite').show();
				});	
				
				$('.smenu4-2-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu4-2-cont div.showWrite').hide();
					$('.smenu4-2-cont div.showList').show();
				});	

				$('.smenu4-2-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu4-2-cont div.showWrite form input)').val('');
				});	
				
				//목록 생성 
				///////////////////
				
				
				
				$('.menuJ li>a.smenu4-2').on('click',function(){
					function movepage(a) {
				        $(".smenu4-2-cont tr").each(function(idx) {
				            var last = a * 20;
				            var first = last - 19;
				            if (( idx > 0 ) && ( first <= idx ) && ( last >= idx )) {
				                $(this).show();
				            } else if (idx == 0) {
				        
				        	}else {
				                $(this).hide();
				            }
				            $('.smenu4-2-cont tr.trCntnt').hide();
				        })
					}	
					
					$('.smenu4-2-cont div.showList').show();
					$('.smenu4-2-cont div.showWrite').hide();
					$('.smenu4-2-cont table tr:not(:first)').remove();
					
					$.get('read_jbntclist.hb',{'signal':42},function(d){
						var tmp='';
						var pagelink ='';	
						
						for(var i = 0; i < d.pages; i++){
							pagelink += "<a href='#' value="+(i+1)+" onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
							$('div.smenu4-2-cont div.listLink').html(pagelink);
						}
						
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr class="trSub">'
									+ '<td>'+d.jbNtcList_jlist[j].ji_comp+'</td>'
									+ '<td>'+d.jbNtcList_jlist[j].ji_date+'</td>'
									+ '<td>'+d.jbNtcList_jlist[j].ji_recruit+'</td>'
									+ '<td>'+d.jbNtcList_jlist[j].ji_type+'</td>'
									+ '<td>'+d.jbNtcList_jlist[j].ji_enddate+'</td>'
								+ '</tr>'
								+ '<tr class="trCntnt">'	
									+ '<td colspan="5">'+d.jbNtcList_jlist[j].ji_cont+'</td>'
								+ '</tr>';
							//console.log('j: '+j);
							$('.smenu4-2-cont table').append(tmp);
						}

						
						//$('.smenu4-2-cont table tr').css('cursor','hand');
						
						$('.smenu4-2-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});

						$(".smenu4-2-cont tr").each(function(idx) {
						var seenum = 20;
					        if (idx > seenum) {
					            $(this).hide();
					        }
					    });  
						
						//내용 가리고 보이기
						$('div.smenu4-2-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu4-2-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	
					});
				});	
				
				//초기화
				/*$('.smenu4-2-cont form').on('click',function(){
					$('div.smenu4-2-cont form input:not(#id)').val('');
					$('div.smenu4-2-cont span#suggestStatus').empty();
				});*/
				
				//전송
				$('.smenu4-2-cont form').on('submit',function(event){
					var nxt=false;
					event.preventDefault();
					$('div.smenu4-2-cont span#suggestStatus').empty();
				
					//공란 검사
					$('.smenu4-2-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					$('.smenu4-2-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					if(nxt=false){
						$.post($('.smenu4-2-cont form#ntcForm').attr('action'), $('.smenu4-2-cont form#ntcForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('.smenu4-2-cont span#suggestStatus').text('작성 완료');
								$('.smenu4-2-cont div.showWrite').hide();
								$('.smenu4-2-cont div.showList').show();
							}else{
								$('.smenu4-2-cont span#suggestStatus').text('작성 실패');	
							}
						});
					}else{
						return;
					}
				});
				
			</script>


			<!--//TODO 취업 상담 게시판 관리 -->
			<div class="content col-7 mcol-9 smenu4-3-cont">
				<div class="showList">
					<div id="title-left">취업 상담</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>날짜</th>
							<th>글번호</th> 
							<th>글쓴이</th>
							<th>제목</th>
						</tr>
					</table>
				
					<div class="listLink">
					</div>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					<a id="scroll" href="scroll"></a>
				</div>
				<div class="showWrite">
					<div id="title-left">취업 상담 글쓰기</div>
					<div id="title-right"></div>
					<div class="jbCnslt">
						<span id="writeJbcnsltStatus"></span>
						<form id="writeJbcnsltForm" action="newjbcnslt_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="jc_uids">글쓴이</label>
								<input type="text" name="jc_uids" id="jc_uids"/>
								<label for="jc_title">제목</label>
								<input type="text" name="jc_title" id="jc_title"/>
							</div>
							<div>
								<p><label for="jc_cont">내용</label></p>
								<textarea name="jc_cont" id="jc_cont" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
						</form>
					</div>
				</div>	
			</div>
			<script type="text/javascript">
				$('.smenu4-3-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu4-3-cont div.showList').hide();
					$('.smenu4-3-cont div.showWrite').show();
				});	
				
				$('.smenu4-3-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu4-3-cont div.showWrite').hide();
					$('.smenu4-3-cont div.showList').show();
				});	

				$('.smenu4-3-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu4-3-cont div.showWrite form input)').val('');
				});	
			
				//목록 생성
				$('.menuJ li>a.smenu4-3').on('click',function(){
					function movepage(a){
						$('.smenu4-3-cont table tr').each(function(idx){
							var last = a * 20;
							var first = last - 19;
							if ((idx > 0) && (first <= idx) && (last >= idx)) {
				                $(this).show();
				            } else if (idx == 0) {
				
				            } else {
				                $(this).hide();
				            }
						});
					}
					
					$('.smenu4-3-cont div.showWrite').hide();
					$('.smenu4-3-cont div.showList').show();
					$('.smenu4-3-cont table  tr:not(:first)').remove();
					
					$.get('read_jbcnslt.hb',{'signal':'4-3'},function(d){
						var tmp='';
						var pagelink ='';	
						
						for(var i = 1; i < d.pages; i++){
							pagelink += "<a onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
						}
						$('div.smenu4-3-cont div.listLink').html(pagelink);
				
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr>'
									+ '<td>'+d.jbcnslt[j].fdate+'</td>'
									+ '<td>'+d.jbcnslt[j].num+'</td>'
									+ '<td>'+d.jbcnslt[j].uname+'</td>'
									+ '<td>'+d.jbcnslt[j].sub+'</td>'
								+ '</tr>'
								+ '<tr class="trCntnt">'	
									+ '<td colspan="4">'+d.jbcnslt[j].content+'</td>'
								+ '</tr>';
							$('div.smenu4-3-cont table').append(tmp);
						} 
						
						$('.smenu4-3-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});
						
						var seenum = 20;
						$('.smenu4-3-cont table tr').each(function(idx){
							if (idx > seenum) {
								$(this).hide();
							}
						})
						
						
						//내용 가리고 보이기
						$('div.smenu4-3-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu4-3-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	
						
						
						$('.smenu4-3-cont .jbNtcList tr').css('cursor','hand');
					});
				});
				
				
					
				//초기화
				/*$('.smenu4-3-cont form').on('click',function(){
					$('div.smenu4-3-cont form input:not(#id)').val('');
					$('div.smenu4-3-cont span#writeJbCnsltStatus').empty();
				});*/
				
				//전송
				$('.smenu4-3-cont form').on('submit',function(event){
					var nxt=false;
					event.preventDefault();
					$('div.smenu4-3-cont span#writeJbCnsltStatus').empty();
				
					//공란 검사
					$('.smenu4-3-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu4-3-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					if(nxt=false){
						$.post($('.smenu4-3-cont form#writeJbCnslt').attr('action'), $('.smenu4-3-cont form#writeJbCnslt').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('.smenu4-3-cont span#writeJbCnsltStatus').text('작성 완료');
								$('.smenu4-3-cont div.showWrite').hide();
								$('.smenu4-3-cont div.showList').show();
							}else{
								$('.smenu4-3-cont span#writeJbCnsltStatus').text('작성 실패');	
							}
						});
					}else{
						return;
					}
				});
			</script>					


			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu5-cont">
				<div id="title-left">회원 관리</div>
				<div id="title-right"></div>
				<div class="users">
				<table class="board" cellpadding=0>
					<tr>
						<th>아이디</td>
						<th>이름</td>
						<th>이메일</td>
						<th>전화번호</td>
						<th>타입</td>
					</tr>
				</table>
				</div>	
			</div>
			<script>
				$('.menuP li>a.smenu5').on("click", function(){
					$('.smenu5-cont tr:first').nextAll().remove();

					$.get('stf_result.hb',{'signal':5},function(d){
						var tmp, utype;
						
						for(i=0; i < d.userList.length; i++){
							utype=d.userList[i].utype;
							var name;
							
							if(utype==0){
								name = '미승인 회원';
							}
							if(utype==1){
								name ='수강생';
							}
							if(utype==2){
								name ='강사팀';
							}
							if(utype==3){
								name ='영업팀';
							}
							if(utype==4){
								name ='취업지원팀';
							}
							if(utype==5){
								name ='행정팀';
							}
							if(utype==6){
								name ='관리자';
							}
							
							tmp = '<tr id="tclick'+i+'">'
								+ '<td>'+d.userList[i].uids+'</td>'
								+ '<td>'+d.userList[i].uname+'</td>'
								+ '<td>'+d.userList[i].uemail+'</td>'
								+ '<td>'+d.userList[i].uphone+'</td>'
								+ '<td>'+name+'</td>'
								+ '</tr>';
							
							$('.smenu5-cont table').append(tmp);
						}
						$('.smenu5-cont tr').css('cursor','hand');
					});
				});
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu6-cont">
				<div id="title-left">출결 관리</div>
				<div id="title-right"></div>
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
					    //jsonArray atndMngList
					    //select uname, udis, s_total, s_append, s_early, s_absent from hanb_user u student s where u.uname=s.name;
					$.get('stf_result.hb',{'signal':6},function(d){
						var tmp;
						
						for(i=0; i < d.mngatndList.length; i++){
							
							tmp = '<tr id="tclick'+i+'">'
								+ '<th>'+d.mngatndList[i].uname+'</th>'
								+ '<th>'+d.mngatndList[i].uids+'</th>'
								+ '<th>'+d.mngatndList[i].s_total+'</th>'
								+ '<th>'+d.mngatndList[i].s_append+'</th>'
								+ '<th>'+d.mngatndList[i].s_early+'</th>'
								+ '<th>'+d.mngatndList[i].s_absent+'</th>'
								+ '</tr>';
							
							$('.smenu6-cont table').append(tmp);
						}
						$('.smenu6-cont tr').css('cursor','hand');
					});
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu6-1-cont">
				<div id="title-left">수강생 목록</div>
				<div id="title-right"></div>
				<table>
					<tr>
						<td>수강생 이름</td>
						<td>교육과목 명</td>
						<td>수강과목1 </td>
						<td>점수 </td>
						<td>수강과목2 </td>
						<td>점수 </td>
						<td>수강과목3</td>
						<td>점수 </td>
						<td>총수강일수</td>
						<td>출석일수</td>
						<td>지각/조퇴일수</td>
						<td>결석일수</td>
						<td>취업 알선 여부</td>
						<td>수료 여부</td>
						<td>취엽 성공 여부</td>
					</tr>
				</table>
			</div>
			<script>
				$('.menuP li>a.smenu6-1').on("click", function(){
					$('.smenu6-1-cont tr:first').nextAll().remove();

					$.get('stf_result.hb',{'signal':61},function(d){
						var tmp='';
						
						for(i=0; i < d.stusList_slist.length; i++){
							tmp = '<tr id="tclick'+i+'">'
								+ '<td>'+d.stusList_slist[i].uname+'</td>'
								+ '<td>'+d.stusList_slist[i].ename+'</td>'
								+ '<td>'+d.stusList_slist[i].esub1+'</td>'
								+ '<td>'+d.stusList_slist[i].fir_sub+'</td>'
								+ '<td>'+d.stusList_slist[i].esub2+'</td>'
								+ '<td>'+d.stusList_slist[i].sec_sub+'</td>'
								+ '<td>'+d.stusList_slist[i].esub3+'</td>'
								+ '<td>'+d.stusList_slist[i].thr_sub+'</td>'
								+ '<td>'+d.stusList_slist[i].s_total+'</td>'
								+ '<td>'+d.stusList_slist[i].s_append+'</td>'
								+ '<td>'+d.stusList_slist[i].s_early+'</td>'
								+ '<td>'+d.stusList_slist[i].s_absent+'</td>'
								+ '<td>'+d.stusList_slist[i].s_empoly+'</td>'
								+ '<td>'+d.stusList_slist[i].s_cmpt+'</td>'
								+ '<td>'+d.stusList_slist[i].s_sucemp+'</td>'
								+ '</tr>';
							
							$('.smenu6-1-cont table').append(tmp);
						}
						$('.smenu6-1-cont tr').css('cursor','hand');
					});
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu6-2-cont">
				<div id="title-left">수강생 수정</div>
				<div id="title-right"></div>	
				<span id="modifyStuStatus"></span>
				<form id="modifyStuForm" action="modifystu_result.hb" method="post">
					
					<label for="unum">수정할 수강생</label>
					<select name="unum" id="modifyUnameSlt">
					</select>
					
					<label for="ename">교육이름</label>
					<select name="ename" id="modifyEnameSlt">
					</select>
					<!-- select s_total from student where unum=?-->
					
					<!-- max=s_total -->
					<!-- $('smenu6-2cont input[type="number"]').attr("max",s_total);-->
					
					<label for="uname" >수강생 이름</label>
					<input type="text" name="uname" id="modifyStuName"/>
					
					<label for="s_append">출석일수</label>
					<input type="number" name="s_append" min="0" id="modifyStuAtnd" />
					
					<label for="s_early">지각/조퇴일수</label>
					<input type="number" name="s_early" min="0" id="modifyStuEarly"/>
					
					<label for="s_absent">결석일수</label>
					<input type="number" name="s_absent" min="0" id="modifyStuAbsent" /> 
					
					<label for="s_empoly">취업 알선 여부</label>
					<select name="s_empoly" id="modifyStuEmpoly">
						<option value="1">예</option>
						<option value="0">아니오</option>
					</select>
					
					<label for="s_cmpt">수료 여부</label>
					<select name="s_cmpt" id="modifyStuCmpt">
						<option value="1">예</option>
						<option value="0">아니오</option>
					</select>
					
					<label for="s_sucemp">취업 성공 여부</label>
					<select name="s_sucemp" id="modifyStuSucemp">
						<option value="1">예</option>
						<option value="0">아니오</option>
					</select>
					
					<button type="submit"></button>
					<button type="reset"></button>
				</form>	
			</div>
			<script type="text/javascript">
				//수강생정보 불러들이기, 교육이름 불러들이기
				$('div.menuP li>a.smenu6-2').on('click',function(){
					$('div.smenu6-2-cont span#modifyStuStatus').empty();
					
					$.get('stf_result.hb',{'signal':62},function(d){
						//수정할 수강생 목록
						for(i=0; i < d.modifyStuList_slist.length; i++){
							var tmp = '';
							tmp = '<option value="'+d.modifyStuList_slist[i].unum +'">'
							    + d.modifyStuList_slist[i].uids+': '+d.modifyStuList_slist[i].uname
							    + '</option>';
							$('div.smenu6-2-cont select#modifyUnameSlt').append(tmp);
						}
						
						//수정할 교육 목록
						for(i=0; i < d.modifyEduList_elist.length; i++){
							var tmp = '';
							tmp = '<option value="'+d.modifyEduList_elist[i].enum2 +'">'
								+ d.modifyEduList_elist[i].ename
								+ '</option>';
							$('div.smenu6-2-cont select#modifyEnameSlt').append(tmp);
						}
					});
				});
				
				//선택 즉시 내용 반영
				$('div.smenu6-2-cont select#modifyUnameSlt').change(function(){
					$('div.smenu6-2-cont select#modifyStuUnameSlt>option:selected').each(function(){
						var unum = $(this).val();
						if(value.trim()!=''){
							//alert(value);
							$.get('stuinfoshow.hb',$.param({'unum':unum}),function(d){
								var uname = d.stuinfo.uname;
								var s_append = d.stuinfo.s_append;
								var s_early = d.stuinfo.s_early;
								var s_absent = d.stuinfo.s_absent;
								var s_empoly = d.stuinfo.s_empoly;
								var s_cmpt = d.stuinfo.s_cmpt;
								var s_sucemp = d.stuinfo.s_sucemp;
								//console.log("sub1: "+esub1+" / sub2: "+esub2+" / sub3: "+esub3);
								$('input#modifyStuName').val(uname);
								$('input#modifyStuAtnd').val(s_append);
								$('input#modifyStuEarly').val(s_early);
								$('input#modifyStuAbsent').val(s_absent);
								$('input#modifyStuEmpoly').val(s_empoly);
								$('input#modifyStuCmpt').val(s_cmpt);
								$('input#modifyStuSucemp').val(s_sucemp);
							});
						}
					});
				});
				
				//공란 검사 및 값 전송
				$('div.smenu6-2-cont form#modifyTchrForm').on('submit', function(event){
					event.preventDefault();
					var nxt = false;
					if($('div.smenu6-2-cont input').trim().val()==''){
						nxt = true;
					}
					
					if(nxt == false){
						$.post('modifytstu_result.hb', $('div.smenu6-2-cont form#modifyStuForm').serialize(), function(d){
							var modifytsturesult = d.result;
							if(modifytchrresult == 1){
								$('div.smenu6-2-cont span#modifyTchrStatus').text('수정 성공했습니다');
							}else{
								$('div.smenu6-2-cont span#modifyTchrStatus').text('수정 실패했습니다');
							}
						});
					}else{
						return;
					}
				});
			</script>
			
			
			<!--//TODO 행정팀:수강생 삭제 -->
			<div class="content col-7 mcol-9 smenu6-3-cont">
				<div id="title-left">수강생 삭제</div>
				<div id="title-right"></div>
				<span id="delStuStatus"></span>
				<form action="delstu_result.hb" method="post" id="delStuForm">
					<label for="stuList">삭제할 수강생</label>
					<select name="stuList" id="delStuList">
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
				//버튼 누를 시 나오는 내용 
				$('div.menuP li>a.smenu6-3').on('click',function(){
					$('div.smenu6-3-cont span#delStuStatus').empty();
					
					$.get('stf_result.hb',{'signal':63},function(d){
						//삭제할 수강생 목록
						for(i=0; i < d.delStuList_slist.length; i++){
							var tmp = '';
							tmp = '<option value="'+d.delStuList_slist[i].unum +'">'
								+ d.delStuList_slist[i].uids+': '+d.delStuList_slist[i].uname 
								+ '</option>';
							$('div.smenu6-3-cont form select#delStuList').append(tmp);
						}
					});
				});
				
				//결과 반영
				$('div.smenu6-3-cont form#modelStuForm').on('submit',function(event){
					event.preventDefault();
					
					if(confirm('정말로 삭제하시겠습니까?') == true){
						$.post('delstu_result.hb',$('div.smenu6-3-cont form#delStuForm').serialize(),function(d){
							var delresult = d.result;
							
							if(delresult>0){
								$('div.smenu6-3-cont span#delStuStatus').text('삭제 성공하였습니다');
							}else{
								$('div.smenu6-3-cont span#delStuStatus').text('삭제 실패하였습니다');
							}
						});
					}else{
						return;
					}
				});
			
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu7-1-cont">
				<div id="title-left">강사 목록</div>
				<div id="title-right"></div>
				<table>
					<tr>
						<td>강사이름</td>
						<td>담당교육</td>
					</tr>
				</table>
			</div>
			<script>
				$('.menuP li>a.smenu7-1').on("click", function(){
					$('.smenu7-1-cont tr:first').nextAll().remove();
					$.get('stf_result.hb',{'signal':71},function(d){
						var tmp='';
						
						for(i=0; i < d.tchrList_tlist.length; i++){
							uname = d.tchrList_tlist[i].uname;
							ename = d.tchrList_tlist[i].ename;
							
							tmp = '<tr id="tclick'+i+'">'
								+ '<td>'+uname+'</td>'
								+ '<td>'+ename+'</td>'
								+ '</tr>';
							
							$('.smenu7-1-cont table').append(tmp);
						}
						$('.smenu7-1-cont tr').css('cursor','hand');
					});
				});
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu7-2-cont">
				<div id="title-left">강사 추가</div>
				<div id="title-right"></div>
				<span id="taddstatus"></span>
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
					$.get('stf_result.hb',{'signal':72},function(d){
						var tmp;
						
						for(i=0; i < d.addTchrForm_elist.length; i++){
							tmp = '<option value="'+d.addTchrForm_elist[i].enum2+'">'+d.addTchrForm_elist[i].ename+'</option>';
							$('.smenu7-2-cont select#cls').append(tmp);
						}
						$('.smenu7-2-cont select#cls').css('cursor','hand');
					});
				});
			
				var nxt=false;
				
				//중복 검사
				$('.smenu7-2-cont form #id').on("keyup",function(){
					//alert('키보드 입력');
					var value=$('.smenu7-2-cont form #id').val();
					if(value.trim()!=''){
						//alert(value);
						$.get('idchk.hb',{'id':value},function(d){
							if(d.result){
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
						});
					}
				}).blur(function(){
					if(nxt==false){
					$('.smenu7-2-cont form #idchk').empty();
					}
				});	

				//공란 검사, 값 전송
				$('.smenu7-2-cont form').on('submit', function(event){
					event.preventDefault();
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
						$.post('addteacher_result.hb',$('.smenu7-2-cont form').serialize(),function(d){
							if(d.result){
								$('span#taddstatus').text('추가 성공했습니다.');
								$('.smenu7-2-cont form input').val('');
							}else{
								$('span#taddstatus').text('추가 실패했습니다.');
								$('.smenu7-2-cont form input').val('');
							}
						});
					}else{
						return;
					}	
				});
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu7-3-cont">
				<div id="title-left">강사 수정</div>
				<div id="title-right"></div>
				<span id="modifyTchrStatus"></span>
				<form action="modifytchr_result.hb" method="post" id="modifyTchrForm">
					<label for="modifyTchr">수정할 강사</label>
					<select name="modifyTchr" class="modifyTchrListSel">
					</select>
					<label for="ename">담당교육</label>
					<select name="ename" class="selectEname" >
					</select>
					<label for="tchrName">강사이름</label>
					<input type="text" name="tchrName" />
					
					<p>
					<button value="submit">완료</button>
					<button value="reset">취소</button>
					</p>
					<!--update hanb_user set uname= where unum=? -->
					<!--update teacher set uname= where unum=? -->
				</form>
			</div>
			<script type="text/javascript">
				$('.menuP li>a.smenu7-3').on('click',function(){
					$('div.smenu7-3-cont span#modifyTchrStatus').empty();
					//수정할 강사 목록
					$.get('tchrinfoshow.hb',function(d){
						for(var i=0; i<d.tchrList.length;i++){
							var tmp = '<option value="'+d.tchrList[i].unum+'">'
									+ d.tchrList[i].uids+': '+d.tchrList[i].uname
									+ '</option>';
							$('div.smenu7-3-cont select.modifyTchrListSel').append(tmp);		
						}	
					});
					//담당교육 목록
					$.get('clsinfoshow.hb',function(d){
						for(var i=0; i<d.clsList.length;i++){
							var tmp = '<option value="'+d.clsList[i].enum2+'">'
									+d.clsList[i].ename
									+ '</option>';
							$('div.smenu7-3-cont select.selectEname').append(tmp);		
						}	
					});
				});
				
				$('div.smenu7-3-cont form#modifyTchrForm').on('submit', function(event){
					event.preventDefault();
					var nxt = false;
					if($('div.smenu7-3-cont input[name="tchrname"]').trim().val()==''){
						nxt = true;
					}
					
					if(nxt == false){
						$.post('modifytchr_result.hb', $('div.smenu7-3-cont form#modifyTchrForm').serialize(), function(d){
							var modifytchrresult = d.result;
							if(modifytchrresult == 1){
								$('div.smenu7-3-cont span#modifyTchrStatus').text('수정 성공했습니다');
							}else{
								$('div.smenu7-3-cont span#modifyTchrStatus').text('수정 실패했습니다');
							}
						});
					}else{
						return;
					}
				});
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu7-4-cont">
				<div id="title-left">강사 삭제</div>
				<div id="title-right"></div>
				<span id="delTchrStatus"></span>
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
					
					<button type="submit">확인</button>
					<button type="reset">취소</button>
				</form>
			</div>
			<script type="text/javascript">
				$('.menuP li>a.smenu7-4').on('click',function(){
					$('div.smenu7-4-cont span#delTchrStatus').empty();				
					var tmp='';
					$.get('tchrinfoshow.hb',function(d){
						for(var i=0; i<d.tchrList.length;i++){
							tmp = '<option value="'+d.tchrList[i].unum+'">'
								+ d.tchrList[i].uname
								+ '</option>';
							$('div.smenu7-4-cont form>select#tchrList').append(tmp);	
						}
					});
				});

				$('div.smenu7-4-cont form#tchrList').on('sumbit',function(event){
					event.preventDefault();
					if(confirm('정말로 삭제하시겠습니까?') == true){
						$.post('deltchr_result.hb',$('div.smenu7-4-cont form#tchrList').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('div.smenu7-4-cont span#delTchrStatus').text('강사 삭제 성공했습니다');				
							}else{
								$('div.smenu7-4-cont span#delTchrStatus').text('강사 삭제 실패했습니다');				
							}
						});
					}else{
						return;
					}
				});
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu8-cont">
				<div id="title-left">기타 직원 목록</div>
				<div id="title-right"></div>
				<table id="stfList">
					<tr>
						<td>이름</td>
						<th>소속</th>
						<th>이메일</th>
						<th>전화</th>
					<tr>
				</table>
			</div>
			<script type="text/javascript">
				$('.menuP li>a.smenu8').on('click',function(){
					var tmp='';
					var utype='';
					var utypeName='';
					$.get('stf_result.hb',{'signal':8},function(d){
						for(var i=0; i<d.stfList_ulist.length;i++){
							utype = d.stfList_ulist[i].utype;
							
							if(utype==2){
								utypeName='강사팀';
							}else if(utype==3){
								utypeName='영업팀';
							}else if(utype==4){
								utypeName='취업지원팀';
							}else if(utype==5){
								utypeName='행정팀';
							}else if(utype==6){
								utypeName='운영자';
							}								
							
							tmp = '<tr>'
								+ '<td>'+d.stfList_ulist[i].uname+'</td>'
								+ '<td>'+utypeName+'</td>'
								+ '<td>'+d.stfList_ulist[i].uemail+'</td>'
								+ '<td>'+d.stfList_ulist[i].uphone+'</td>'
								+ '</tr>';
							$('div.smenu8-cont table#stfList').append(tmp);	
						}
					});
				});
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu8-1-cont">
				<div id="title-left">기타 직원 추가</div>
				<div id="title-right"></div>
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
						<button type="reset">뒤로</button>
					</div>
				</form>
			</div>
			<script type="text/javascript">
				var nxt=false;
				
				//중복 검사
				$('.smenu8-1-cont form #id').on("keyup",function(){
					//alert('키보드 입력');
					var value=$('.smenu8-1-cont form #id').val();
					if(value.trim()!=''){
						//alert(value);
						$.get('idchk.hb',{'id':value},function(d){
							if(d.result){
								nxt=true;
								$('span#stfaddstatus').empty();
								$('.smenu8-1-cont form #idchk').text('사용 불가: 중복된 아이디').css('color', 'red');
								$('.smenu8-1-cont form #id').removeClass('chkyes');
								$('.smenu8-1-cont form #id').addClass('chkno');
							}else{
								nxt=false;
								$('span#stfaddstatus').empty();
								$('.smenu8-1-cont form #idchk').text('사용가능한 아이디').css('color', 'green');
								$('.smenu8-1-cont form #id').removeClass('chkno');
								$('.smenu8-1-cont form #id').addClass('chkyes');
							}
						});
					}
				}).blur(function(){
					if(nxt==false){
					$('.smenu8-cont form #idchk').empty();
					}
				});	

				//공란 검사, 값 전송
				$('.smenu8-1-cont form').on('submit', function(event){
					event.preventDefault();
					//공란 검사
					$('.smenu8-1-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu8-1-cont form select').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					if(nxt==false){
						//값 전송	
						$.post('addstaff_result.hb',$(this).serialize(),function(d){
							if(d.result){
								$('span#stfaddstatus').text('추가 성공했습니다.');
								$('.smenu8-1-cont form input').val('');
							}else{
								$('span#stfaddstatus').text('추가 실패했습니다.');
								$('.smenu8-1-cont form input').val('');
							}
						});
					}else{
						return;
					}	
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu8-2-cont">
				<div id="changeStf">
					<div id="title-left">기타 직원 수정</div>
					<div id="title-right"></div>
					<span id="modifyStfStatus"></span>
					<form action="modifystf_result.hb" id="modifyEtcStfForm" method="post">
						<label for="modifyTchr">수정할 기타 직원</label>
						<select name="modifyTchr" id="modStfList">
						</select>
						<label for="utype">소속</label>
						<select name="utype">
							<option value="3">영업팀</option>
							<option value="4">취업지원팀</option>
							<option value="5">행정팀</option>
							<option value="6">운영자</option>
						</select>
						
						<label type="newName" >수정할 이름</label>
						<input type="text" name="newName" id="newNameInput"/>
						<p>
							<button type="submit">확인</button>
							<button type="reset">취소</button>
						</p>
					</form>
					<!--update staff set utype= where unum=? -->
					<!--update hanb_user set utype= where unum=? -->
				</div>
				<div id="upToStf">
					<h>강의 미참가 강사를 다른 직원으로 수정</h>
					<span id="upToStfStatus"></span>
					<form action="uptostf_result.hb" id="upToStfForm" method="post">
						<label for="selNoclsTchr">선택</label>
						<select name="selNoclsTchr" id="selNoclsTchr">
						</select>
						<p>
							<button type="submit">확인</button>
							<button type="reset">취소</button>
						</p>
					</form>
				</div>
			</div>
			<script type="text/javascript">
				/* utype=기타직원.utype;
				$(option).val(utype).hide(); */
				
				$('.menuP li>a.smenu8-2').on('click',function(){
					$('div.smenu8-2-cont span#delStfStatus').empty();				
					var tmp='';
					$.get('stf_result.hb',{'signal':82},function(d){
						//기타 직원 목록
						for(var i=0; i<d.stfList_ulist.length;i++){
							tmp = '<option value="'+d.stfList_ulist[i].unum+'">'
								+ d.stfList[i].uname
								+ '</option>';
							$('div.smenu8-2-cont #changeStf form select#modStfList').append(tmp);	
						}

						//미강의 강사 목록
						for(var i=0; i<d.noclsTchrs_ulist.length;i++){
							tmp = '<option value="'+d.noclsTchrs_ulist[i].unum+'">'
								+ d.noclsTchrs_ulist[i].uids+': '+d.noclsTchrs_ulist[i].uname
								+ '</option>';
							$('div.smenu8-2-cont #upToStf form select#selNoclsTchr').append(tmp);	
						}
					});
				});
				
				//기타 직원 수정
					$('div.smenu8-2-cont #changeStf form#modifyEtcStfForm').on('sumbit',function(event){
						event.preventDefault();
						$.post('modifystu_result.hb',$('div.smenu8-2-cont #changeStf form#modifyEtcStfForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('div.smenu8-2-cont #changeStf span#modifyStfStatus').text('기타 직원 수정 성공했습니다');				
							}else{
								$('div.smenu8-2-cont #changeStf #modifyStfStatus').text('기타 직원 수정 실패했습니다');				
							}
						});			
						
						//새로고침
						$.get('stf_result.hb',{'signal':82},function(d){
							//기타 직원 목록
							for(var i=0; i<d.stfList_ulist.length;i++){
								tmp = '<option value="'+d.stfList_ulist[i].unum+'">'
									+ d.stfList[i].uname
									+ '</option>';
								$('div.smenu8-2-cont #changeStf form select#modStfList').append(tmp);	
							}
						});
					});
					
					//선택 즉시 내용 반영
					$('div.smenu8-2-cont #changeStf select#modStfList>option:selected').each(function(){
						var unum = $(this).val();
						if(unum.trim()!=''){
							$.get('stfinfoshow.hb',{'unum':unum},function(d){
								$('div.smenu8-2-cont #changeStf input#newNameInput').val(d.stfinfo.uname);
							});
						}
					}); 
					$('div.smenu8-2-cont #changeStf select#modStfList').change(function(){
						$('div.smenu8-2-cont select#modStfList>option:selected').each(function(){
							var unum = $(this).val();
							if(unum.trim()!=''){
								$.get('stfinfoshow.hb',{'unum':unum},function(d){
									$('div.smenu8-2-cont #changeStf input#newNameInput').val(d.stfinfo.uname);
								});
							}
						});
					});
				
				//강사 신분 전환
					$('div.smenu8-2-cont #upToStf form#upToStfForm').on('sumbit',function(event){
						event.preventDefault();
						$.post('uptostf_result.hb',$('div.smenu8-2-cont #upToStf form#upToStfForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('div.smenu8-2-cont #upToStf span#upToStfStatus').text('신분 전환 성공했습니다');				
							}else{
								$('div.smenu8-2-cont #upToStf span#upToStfStatus').text('신분 전환 실패했습니다');				
							}
						});		
						
						//새로고침
						$.get('stf_result.hb',{'signal':82},function(d){
							for(var i=0; i<d.noclsTchrs_ulist.length;i++){
								tmp = '<option value="'+d.noclsTchrs_ulist[i].unum+'">'
									+ d.noclsTchrs_ulist[i].uids+': '+d.noclsTchrs_ulist[i].uname
									+ '</option>';
								$('div.smenu8-2-cont #upToStf form select#selNoclsTchr').append(tmp);	
							}
						});
					});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu8-3-cont">
				<div id="title-left">기타 직원 삭제</div>
				<div id="title-right"></div>
				<span id="delStfStatus"></span>
				<form action="delstf_result.hb" method="post" id="delStfForm>
					<label for="stfList">삭제할 기타 직원</label>
					<select name="delStf" id="delStfList">
						<!-- <option value="">teacher.uname</option> -->
					</select>
					<input type="radio" name="notStaff" value="1" checked="checked" />
					<!-- 일반 회원으로 전환
					delete from teacher where uids=" -->
					<!-- update hanb_user set utype=1 where uids=""-->
					<input type="radio" name="notStaff" value="0" /><!-- 삭제 및 회원탈퇴 -->
					<!-- delete from teacher where uids=""-->
					<!-- delete from hanb_user where uids=""-->
					<p>
					<button type="submit">확인</button>
					<button type="reset">취소</button>
					</p>
				</form>
			</div>
			<script>
				$('.menuP li>a.smenu8-3').on('click',function(){
					$('div.smenu8-3-cont span#delStfStatus').empty();				
					var tmp='';
					$.get('stfinfoshow.hb',function(d){
						for(var i=0; i<d.stfList.length;i++){
							tmp = '<option value="'+d.stfList[i].unum+'">'
								+ d.stfList[i].uname
								+ '</option>';
							$('div.smenu8-3-cont form select#delStfList').append(tmp);	
						}
					});
				});

				$('div.smenu8-3-cont form#delStfForm').on('sumbit',function(event){
					event.preventDefault();
					if(confirm('정말로 삭제하시겠습니까?') == true){
						$.post('delstf_result.hb',$('div.smenu8-3-cont form#delStfForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('div.smenu8-3-cont span#delStfStatus').text('기타 직원 삭제 성공했습니다');				
							}else{
								$('div.smenu8-3-cont span#delStfStatus').text('기타 직원 삭제 실패했습니다');				
							}
						});
					}else{
						return;
					}				
					
				});
				
				$('div.smenu8-3-cont form#delStfForm').on('reset',function(event){
					$('div.smenu8-3-cont form#delStfForm').val('');
				});
			</script>
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu9-cont">
			  	<div id="title-left">강의 목록</div>
				<div id="title-right"></div>
			    <table>
					<tr>
						<td>교육번호</td>
						<td>교육이름</td>
						<td>교육과목1</td>
						<td>교육과목2</td>
						<td>교육과목3</td>
						<td>교육시작일</td>
						<td>교육종료일</td>
						<td>총 교육일 수 </td>
						<td>담당강사</td>
						<td>신청인원</td>
					</tr>
			    </table>	
			</div>
			<script>
				$('.menuP li>a.smenu9').on("click", function(){
					$('.smenu9-cont tr:first').nextAll().remove();
					$.get('stf_result.hb',{'signal':9},function(d){
						var tmp='';
						
						for(i=0; i < d.clsList_elist.length; i++){
							tmp = '<tr id="tclick'+i+'">'
								+ '<td>'+d.clsList_elist[i].enum2+'</td>'
								+ '<td>'+d.clsList_elist[i].ename+'</td>'
								+ '<td>'+d.clsList_elist[i].esub1+'</td>'
								+ '<td>'+d.clsList_elist[i].esub2+'</td>'
								+ '<td>'+d.clsList_elist[i].esub3+'</td>'
								+ '<td>'+d.clsList_elist[i].startdate+'</td>'
								+ '<td>'+d.clsList_elist[i].enddate+'</td>'
								+ '<td>'+d.clsList_elist[i].etotalday+'</td>'
								+ '<td>'+d.clsList_elist[i].uname+'</td>'
								+ '<td>'+d.clsList_elist[i].stnum+'</td>'
								+ '</tr>';
							
							$('.smenu9-cont table').append(tmp);
						}
						$('.smenu9-cont tr').css('cursor','hand');
					});
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu9-1-cont">	
				<div id="title-left">강의 개설</div>
				<div id="title-right"></div>
				<span id="caddstatus"></span>
				<!---- 	<!-- ArrayList<HanbUserDto> newClsForm_ulist = (ArrayList)request.getAttribute("newClsForm_ulist"); --> ---->
				<form action="newcls_result.hb" method="post">
					<div>
						<label for="ename">교육이름: </label>
						<input type="text" value=" " name="ename" id="ename" />
						<span id="enamechk"></span>
					</div>
					<div>
						<label for="esub1">교육과목1: </label>
						<input type="text" value=" " name="esub1" id="esub1" />
					</div>
					<div> 
						<label for="esub2">교육과목2: </label>
						<input type="text" value=" " name="esub2" id="esub2" />
					</div>
					<div>
						<label for="esub3">교육과목3: </label>
						<input type="text" value=" " name="esub3" id="esub3" />
					</div>
					<div>
						<label for="startdate">교육시작일: </label>
						<input type="date" name="startdate" value="2017-01-01" id="startdate" />
					</div>
					<div>
						<label for="enddate">교육종료일: </label>
						<input type="date" name="enddate" value="2017-01-30" id="enddate" />
					</div>
					<div>
						<label for="etotalday">총 교육일 수: </label>
						<input type="number" value="0" name="etotalday" id="etotalday" min="0"/>
					</div>
					<div>
						<label for="unum">담당강사: </label>
						<select name="unum" id="unum">
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
					$('.smenu9-1-cont select#unum option').remove();
					$.get('stf_result.hb',{'signal':91},function(d){
						var date,idx,uids,title;
						var tmp='';
						
						for(i=0; i < d.newClsForm_ulist.length; i++){
							tmp = '<option id="tclick'+i+'" value="'+d.newClsForm_ulist[i].unum+'">'
								+ d.newClsForm_ulist[i].uname
								+ '</option>';
							
							$('.smenu9-1-cont select#unum').append(tmp);
						}
						$('.smenu9-1-cont tr').css('cursor','hand');
					});
				});
            	
				var nxt=false;
				
				//중복 검사
				$('.smenu9-1-cont form #ename').on("keyup",function(){
					//alert('키보드 입력');
					var value=$('.smenu9-1-cont form #ename').val();
					if(value.trim()!=''){
						//alert(value);
						$.get('checkename.hb',{'ename':value},function(d){
							if(d.result){
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
							
						});
					}
				}).blur(function(){
					if(nxt==false){
						$('.smenu9-1-cont form #idchk').empty();
					}
				});	
				
				//공란 검사, 값 전송
				$('.smenu9-1-cont form').on('submit', function(event){
					event.preventDefault();
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
						$.post('newcls_result.hb',$('.smenu9-1-cont form').serialize(),function(d){
							if(d.result){
								$('span#caddstatus').text('추가 성공했습니다.');
								$('.smenu9-1-cont form input').val('');
							}else{
								$('span#caddstatus').text('추가 실패했습니다.');
								$('.smenu9-1-cont form input').val('');
							}
						});
					}else{
						return;
					}	
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu9-2-cont">
				<div id="title-left">강의 수정</div>
				<div id="title-right"></div>
				<span id="modifyClsStatus"></span>
				<form action="modify_cls.hb" method="post">
				
					<label for="modifyCls">수정할 강의</label>
					<select name="modifyCls" id="modifyCls">
					</select>
					
					<label for="tmpEname">교육이름</label>
					<select name="tmpEname" id="">
						<!-- <option value="enum">ename</option> -->
					</select>

					<label for="ename" >교육이름: </label>
					<input type="text" value=" " name="ename" id="ename" />
					<span id="enamechk"></span>
					
					<label for="esub1">교육과목1: </label>
					<input type="text" value=" "> name="esub1" id="esub1" />

					<label for="esub2" >교육과목2: </label>
					<input type="text" value=" " name="esub2" id="esub2" />

					<label for="esub3" >교육과목3: </label>
					<input type="text" value=" " name="esub3" id="esub3" />

					<label for="startdate" >교육시작일: </label>
					<input type="date" name="startdate" value="2017-01-01" id="starthate" />

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
			<script type="text/javascript">
				//목록 표시
            	$('.menuP li>a.smenu9-2').on("click", function(){
					$('.smenu9-2-cont select#modifyCls option').remove();
					$('.smenu9-2-cont select#tchr option').remove();
					$.get('stf_result.hb',{'signal':92},function(d){
						var date,idx,uids,title;
						var tmp='';
						
						//강의목록
						for(i=0; i < d.clsList_elist.length; i++){
							tmp = '<option id="tclick'+i+'" value="'+d.clsList_elist[i].enum2+'">'
								+ d.clsList_elist[i].ename
								+ '</option>';
							
							$('.smenu9-2-cont select#modifyCls').append(tmp);
						}
						//강사목록
						for(i=0; i < d.tchrList_tlist.length; i++){
							tmp = '<option id="tclick'+i+'" value="'+d.tchrList_tlist[i].unum+'">'
								+ d.tchrList_tlist[i].uname
								+ '</option>';
							
							$('.smenu9-2-cont select#tchr').append(tmp);
						}

						$('.smenu9-2-cont tr').css('cursor','hand');
					});

						
				});

	
            	
				var nxt=false;
				
				//중복 검사
				$('.smenu9-2-cont form #ename').on("keyup",function(){
					//alert('키보드 입력');
					var value=$('.smenu9-2-cont form #ename').val();
					if(value.trim()!=''){
						//alert(value);
						$.get('checkename.hb',{'ename':value},function(d){
							if(d.result){
								nxt=true;
								$('span#caddstatus').empty();
								$('.smenu9-2-cont form #enamechk').text('사용 불가: 중복된 교육명').css('color', 'red');
								$('.smenu9-2-cont form #ename').removeClass('chkyes');
								$('.smenu9-2-cont form #ename').addClass('chkno');
							}else{
								nxt=false;
								$('span#caddstatus').empty();
								$('.smenu9-2-cont form #enamechk').text('사용가능한 교육명').css('color', 'green');
								$('.smenu9-2-cont form #ename').removeClass('chkno');
								$('.smenu9-2-cont form #ename').addClass('chkyes');
							}
							
						});
					}
				}).blur(function(){
					if(nxt==false){
					$('.smenu9-2-cont form #idchk').empty();
					}
				});	
				
				//공란 검사, 값 전송
				$('.smenu9-2-cont form').on('submit', function(event){
					event.preventDefault();
					//공란 검사
					$('.smenu9-2-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu9-2-cont form select').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					if(nxt==false){
						//값 전송	
						$.post('modifycls_result.hb',$('.smenu9-2-cont form').serialize(),function(d){
							if(d.result){
								$('span#modifyClsStatus').text('추가 성공했습니다.');
								$('.smenu9-2-cont form input').val('');
							}else{
								$('span#modifyClsStatus').text('추가 실패했습니다.');
								$('.smenu9-2-cont form input').val('');
							}
						});
					}else{
						return;
					}	
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu9-3-cont">
				<span id="delClsStatus"></span>
				<div id="title-left">강의 삭제</div>
				<div id="title-right"></div>
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
			<script type="text/javascript">
				 $('div.menuP li>a.smenu9-3').on('click', function() {
				 	$('div.smenu9-3-cont select#clsList>option').remove();
				 	$.get('stf_result.hb',{'signal':93}, function(d) {
						var tmp='';
						for (var i = 0; i < d.clsList_elist.length; i++) {
							tmp = '<option value="'+d.clsList_elist[i].enum2+'">'
								+ d.clsList_elist[i].ename
								+ '</option>';

							$('div.smenu9-3-cont select#clsList').append(tmp);
						}
				 	});
				 });
				 
				//확인 창, 값 전송
				$('.smenu9-3-cont form').on('submit', function(event){
					event.preventDefault();
					if(confirm('정말로 삭제하시겠습니까?') == true){ //확인
						//값 전송	
						$.post('delcls_result.hb', $('div.smenu9-3-cont form').serialize(), function(d) {
							var result = d.result;
							if(result){
								$('.smenu9-3-cont span#delClsStatus').text('삭제 성공했습니다.');
								$('.smenu9-3-cont form input').val('');
							}else{
								$('.smenu9-3-cont span#delClsStatus').text('삭제 실패했습니다.');
								$('.smenu9-3-cont form input').val('');
							}
						});
					}else{ //취소
						return;
					}	
				});
				 
			</script>
			
			<!--//TODO 행정팀: 게시판관리-->
			<div class="content col-7 mcol-9 smenu10-cont">
				<div id="title-left">게시판 관리</div>
				<div id="title-right"></div>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">건의사항</a></li>
					<li><a href="#">취업상담게시판</a></li>
					<li><a href="#">채용게시판</a></li>
				</ul>
			</div>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu11-cont">
				<div id="title-left">출석 승인</div>
				<div id="title-right"></div>
				<span id="chkAtndStatus"></span>
				<table>
					<tr>
						<td>수강생 아이디</td>
						<td>수강생 이름</td>	
						<td>일자</td>	
						<td>출석 시간</td>
						<td>퇴실 시간</td>
						<td>출결 상태</td>
						<td>강사 승인 여부</td>			
					</tr>
				</table>
				
				<!-- <div>
						<input type="date" name="atdate" id="atdate" value="2017-01-01" />
						<span id="idchk"></span> 
					</div> -->
					<!-- <div>
						<label for="stTime">입실시간: </label>
						<input type="time" name="stTime" id="stTime" value="09:00" />
					</div> -->
					<!-- <div>
						<label for="edTime">퇴실시간: </label>
						<input type="time" name="edTime" id="edTime" value="18:00" />
					</div> -->
				
				<form id="chkAtndForm" method="post">
					<div>
						<label for="oneStu">수강생 선택</label>
						<select name="oneStu" id="oneStu">
						</select>
					</div>
					<select name="atStatus">
						<option value="0">결석</option>
						<option value="1">정상</option>
						<option value="2">지각</option>
						<option value="3">조퇴</option>
					</select>
					<div>
						<button type="submit">강사승인</button>
						<button type="reset">뒤로</button>
					</div>
				</form>	
			</div>
			<script type="text/javascript">
				$('.menuT li>a.smenu11').on("click", function(){
					$('.smenu11-cont tr:first').nextAll().remove();
					$.get('stf_result.hb',{'signal':11},function(d){
						var tmp='';
						
						for(i=0; i < d.chkAtndForm_ulist.length; i++){
							tmp = '<tr id="tclick'+i+'">'
									+ '<td>'+d.chkAtndForm_ulist[i].uids+'</td>'
									+ '<td>'+d.chkAtndForm_ulist[i].uname+'</td>'
									+ '<td>'+d.chkAtndForm_ulist[i].atdate+'</td>'
									+ '<td>'+d.chkAtndForm_ulist[i].st_time+'</td>'
									+ '<td>'+d.chkAtndForm_ulist[i].ed_time+'</td>'
									+ '<td>'+d.chkAtndForm_ulist[i].state+'</td>'
									+ '<td>'+d.chkAtndForm_ulist[i].tcheck+'</td>'
								+ '</tr>';
							
							$('.smenu11-cont table').append(tmp);
						}
						$('.smenu11-cont tr').css('cursor','hand');
						for(i=0; i < d.chkAtndForm_ulist.length; i++){
							tmp = '<option id="tclick'+i+'" value="'+d.chkAtndForm_ulist[i].unum+'">'
								+ d.chkAtndForm_ulist[i].uids+': '+d.chkAtndForm_ulist[i].uname
								+ '</option>';
							
							$('.smenu11-cont select#oneStu').append(tmp);
						}
					});
				});
				$('div.smenu11-cont form#chkAtndForm button[type="submit"]').on('click',function(){
					var nxt=false;
					$('.smenu11-cont form select').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});	
					if(nxt==false){
						$.post('chkatnd_result.hb', $('div.smenu11-cont form#chkAtndForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('div.smenu11-cont span#chkAtndStatus').text('출석 승인 성공');
							}else{
								$('div.smenu11-cont span#chkAtndStatus').text('출석 승인 실패');
							}
						});
					/* 	//현재 주소를 가져온다.
						var renewURL = location.href;
						//현재 주소 중 page 부분이 있다면 날려버린다.
						renewURL = renewURL.replace(/\&page=([0-9]+)/ig,'');
						//새로 부여될 페이지 번호를 할당한다.
						// page는 ajax에서 넘기는 page 번호를 변수로 할당해주거나 할당된 변수로 변경
						renewURL += '&page='+page;
						//페이지 갱신 실행!
						history.pushState(null, null, url); */
					}else{
						return;
					}
					
				});
			</script>
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu12-cont">
				<div id="title-left">시험 평가</div>
				<div id="title-right"></div>
				<span id="EvalExamStatus"></span>
				<form action="chkexam_result.hb" method="post">
					<label for="stuList">학생선택:</label>
					<select name="stud" class="stuList">
					</select>
					<div>
						<h3>과목1</h3>
						<label for="sub1" id="sub1label"></label>
						<input type="text" name="sub1" id="sub1">
					</div>
					<div>
						<h3>과목2</h3>
						<label for="sub2" id="sub2label"></label>
						<input type="text" name="sub2" id="sub2">
					</div>
					<div>
						<h3>과목3</h3>
						<label for="sub3" id="sub3label"></label>
						<input type="text" name="sub3" id="sub3">
					</div>
					<div>
						<button type="submit">시험 점수 갱신</button>
						<button type="reset">뒤로</button>
					</div>
				</form>
			</div>
			<script type="text/javascript">
				$('.menuT li>a.smenu12').on("click", function(){
					$('div.smenu12-cont .stuList>option').remove();
					$.get('stf_result.hb',{'signal':12},function(d){
						var tmp='';
						
						for(i=0; i < d.chkExamForm_ulist.length; i++){
							tmp = '<option id="tclick'+i+'" value="'+d.chkExamForm_ulist[i].unum+'">'
								+ d.chkExamForm_ulist[i].uname
								+ '</option>';
							
							$('div.smenu12-cont select.stuList').append(tmp);
						}								
				    });

				});
				
				$('.stuList>option:selected').each(function(){
					var value = $(this).val();
					if(value.trim()!=''){
						//alert(value);

						$.get('subshow.hb',$.param({'unum':value}),function(d){
							var esub1 = d.subject.esub1;
							var esub2 = d.subject.esub2;
							var esub3 = d.subject.esub3;
							console.log("sub1: "+esub1+" / sub2: "+esub2+" / sub3: "+esub3);
							$('#sub1label').text(esub1);
							$('#sub2label').text(esub2);
							$('#sub3label').text(esub3);
						});
					}
				});
				$('.stuList').change(function(){
					$('.stuList>option:selected').each(function(){
						var value = $(this).val();
						if(value.trim()!=''){
							alert(value);

							$.get('subshow.hb',$.param({'unum':value}),function(d){
								var esub1 = d.subject.esub1;
								var esub2 = d.subject.esub2;
								var esub3 = d.subject.esub3;
								console.log("sub1: "+esub1+" / sub2: "+esub2+" / sub3: "+esub3);
								$('#sub1label').text(esub1);
								$('#sub2label').text(esub2);
								$('#sub3label').text(esub3);
							});
						};
					});
				});
				
				$('.smenu12-cont form').on('submit', function(event){
					event.preventDefault();
					//공란 검사
					$('.smenu12-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu12-cont form select').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					if(nxt==false){
						//값 전송	
						$.post('chkexam_result.hb',$('.smenu12-cont form').serialize(),function(d){
							if(d.result){
								$('span#EvalExamStatus').text('추가 성공했습니다.');
								$('.smenu12-cont form input').val('');
							}else{
								$('span#EvalExamStatus').text('추가 실패했습니다.');
								$('.smenu12-cont form input').val('');
							}
						});
					}else{
						return;
					}	
				});
			</script>
			
			<div class="content col-7 mcol-9 smenu12-1-cont">
				<div class="showList">
					<div id="title-left">과제게시판</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>과제등록번호</th>
							<th>과제제목</th>
							<th>작성자</th> 
							<th>과제확인여부</th>
						</tr>
					</table>
				
					<div class="listLink">
					</div>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					</div>
				<div class="showWrite">
					<div id="title-left">과제게시판 쓰기</div>
					<div id="title-right"></div>
					<div class="wrtHmwk">
						<span id="wrtHmwkStatus"></span>
						<form id="wrtHmwkForm" action="newhomework_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="uname">과제 제출자</label>
								<input type="text" name="uname" id="uname" placeholder=""/>
								<label for="hsub">과제 제목</label>
								<input type="text" name="hsub" id="hsub" placeholder=""/>
							</div>
							<div>
								<label for="cont">과제 내용</label>
								<textarea name="cont" id="cont" cols="30" rows="10"></textarea>
							</div>
						</form>
							<p>파일 첨부</p>
							<p id="warn"></p>
						<form id="upHmwkFile" action="" method="post" enctype="multipart/form-date">
							<p>
								<label for="ufile1">파일 1</label>
								<input type="file" name="ufile1" id="ufile1">
							</p>
							<span id="status">df</span>
						</form>			
							<button type="addUfile">첨부파일 추가</button>
						<div>
							<button type="submit">전송</button>
							<button type="list">목록</button>
							<button type="reset">초기화</button>
						</div>

					</div>
				</div>	
			</div>
			<%
				Integer hrs = (Integer) session.getAttribute("hrs");
				// 웹서버 컨테이너 경로
			    String SvName = request.getServerName();
			    String SvPort = Integer.toString(request.getServerPort());
			    String savePath = "http://"+SvName+":"+SvPort+pathStf + "/upload/";
			%>
			<script type="text/javascript">
				var row=0;
				var hrs =<%=hrs%>;
				if (hrs == null) {
					hrs = 0;
				} else if (hrs > 0) {
					alert("등록 완료 하였습니다.");
					hrs = 0;
				}
				var cnt = 2;
				
				$('.smenu12-1-cont div.showWrite button[type="addUfile"]').on('click',function(){
					if(cnt<6){
						$('.smenu12-1-cont div.showWrite form#upHmwkFile').append('<p><label for="ufile'+cnt+'">파일 '+cnt+'<input type="file" name="ufile'+cnt+'" id="ufile'+cnt+'"></p>');
						cnt++;
					}else{
						$('.smenu12-1-cont div.showWrite p#warn').text('파일은 5개를 초과해서 전송할 수 없습니다');
					}
				});

				$('.smenu12-1-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu12-1-cont div.showList').hide();
					$('.smenu12-1-cont div.showWrite').show();
				});	
				
				$('.smenu12-1-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu12-1-cont div.showWrite').hide();
					$('.smenu12-1-cont div.showList').show();
				});	
			
				$('.smenu12-1-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu12-1-cont div.showWrite form input)').val('');
				});	
			
				//목록 생성
				$('.menuT li>a.smenu12-1').on('click',function(){
					var cnt = 2;
					function movepage(a){
						$('.smenu12-1-cont table tr').each(function(idx){
							var last = a * 20;
							var first = last - 19;
							if ((idx > 0) && (first <= idx) && (last >= idx)) {
				                $(this).show();
				            } else if (idx == 0) {
				
				            } else {
				                $(this).hide();
				            }
				            $('.smenu12-1-cont tr.trCntnt').hide();
						});
					}	
					
					$('div.smenu12-1-cont div.showWrite form#upHmwkFile>p:first').nextAll().remove();
					
					$('div.smenu12-1-cont div.showWrite').hide();
					$('div.smenu12-1-cont div.showList').show();
					$('div.smenu12-1-cont table  tr:not(:first)').remove();
					
					$.get('read_homework.hb',function(d){
						var tmp='';
						var pagelink ='';	
						row = d.rows;
						
						for(var i=1; i < d.pages; i++){
							pagelink += "<a href='#link' onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
						
							$('div.smenu12-1-cont div.listLink').html(pagelink);
						}
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr>'
									+ '<td class="hnum">'+d.homework[j].hnum+'</td>'
									+ '<td>'+d.homework[j].hsub+'</td>'
									+ '<td>'+d.homework[j].uname+'</td>'
									+ '<td>'+d.homework[j].hcheck+'</td>'
								+ '</tr>'
								+ '<tr class="trCntnt">'	
									+ '<td colspan="4">'
										+d.homework[j].hcont
							///////////////////////////////////////////////////////					
							
								<% for(int i=0;i<hlist.size();i++){ 
									String sendchk = "알 수 없음.";
									String file1 = "";
									String file2 = "";
									String file3 = "";
									String file4 = "";
									String file5 = "";
									HomeworkDto hbean = hlist.get(i);
	
									for(int j = 0; j<5 ; j++){
										file1 = new String (hbean.getHadd1().getBytes ("UTF-8"), "8859_1");
										file2 = new String (hbean.getHadd1().getBytes ("UTF-8"), "8859_1");
										file3 = new String (hbean.getHadd1().getBytes ("UTF-8"), "8859_1");
										file4 = new String (hbean.getHadd1().getBytes ("UTF-8"), "8859_1");
										file5 = new String (hbean.getHadd1().getBytes ("UTF-8"), "8859_1");
									}
									
									if(hbean.getHcheck()==1){
										sendchk = "제출 완료 (확인 전.)";
									}
									if(hbean.getHcheck()==2){
										sendchk = "강사 확인 완료.";
									}
	
									if( hbean.getHadd1() != null){ %>
										+'<div class="add">첨부파일 1 :' 
										+'<a href="<%=savePath%><%=file1%>" download class="adds"><%=hbean.getHadd1()%></a></div>'
									<%} if( hbean.getHadd2() != null){ %>
										+'<div class="add">첨부파일 2 :' 
										+'<a href="<%=savePath%><%=file2%>" download class="adds"><%=hbean.getHadd2()%></a></div>'
									<%} if( hbean.getHadd3() != null){ %>
										+'<div class="add">첨부파일 3 :' 
										+'<a href="<%=savePath%><%=file3%>" download class="adds"><%=hbean.getHadd3()%></a></div>'
									<%} if( hbean.getHadd4() != null){ %>
										+'<div class="add">첨부파일 4 :' 
										+'<a href="<%=savePath%><%=file4%>" download class="adds"><%=hbean.getHadd4()%></a></div>'
									<%} if( hbean.getHadd5() != null){ %>
										+'<div class="add">첨부파일 5 :' 
										+'<a href="<%=savePath%><%=file5%>" download class="adds"><%=hbean.getHadd5()%></a></div>'
									<%}%>
				      			<%}%>		
				      			///////////////////////////////////////////				
										+'<button type="checkH">과제 확인</button>'
									+'</td>'
								+ '</tr>';
						
							$('div.smenu12-1-cont table').append(tmp);
						}

						$('.smenu12-1-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});
			
						var seenum = 20;
						$('.smenu12-1-cont table tr').each(function(idx){
							if (idx > seenum) {
								$(this).hide();
							}
						});
			
						//내용 가리고 보이기
						$('div.smenu12-1-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu12-1-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							movepage(m);
							console.log($(this).attr('onclick'));
						});	
			
						//$('.smenu12-1-cont .jbNtcList tr').css('cursor','hand');
					});
				});
				
					
				//초기화
				/*$('.smenu12-1-cont form button').on('reset',function(){
					$('div.smenu12-1-cont form input:not(#id)').val('');
					$('div.smenu12-1-cont span#wrtHmwkStatus').empty();
				});*/
				for(var i=0; i<row; i++){
					$('.smenu12-1-cont table button[type="checkH"]').eq(i).on('click',function(event) {
						$.post('check_homework.hb',{"hnum": $('div.smenu12-1-cont table td.hnum').eq(i).val() },function(d){
							var result = d.result;
							if(result>0){
								alert('체크 작업 성공');
								$('.menuT li>a.smenu12-1').trigger('click');
							}else{
								alert('체크 작업 실패');
							}
						});
					});
				}	

				//전송
				$('.smenu12-1-cont div.showWrite button[type="submit"]').on('click',function(event){
					event.preventDefault();
					var nxt=false;
					$('div.smenu12-1-cont span#wrtHmwkStatus').empty();
				
					//공란 검사
					$('.smenu12-1-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu12-1-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					if(nxt=false){

						/* function(){ 
							var form = $('div.smenu12-1-cont form#upHmwkFile'); 
							var formData = new FormData(form); 
							$.ajax({ 
								url: '/fileupload', 
								processData: false, 
								contentType: false, 
								data: formData, 
								type: 'POST', 
								success: function(result){
								 alert("업로드 성공!!"); 
								}
							});	 
						} */

						$.post('newhomework_result.hb', $('.smenu12-1-cont form#wrtHmwkForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('.smenu12-1-cont span#wrtHmwkStatus').text('작성 완료');
								$('.smenu12-1-cont div.showWrite').hide();
								$('.smenu12-1-cont div.showList').show();
							}else{
								$('.smenu12-1-cont span#wrtHmwkStatus').text('작성 실패');	
							}
						});
					}else{
						return;
					}
				});
			</script>
			</div>
			<script>

			</script>
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu13-cont">
				<div class="showList">
					<div id="title-left">직원 개인 정보</div>
					<div id="title-right"></div>
					<div>
						<ul>
						</ul>	
					</div>
					<button type="modifySelf">개인정보 변경</button>
					
				</div>
				<div class="showWrite">
					<div id="title-left">개인정보 변경</div>
					<div id="title-right"></div>
					<span id="modifySelfStatus"></span>
					<form action="modifySelfForm" method="post">
						<label for="uids">아이디</label>
						<input type="text" name="uids" id="uids">
						<label for="upw">비밀번호</label>
						<input type="text" name="upw" id="upw">
						<label for="uemail">이메일</label>
						<input type="text" name="uemail" id="uemail">
						<label for="uphone">전화번호</label>
						<input type="text" name="uphone" id="uphone">
					</form>
					<button type="list">목록</button>
					<button type="reset">초기화</button>
				</div>
			</div>
			<script>
				//샘플
				/* $('.menuC li>a.smenu13').on("click", function(){
					$('content div.smenu13-cont ul').remove();
					$.get({
						'url': 'stf_result.hb',
						'method': 'get',
						'dataType': 'json',
						'contentType':'application/json; charset=UTF-8',
						'error': function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    },
						'success': function(d){
							var tmp='';
						
							var utype = d.info_udto.utype;
							
							if(utype==0){
								utype ='미승인 회원';
							}
							if(utype==1){
								utype ='수강생';
							}
							if(utype==2){
								utype ='강사팀';
							}
							if(utype==3){
								utype ='영업팀';
							}
							if(utype==4){
								utype ='취업지원팀';
							}
							if(utype==5){
								utype ='행정팀';
							}
							if(utype==6){
								utype ='관리자';
							}
							
							tmp = '<li> 아이디: '+d.info_udto.uids+'</li>'
								+ '<li> 이름: '+d.info_udto.uname+'</li>'
								+ '<li> 이메일: '+d.info_udto.uemail+'</li>'
								+ '<li> 전화번호: '+d.info_udto.uphone+'</li>'
								+ '<li> 타입: '+utype+'</li>';
							
							$('div.smenu13-cont ul').append(tmp);
							$('.smenu13-cont ul>li').css('cursor','hand');
						}
					});
					});  */
				$('.menuC li>a.smenu13').click(function(){
					$('.smenu13-cont div.showList').show();
					$('.smenu13-cont div.showWrite').hide();
				});	


				if($('.menuC li>a.smenu13').hasClass('active')){
					$('content div.smenu13-cont>div>ul').remove();
					$('.smenu13-cont div.showList').show();
					$('.smenu13-cont div.showWrite').hide();
					$.get('stf_result.hb',{'signal':13},function(d){
						var tmp='';
						var utype = d.info_udto.utype;
						
						if(utype==0){
							utype ='미승인 회원';
						}
						if(utype==1){
							utype ='수강생';
						}
						if(utype==2){
							utype ='강사팀';
						}
						if(utype==3){
							utype ='영업팀';
						}
						if(utype==4){
							utype ='취업지원팀';
						}
						if(utype==5){
							utype ='행정팀';
						}
						if(utype==6){
							utype ='관리자';
						}
						
						tmp = '<li> 아이디: '+d.info_udto.uids+'</li>'
							+ '<li> 이름: '+d.info_udto.uname+'</li>'
							+ '<li> 이메일: '+d.info_udto.uemail+'</li>'
							+ '<li> 전화번호: '+d.info_udto.uphone+'</li>'
							+ '<li> 타입: '+utype+'</li>';
						
						$('div.smenu13-cont ul').append(tmp);
						$('.smenu13-cont ul>li').css('cursor','hand');
					});
				}

				$('s')

				$('.smenu13-cont div.showList button[type="modifySelf"]').on('click',function(event){
					event.preventDefault();
					$('.smenu13-cont div.showList').hide();
					$('.smenu13-cont div.showWrite').show();
				});	
				
				$('.smenu13-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu13-cont div.showWrite').hide();
					$('.smenu13-cont div.showList').show();
				});	
			
				$('.smenu13-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu13-cont div.showWrite form input)').val('');
				});	

				$('.smenu13-cont div.showWrite form#modifySelfForm').on('submit', function(event) {
					event.preventDefault();
					var nxt = false;
					if($('.smenu13-cont div.showWrite form input').val()==''){
						nxt = true;
					}; 

					if(confirm('정말 바꾸시겠습니까?')==true){
						if(nxt == false){
							$.post('modifyself_result.hb',$('.smenu13-cont div.showWrite form#modifySelfForm').serialize(), function(d){
								var result = d.result;
								if(result>0){
									$('.smenu13-cont div.showWrite span#modifySelfStatus').text('개인정보 수정 성공');
									$('.smenu13-cont div.showWrite form input)').val('');
								}else{
									$('.smenu13-cont div.showWrite span#modifySelfStatus').text('개인정보 수정 실패');
								}
							});
						}else{
							return;
						}		
					}else{
						return;
					}
							
				});


			</script>
		
			<!--//TODO 공통:건의사항-->
			<div class="content col-7 mcol-9 smenu14-cont">
				<div class="showList">
					<div id="title-left">건의사항</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>날짜</th>
							<th>글쓴이</th>
							<th>제목</th>
						</tr>
					</table>
				
					<div class="listLink">
					</div>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					<a id="scroll" href="scroll"></a>
				</div>
				<div class="showWrite">
					<div id="title-left">건의 사항</div>
					<div id="title-right"></div>
					<div class="suggest">
						<span id="suggestStatus"></span>
						<form id="suggestForm" action="newsuggest_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <!--=session.getAttribute("uids")--> </p>
								
								<!-- <label for="pw">비밀번호</label>
								<input type="text" id="pw" name="pw"/> -->
								
								<label for="title">제목</label>
								<input type="text" id="title" name="title"/>
							</div>
							<div>
								<p><label for="sgsttext">내용</label></p>
								<textarea name="sgsttext" id="sgsttext" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
						</form>
					</div>
				</div>
				
			</div>
			<script type="text/javascript">
				$('.smenu14-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu14-cont div.showList').hide();
					$('.smenu14-cont div.showWrite').show();
				});	
				
				$('.smenu14-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu14-cont div.showWrite').hide();
					$('.smenu14-cont div.showList').show();
				});	
				
				$('.smenu14-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu14-cont div.showWrite form input:not(input[type="hidden"])').val('');
					$()
				});	

				//목록 생성 
				///////////////////
				
				$('.menuC li>a.smenu14').on('click',function(){
					function movepage(a) {
				        $(".smenu14-cont tr").each(function(idx) {
				            var last = a * 20;
				            var first = last - 19;
				            if (( idx > 0 ) && ( first <= idx ) && ( last >= idx )) {
				                $(this).show();
				            } else if (idx == 0) {
				        
				        	}else {
				                $(this).hide();
				            }
				            $('.smenu14-cont tr.trCntnt').hide();
				        })
					}
					
					$('.smenu14-cont .showWrite').hide();
					$('.smenu14-cont div.showList').show();
					$('.smenu14-cont table tr:not(:first)').remove();
					
					$.get('read_suggestlist.hb',function(d){
						var tmp='';
						var pagelink ='';	
						for(var i=0; i <d.pages; i++){
							/* if(i>0){
								$('div.smenu14-cont ul.jbNtclistUl').before('<table class="boardPage'+i+'">');
							}else{
								$('div.smenu14-cont ul.jbNtclistUl').before('<table class="boardPage'+i+'">');
							} */
							
							// <a href='#link' onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
							
							pagelink += "<a href='#' value="+(i+1)+" onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
							$('div.smenu14-cont div.listLink').html(pagelink);
							
							//$('div.smenu14-cont table#jbNtcList').eq(i).append(title);
							
							/*							 n_num        NUMBER            NOT NULL, 
							    n_sub        VARCHAR2(90)      DEFAULT '제목없음', 
							    uname        VARCHAR2(15)      NOT NULL, 
							    n_date       DATE              DEFAULT sysdate, 
							    n_cnt        NUMBER            DEFAULT 0, 
							    n_content    VARCHAR2(1024)    DEFAULT '내용없음', 
							    CONSTRAINT NOTICE_PK PRIMARY KEY (n_num)
							*/
						}
						
						for(var j = 0; j < d.rows; j++){
									
								tmp += '<tr class="trSub">'
										+ '<td>'+d.sgstList_blist[j].regdate+'</td>'
										+ '<td>'+d.sgstList_blist[j].uids+'</td>'
										+ '<td>'+d.sgstList_blist[j].title+'</td>'
										+ '</tr>'
										+ '<tr class="trCntnt">'	
											+ '<td colspan="3">'+d.sgstList_blist[j].cntnt+'</td>'
										+ '</tr>';
						}
							
						//$('div.smenu14-cont').append('<ul>');
						
						$('.smenu14-cont table').append(tmp);
						
						//$('div.smenu14-cont table.jbNtcList').append(tmp);
						//$('.smenu14-cont table tr').css('cursor','hand');
						$('.smenu14-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});


						$(".smenu14-cont tr").each(function(idx) {
						var seenum = 20;
					        if (idx > seenum) {
					            $(this).hide();
					        }
					    }); 
						
						//내용 가리고 보이기
						$('div.smenu14-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu14-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	
					});
				});	
				

				//초기화
				$('.menuC li>a.smenu14').on('click',function(){
					$('div.smenu14-cont span#suggestStatus').empty();
				});
				
				//전송
				$('.menuC li>a.smenu14').on('submit',function(event){
					event.preventDefault();
					$('div.smenu14-cont span#suggestStatus').empty();
					
					$.post($('form#suggestForm').attr('action'), $('form#suggestForm').serialize(), function(d){
						var result = d.result;
						if(result>0){
							$('div.smenu14-cont span#suggestStatus').text('건의사항 전송 완료');
						}else{
							$('div.smenu14-cont span#suggestStatus').text('건의사항 전송 실패');	
						}
					});
				});
			</script>
			
			<!--//TODO 공통:공지사항-->
			<div class="content col-7 mcol-9 smenu15-cont">
				
				<div class="showList">
					<div id="title-left">공지 사항</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>번호</th> 
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<!-- <th>조회수</th>  -->
						</tr>
					</table>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					<a id="scroll" href="scroll"></a>

				</div>
				
				<div class="showWrite">
					<div id="title-left">공지 사항 글쓰기</div>
					<div id="title-right"></div>
					<div class="wrtNtc">
						<span id="wrtNtcStatus"></span>
						<form id="wrtNtcForm" action="newntc_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="unum">글쓴이</label>
								<input type="text" name="unum" id="unum"/>
								<label for="sub">제목</label>
								<input type="text" name="sub" id="sub"/>
							</div>
							<div>
								<p><label for="cont">내용</label></p>
								<textarea name="cont" id="cont" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
							
							<!-- n_num        NUMBER            NOT NULL, 
						    n_sub        VARCHAR2(90)      DEFAULT '제목없음', 
						    uname        VARCHAR2(15)      NOT NULL, 
						    n_date       DATE              DEFAULT sysdate, 
						    n_cnt        NUMBER            DEFAULT 0, 
						    n_content    VARCHAR2(1024)    DEFAULT '내용없음', 
						    -->
							
						</form>
					</div>
				</div>	
			</div>
			<script>

				$('.smenu15-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu15-cont div.showList').hide();
					$('.smenu15-cont div.showWrite').show();
				});	
				
				$('.smenu15-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu15-cont div.showWrite').hide();
					$('.smenu15-cont div.showList').show();
				});	
				$('.smenu15-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu15-cont div.showWrite form input)').val('');
				});	
				/* //div class="noticeDetail">
				div>
					<ul>
						<li>글쓴이: <span id="noticeAuthor"></span></li>
						<li>제목: <span id="noticeTitle"></span></li>
					</ul>
				/div>
				div>
					<textarea name="noticeCntnt" id="noticeCntnt" rows="10" cols="30"></textarea>
				/div>
				*/			
			
				//목록 생성
				$('.menuC li>a.smenu15').on('click',function(){
					function movepage(a){
						$('.smenu15-cont table tr').each(function(idx){
							var last = a * 20;
							var first = last - 19;
							if ((idx > 0) && (first <= idx) && (last >= idx)) {
				                $(this).show();
				            } else if (idx == 0) {
				
				            } else {
				                $(this).hide();
				            }
						});
					}

					$('.smenu15-cont div.showWrite').hide();
					$('.smenu15-cont div.showList').show();
					$('.smenu15-cont div.showList table  tr:not(:first)').remove();
					
					$.get('read_noticelist.hb',{'signal':15},function(d){
						var tmp='';
						var pagelink ='';	
						
						for(var i=1; i < d.pages; i++){
							pagelink += "<a href='#link' onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
						
							$('div.smenu15-cont div.listLink').html(pagelink);
						}	
						
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr class="trSub">'
									+ '<td>'+d.noticeBoard[j].n_num+'</td>'
									+ '<td>'+d.noticeBoard[j].n_sub+'</td>'
									+ '<td>'+d.noticeBoard[j].unum+'</td>'
									+ '<td>'+d.noticeBoard[j].n_date+'</td>'
								+ '</tr>'
								+ '<tr class="trCntnt">'	
									+ '<td colspan="4">'+d.noticeBoard[j].n_content+'</td>'
								+ '</tr>';
							
							$('div.smenu15-cont table').append(tmp);
						}
						var seenum = 20;
						$('.smenu15-cont table tr').each(function(idx){
							if (idx > seenum) {
								$(this).hide();
							}
						})
						
						$('.smenu15-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});

						//내용 가리고 보이기
						$('div.smenu15-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu15-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	

						$('.smenu15-cont table tr').css('cursor','hand');
					});
				});
				
			
				
				////////////////////////////////////
	
				/*//초기화
				$('.smenu15-cont form').on('reset',function(){
					$('div.smenu15-cont form input:not(#id)').val('');
					$('div.smenu15-cont span#wrtNtcStatus').empty();
				});*/
				
				//전송
				$('.smenu15-cont form').on('submit',function(event){
					var nxt=false;
					event.preventDefault();
					$('div.smenu15-cont span#wrtNtcStatus').empty();
				
					//공란 검사
					$('.smenu15-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu15-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					if(nxt=false){
						$.post($('.smenu15-cont form#wrtNtcForm').attr('action'), $('.smenu15-cont form#wrtNtcForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('.smenu15-cont span#wrtNtcStatus').text('작성 완료');
								$('.smenu15-cont div.showWrite').hide();
								$('.smenu15-cont div.showList').show();
							}else{
								$('.smenu15-cont span#wrtNtcStatus').text('작성 실패');	
							}
						});
					}else{
						return;
					}
				});

				/* $('div.smenu15-cont div.listLink>a').on('click', function(event){
					event.preventDefault();
				}); */
				
				/*$('.smenu15-cont .noticeList tr').click(function()
					var idx = $(this).text();
					alert(idx);*/
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
								
								tmp = '<tr class="tclick'+i+'">'
									+ '<td>'+date+'</td>'
									+ '<td>'+idx+'</td>'
									+ '<td>'+uids+'</td>'
									+ '<td>'+title+'</td>'
									+ '</tr>';
								
								$('.smenu15-cont .noticeList table').append(tmp);
							}
						}
					}); */
				//});
				//{"noticeList":[{idx:"", uids:"" },{idx:"", uids:""},{idx:"", udis:""}]}
				// noticeList = [{idx:"", uids:"" },{idx:"", uids:""},{idx:"", udis:""}] 
				
			</script>
			
			
			<!--//TODO -->
			<div class="content col-7 mcol-9 smenu16-cont">
				<div class="showList">
					<div id="title-left">자유게시판</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>날짜</th>
							<th>글번호</th> 
							<th>글쓴이</th>
							<th>제목</th>
						</tr>
					</table>
				
					<div class="listLink">
					</div>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					<a id="scroll" href="scroll"></a>
				</div>
				<div class="showWrite">
					<div id="title-left">자유게시판글쓰기</div>
					<div id="title-right"></div>
					<div class="wrtFree">
						<span id="wrtFreeStatus"></span>
						<form id="wrtFreeForm" action="newfree_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="uids">글쓴이</label>
								<input type="text" name="uids" id="uids"/>
								<label for="title">제목</label>
								<input type="text" name="title" id="title"/>
							</div>
							<div>
								<p><label for="cont">채용내용</label></p>
								<textarea name="cont" id="cont" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
						</form>
					</div>
				</div>	
			</div>
			<script type="text/javascript">
				$('.smenu16-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-cont div.showList').hide();
					$('.smenu16-cont div.showWrite').show();
				});	
				
				$('.smenu16-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-cont div.showWrite').hide();
					$('.smenu16-cont div.showList').show();
				});	

				$('.smenu16-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-cont div.showWrite form input)').val('');
				});	

				//목록 생성
				$('.menuC li>a.smenu16').on('click',function(){
					function movepage(a){
						$('.smenu16-cont table tr').each(function(idx){
							var last = a * 20;
							var first = last - 19;
							if ((idx > 0) && (first <= idx) && (last >= idx)) {
				                $(this).show();
				            } else if (idx == 0) {
				
				            } else {
				                $(this).hide();
				            }
				            $('.smenu16-cont tr.trCntnt').hide();
						});
					}	

					$('div.smenu16-cont div.showWrite').hide();
					$('.smenu16-cont div.showList').show();
					$('div.smenu16-cont table  tr:not(:first)').remove();
					$.get('read_freelist.hb',{'signal':16},function(d){
						var tmp='';
						var pagelink ='';	
						
						for(var i = 1; i < d.pages; i++){
							pagelink += "<a href='#link' onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
						
							$('div.smenu16-cont div.listLink').html(pagelink);
						}
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr>'
									+ '<td>'+d.freeboard[j].fdate+'</td>'
									+ '<td>'+d.freeboard[j].num+'</td>'
									+ '<td>'+d.freeboard[j].uname+'</td>'
									+ '<td>'+d.freeboard[j].sub+'</td>'
								+ '</tr>'
								+ '<tr class="trCntnt">'	
									+ '<td colspan="4">'+d.freeboard[j].content+'</td>'
								+ '</tr>';
							
							$('div.smenu16-cont table').append(tmp);
						}
						
						$('.smenu16-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});

						var seenum = 20;
						$('.smenu16-cont table tr').each(function(idx){
							if (idx > seenum) {
								$(this).hide();
							}
						});

						//내용 가리고 보이기
						$('div.smenu16-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu16-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	
			
						$('.smenu16-cont .jbNtcList tr').css('cursor','hand');
					});
				});
				
				/*//초기화
				$('.smenu16-cont form').on('click',function(){
					$('div.smenu16-cont form input:not(#id)').val('');
					$('div.smenu16-cont span#wrtFreeStatus').empty();
				});*/
				
				//전송
				$('.smenu16-cont form#wrtFreeForm button[type="submit"]').on('click',function(event){
					console.log('test');
					var nxt=false;
					event.preventDefault();
					$('div.smenu16-cont span#wrtFreeStatus').empty();
				
					/* //공란 검사
					$('.smenu16-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					$('.smenu16-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					}); */
					
					/* if(nxt=false){ */
						$.post($('.smenu16-cont form#wrtFreeForm').attr('action'), $('.smenu16-cont form#wrtFreeForm').serialize(), function(d){
							console.log(d.result);
							var result = d.result;
							if(result>0){
								$('.smenu16-cont span#wrtFreeStatus').text('작성 완료');
								$('.smenu16-cont div.showWrite').hide();
								$('.smenu16-cont div.showList').show();
							}else{
								$('.smenu16-cont span#wrtFreeStatus').text('작성 실패');	
							}
						});
					/* }else{
						return;
					} */
				});
			</script>
			
			<div class="content col-7 mcol-9 smenu16-1-cont">
				<div class="showList">
					<div id="title-left">교육후기 게시판</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>후기 번호</th>
							<th>후기 제목</th> 
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</table>
				
					<div class="listLink">
					</div>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					<a id="scroll" href="scroll"></a>
				</div>
				<div class="showWrite">
					<div id="title-left">교육후기 글쓰기</div>
					<div id="title-right"></div>
					<div class="wEpil">
						<span id="wEpilStatus"></span>
						<form id="wEpilForm" action="newepil_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="uname">글쓴이</label>
								<input type="text" name="uname" id="uname"/>
								<label for="title">제목</label>
								<input type="text" name="title" id="title"/>
							</div>
							<div>
								<p><label for="cont">내용</label></p>
								<textarea name="cont" id="cont" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
						</form>
					</div>
				</div>	
				
			</div>		
			<script type="text/javascript">
				$('.smenu16-1-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-1-cont div.showList').hide();
					$('.smenu16-1-cont div.showWrite').show();
				});	
				
				$('.smenu16-1-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-1-cont div.showWrite').hide();
					$('.smenu16-1-cont div.showList').show();
				});	

				$('.smenu16-1-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-1-cont div.showWrite form input)').val('');
				});	
				//목록 생성
				$('.menuC li>a.smenu16-1').on('click',function(){
					function movepage(a){
						$('.smenu16-1-cont table tr').each(function(idx){
							var last = a * 20;
							var first = last - 19;
							if ((idx > 0) && (first <= idx) && (last >= idx)) {
				                $(this).show();
				            } else if (idx == 0) {
				
				            } else {
				                $(this).hide();
				            }
				            $('.smenu16-1-cont tr.trCntnt').hide();
						});
					}

					$('div.smenu16-1-cont div.showWrite').hide();
					$('.smenu16-1-cont div.showList').show();
					$('div.smenu16-1-cont table  tr:not(:first)').remove();
					$.get('read_epiloguelist.hb',{'signal':16-1},function(d){
						var tmp='';
						var pagelink ='';	
						
						for(var i = 1; i < d.pages; i++){
							pagelink += "<a href='#link' onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
						
							$('div.smenu16-1-cont div.listLink').html(pagelink);
						}
						
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr>'
									+ '<td>'+d.epiloguelist[j].ep_num+'</td>'
									+ '<td>'+d.epiloguelist[j].ep_sub+'</td>'
									+ '<td>'+d.epiloguelist[j].uname+'</td>'
									+ '<td>'+d.epiloguelist[j].ep_date+'</td>'
								+ '</tr>'
								+ '<tr class="trCntnt">'	
									+ '<td colspan="4">'+d.epiloguelist[j].ep_cont+'</td>'	
								+ '</tr>';
							
							$('div.smenu16-1-cont table').append(tmp);
						}
						
						$('.smenu16-1-cont tr.trCntnt').each(function (idx) {
							$(this).hide();
						});

						$('.smenu16-1-cont table tr').each(function(idx){
						var seenum = 20;
							if (idx > seenum) {
								$(this).hide();
							}
						});
						

						$('div.smenu16-1-cont table tr:not(tr.trCntnt)').on('click',function(){
							$(this).next().toggle(); 
						});
						
						$('div.smenu16-1-cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	

					});
				});
				
					

				//초기화
				/*$('.smenu16-1-cont form').on('click',function(){
					$('div.smenu16-1-cont form input:not(#id)').val('');
					$('div.smenu16-1-cont span#suggestStatus').empty();
				});*/
				
				//전송
				$('.smenu16-1-cont form').on('submit',function(event){
					var nxt=false;
					event.preventDefault();
					$('div.smenu16-1-cont span#suggestStatus').empty();
				
					//공란 검사
					$('.smenu16-1-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					$('.smenu16-1-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					if(nxt=false){
						$.post($('.smenu16-1-cont form#wEpilForm').attr('action'), $('.smenu16-1-cont form#wEpilForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('.smenu16-1-cont span#wEpilStatus').text('작성 완료');
								$('.smenu16-1-cont div.showWrite').hide();
								$('.smenu16-1-cont div.showList').show();
							}else{
								$('.smenu16-1-cont span#wEpilStatus').text('작성 실패');	
							}
						});
					}else{
						return;
					}
				});
					
			</script>					
			
			<div class="content col-7 mcol-9 smenu16-2-cont">
				<div class="showList">
					<div id="title-left">취업현황</div>
					<div id="title-right"></div>
					<table>
						<tr id="headrow">
							<th>현황 게시물 번호</th>
							<th>유저 이름</th> 
							<th>교육 과정명</th>
							<th>취업 업체명</th>
							<th>취업 분야</th>
						</tr>
					</table>
				
					<div class="listLink">
					</div>
					<p>
						<button type="callWrite">쓰기</button>			
					</p>
					<a id="scroll" href="scroll"></a>

				</div>

				<div class="showWrite">
					<div id="title-left">취업현황 글쓰기</div>
					<div id="title-right"></div>
					<div class="wJbState">
						<span id="wJbStateStatus"></span>
						<form id="wJbStateForm" action="newjbstate_result.hb" method="post">
							<div class="input_form">
								<p id="id"> id: <%=session.getAttribute("uids")%> </p>
								<label for="uname">유저이름</label>
								<input type="text" name="uname" id="uname"/>
								<label for="jsub">교육 과정명</label>
								<input type="text" name="jsub" id="jsub"/>
								<label for="jcompany">취업 업체명</label>
								<input type="text" name="jcompany" id="jcompany"/>
								<label for="jfield">취업 분야</label>
								<input type="text" name="jfield" id="jfield"/>
							</div>
							<div>
								<p><label for="cont">내용</label></p>
								<textarea name="cont" id="cont" cols="30" rows="10"></textarea>
							</div>
							<div>
								<button type="submit">전송</button>
								<button type="list">목록</button>
								<button type="reset">초기화</button>
							</div>
						</form>
					</div>
				</div>	
				

			</div>
			<script type="text/javascript">
				$('.smenu16-2-cont div.showList button[type="callWrite"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-2-cont div.showList').hide();
					$('.smenu16-2-cont div.showWrite').show();
				});	
				
				$('.smenu16-2-cont div.showWrite button[type="list"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-2-cont div.showWrite').hide();
					$('.smenu16-2-cont div.showList').show();
				});	

				$('.smenu16-2-cont div.showWrite button[type="reset"]').on('click',function(event){
					event.preventDefault();
					$('.smenu16-2-cont div.showWrite form input)').val('');
				});	

				//목록 생성
				$('.menuC li>a.smenu16-2').on('click',function(){
					function movepage(a){
						$('.smenu16-2-cont table tr').each(function(idx){
							var last = a * 20;
							var first = last - 19;
							if ((idx > 0) && (first <= idx) && (last >= idx)) {
				                $(this).show();
				            } else if (idx == 0) {
				
				            } else {
				                $(this).hide();
				            }
						});
					}
					

					$('div.smenu16-2-cont div.showWrite').hide();
					$('.smenu16-2-cont div.showList').show();
					$('div.smenu16-2-cont table tr:not(:first)').remove();

					$.get('read_jobstatelist.hb',{'signal':16-2},function(d){
						var tmp='';
						var pagelink ='';	
						
						for(var i = 1; i < d.pages; i++){
							pagelink += "<a href='#link' onclick='movepage(" + (i+1) + ")'>" + (i+1) + "</a>";
						}
						$('div.smenu16-2-cont div.listLink').html(pagelink);
				
						for(var j = 0; j < d.rows; j++){
							tmp = '<tr>'
									+ '<td>'+d.jobstate[j].jnum+'</td>'
									+ '<td>'+d.jobstate[j].uname+'</td>'
									+ '<td>'+d.jobstate[j].jsub+'</td>'
									+ '<td>'+d.jobstate[j].jcompany+'</td>'
									+ '<td>'+d.jobstate[j].jfield+'</td>'
								+ '</tr>';

							$('div.smenu16-2-cont table').append(tmp);
						}
						var seenum = 20;
						$('.smenu16-2-cont table tr').each(function(idx){
							if (idx > seenum) {
								$(this).hide();
							}
						});
						
						$('div.smenu16-2cont div.listLink>a').on('click', function(event){
							event.preventDefault();
							var m=$(this).attr('value');
							//alert(m);
							movepage(m);
							console.log($(this).attr('onclick'));
						});	

						$('.smenu16-2-cont .showList tr').css('cursor','hand');
					});
				});
				
				/*//초기화
				$('.smenu16-2-cont form').on('click',function(){
					$('div.smenu16-2-cont form input:not(#id)').val('');
					$('div.smenu16-2-cont span#wJbStateStatus').empty();
				});*/
				
				//전송
				$('.smenu16-2-cont form').on('submit',function(event){
					var nxt=false;
					event.preventDefault();
					$('div.smenu16-2-cont span#JbStateStatus').empty();
				
					//공란 검사
					$('.smenu16-2-cont form input').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					$('.smenu16-2-cont form textarea').each(function(){
						if($(this).val()==''){
							nxt=true;
						}
					});
					
					if(nxt=false){
						$.post($('.smenu16-2-cont form#wJbStateForm').attr('action'), $('.smenu16-2-cont form#wJbStateForm').serialize(), function(d){
							var result = d.result;
							if(result>0){
								$('.smenu16-2-cont span#wJBStateStatus').text('작성 완료');
								$('.smenu16-2-cont div.showWrite').hide();
								$('.smenu16-2-cont div.showList').show();
							}else{
								$('.smenu16-2-cont span#wJBStateStatus').text('작성 실패');	
							}
						});
					}else{
						return;
					}
				});

			</script>		
		
			<!-- content end -->

		</div>
		
	</div>
		
	<!--TODO -->
		
</body>

</html>