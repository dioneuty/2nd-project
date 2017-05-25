<%@page import="java.util.Calendar"%>
<%@page import="com.hb.user.model.UserAttendDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hb.user.model.UserAttendDto"%>
<%@page import="java.util.Date"%>
<%@page import="com.hb.user.model.HanbUserDto"%>
<%@page import="com.hb.student.model.HomeworkDto"%>
<%@page import="com.hb.edu.model.EducationDto"%>
<%@page import="com.hb.student.model.StudentDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>한빛교육센터 홍대점</title>
<meta name="viewport" content="width = device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/mygrid.css">
<link rel="stylesheet" type="text/css" href="../css/contentsTitle.css">
<link href="../css/mygrid2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/paging.css"
	media="screen" />
	<link rel="stylesheet" href="../css/jquery-ui.css" />
<!-- content내의 submenu,subcontent 프레임  grid -->
<link href="../css/std_info.css" rel="stylesheet" type="text/css" />
<!-- subcontent 내부 내용 css -->
<link href="../css/cal.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
<meta charset="utf-8" />

<style type="text/css">
*{
	font-family: 'Nanum Gothic';
}
#status {
	display: inline-block;
	width: 320px;
	margin: 15px 15px 5% 5%;
	height: 200px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 10px;
}

#status>div:nth-child(1) {
	background-color: rgb(52, 78, 227);
	text-align: center;
	color: white;
	height: 40px;
	line-height: 40px;
}

#status>div:nth-child(2) {
	padding-left: 20px;
	margin: 0px;
	float: left;
}

#status>div:nth-child(2)>* {
	font-family: 'Nanum Gothic';
	font-size: 12px;
}

#buttons {
	padding: 0px;
	display: inline-block;
	width: 400px;
	height: 200px;
	margin: 15px auto;
	text-align: center;
}

#button1, #button2 {
	display: inline-block;
	width: 170px;
	height: 170px;
	margin: auto auto;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 10px;
	text-indent: -9999px;
}

.container2 #button1 {
	background-image: url("../imgs/start.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

.container2 #button2 {
	background-image: url("../imgs/mid.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

#atnd_status {
	width: 90%;
	height: 40px;
	margin: 15px auto;
	margin-bottom: 40px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 10px;
	text-align: center;
	font-size: 11px;
	line-height: 40px;
	background-color: rgb(52, 78, 227);
	color: white;
	border-radius: 7px;
}

#attend {
	width: 90%;
	margin: 15px auto;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 10px;
	text-align: center;
	font-size: 16px;
	line-height: 40px;
	border-radius: 7px;
	overflow: hidden;
}

#attend>div:nth-child(1) {
	background-color: rgb(52, 78, 227);
	text-align: center;
	color: white;
}

.container2 .aside img {
	width: 200px;
	padding: 10px auto;
	margin: 10px 0px;
}

.container2  .char1 {
	width: 100%;
	margin: 15px auto;
	border-top: solid 2px #011548;
	border-bottom: solid 2px #011548;
}

.container2  .char1>img {
	display:block;
	margin: 2px auto;
	text-align: center;
}
.container2  .char1>* {
	font-family: 'Nanum Gothic';
	text-align: center;
	margin : 0px;
}
.subject1 {
	width: 90%;
	border: 5px rgb(52, 78, 227) solid;
	border-radius: 7px;
	margin: 20px auto;
	height: 60px;
	line-height: 50px;
	padding-left: 20px;
	font-weight: bold;
	
}

.subject2 {
	width: 90%;
	border: 5px rgb(52, 78, 227) solid;
	border-radius: 7px;
	margin: 20px auto;
	padding-left: 20px;
}

.subjects {
	display:block;
	width: 90%;
	margin: 20px auto;
	height: 200px;
	
}

.subject3 {
	float: left;
	width: 25%;
	border: 10px rgb(52, 78, 227) solid;
	border-radius: 10px;
	margin: 0px 4%;
	height: 200px;
	box-sizing: border-box;
}

.subject3>div:nth-child(1) {
	background-color: rgb(52, 78, 227);
	font-family: 'Nanum Gothic';
	color: #ffffff;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 17px;
	box-sizing: border-box;
	font-weight: bold;
}

.subject3>div:nth-child(2) {
	border: rgba(52, 78, 227,0.3) 5px solid;
	font-family: 'Nanum Gothic';
	color: #414141;
	height: 145px;
	line-height: 145px;
	text-align: center;
	font-size: 40px;
	box-sizing: border-box;
}

.board {
	width: 90%;
	margin: 10px auto;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 10px;
	border-radius: 7px;
	overflow: hidden;
	border: solid 1px #ddd;
}

.board th {
	background-color: rgb(52, 78, 227);
	font-family: 'Nanum Gothic';
	color: white;
}

.board td {
	text-align: center;
	border-bottom: #ddd solid 1px;
}

#hwboard a {
	text-decoration: none;
	color: d9d9d9;
}

#hwboard td:nth-child(2) {
	text-align: left;
	width: 50%;
}

#hwboard tr:hover {
	background-color: #ddd;
}

#hwboard td:nth-child(3) {
	width: 20%;
}

#hwboard td:nth-child(4) {
	width: 20%;
}

#jboard td:nth-child(2) {
	text-align: left;
	width: 50%;
}

#jboard td:nth-child(3) {
	width: 20%;
}

#jboard td:nth-child(4) {
	width: 20%;
}

.hw_conts {
	display: none;
}

#hw_form {
	display: none;
}

.add {
	text-align: left;
}

#in2 {
	display: none;
}

#not_edit {
	margin: 0px auto;
	width: 80%;
	text-align: center
}

center>button {
	margin-left: 10px;
	color: white;
}

#not_edit>tbody>tr>td {
	border-radius: 5px;
}

#not_edit button {
	background-color: rgb(150, 200, 230);
	border: none;
	width: 15%;
	min-width: 120px;
	height: 30px;
	border-radius: 5px;
	margin-left: 10px;
}

input[alt=edit] {
	height: 30px;
	width: 100%;
	border: 1px solid rgb(234, 234, 234);
	border-radius: 5px;
}

textarea[alt=edit] {
	border-radius: 5px;
	width: 100%;
}

#not_edit td {
	border: none;
}

#paging * {
	font-size: 1em;
}

.attends{
	width: 100%;
}
.attends tr:nth-child(1){
	background-color: rgba(52,78,227,0.3);
}
.attends th:nth-child(1){
	width: 30%;
}
.attends th:nth-child(1){
	width: 20%;
}
.attends th:nth-child(1){
	width: 20%;
}
.attends th:nth-child(1){
	width: 30%;
}
.test{
	width: 90%;
	display:inline-block;
	margin-left:30px;
	border: 5px rgb(52, 78, 227) solid;
	border-radius: 7px;
	margin : 2px auto;
	padding-left:10px;
	float: left;
	display:none;
}
#qselect{
	display: inline-block;
	margin : 2px auto;
	margin-left:30px;
	height: 300px;
}
.qselects {
	display:block;
	width: 90%;
	margin: 20px auto;
	height: 200px;
	
}

.qselect3 {
	float: left;
	width: 25%;
	border: 10px rgb(52, 78, 227) solid;
	border-radius: 10px;
	margin: 0px 4%;
	height: 200px;
	box-sizing: border-box;
}

.qselect3>div:nth-child(1) {
	background-color: rgb(52, 78, 227);
	font-family: 'Nanum Gothic';
	color: #ffffff;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 17px;
	box-sizing: border-box;
	font-weight: bold;
}

.qselect3>div:nth-child(2) {
	border: rgba(52, 78, 227,0.3) 5px solid;
	font-family: 'Nanum Gothic';
	color: #414141;
	height: 145px;
	line-height: 145px;
	text-align: center;
	font-size: 20px;
	box-sizing: border-box;
	font-weight: bold:
}
.qselect3>div:nth-child(2):hover{
	background-color:#263238;
	color: white;
	cursor: pointer; 
}

#question{
	width: 60%;
	margin : 10px auto;
	float: left;
}
#answer{
	position:absolute;
	width: 20%;
	margin : 10px auto;
	float: left;
}
#answer2{
	position:absolute;
	width: 20%;
	margin : 10px auto;
	float: left;
}
#answer3{
	position:absolute;
	width: 20%;
	margin : 10px auto;
	float: left;
}
#answer1 td {
	background-color: white;
}
.hids{
	display: none;
}
#edtest1,#edtest2,#edtest3{
	border-radius:5px;
	padding: 5px 20%;
	background-color: white;
}
#edtest1:hover,#edtest2:hover,#edtest3:hover{
	background-color:#263238;
	color: white;
}
</style>


</head>
<%
	EducationDto edu = (EducationDto) request.getAttribute("edu");
	StudentDto list = (StudentDto) request.getAttribute("slist");
	ArrayList<HomeworkDto> hlist = (ArrayList<HomeworkDto>) request.getAttribute("hbean");
	HanbUserDto ubean = (HanbUserDto) session.getAttribute("ubean");
	Integer unum = (Integer) session.getAttribute("unum");
	UserAttendDao uadao = new UserAttendDao();
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat stFormat = new SimpleDateFormat("HH:mm");
	int states = uadao.selectState(unum); 
%>

<body>
	<%@ include file="../temple/menu.jspf"%>
	<script type="text/javascript">
		var res =
	<%=result%>
		;
		
		$(document)
				.ready(
						function() {
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
								if ($(this).hasClass('smenu7')) {
									$('.tab').removeClass('active');
									$(this).addClass('active');
									$('.content').hide();
									$('.smenu7-cont').show();
								}
							});

							if (res == null || res == true) {
								$('.containers').css("display", "none");
								$('#err').text(" ");
							} else {
								$('.containers').css("display", "block");
								$('#err').text("ID/비밀번호를 확인해 주세요.");
							}

						});
	</script>
	<!-- content -->
	<div class="container2">
		<div class="row">


			<!-- menu start -->

			<div class="aside col-2 mcol-0">
				<img src="../imgs/student.png" alt="a" />
				<div class="menu">
					<p>나의 정보</p>
					<ul>
						<li><a href="#" class="tab smenu1 active">출석 정보 <span>→</span></a></li>
						<li><a href="#" class="tab smenu2">성적 정보 <span>→</span></a></li>
					</ul>
				</div>
				<div class="menu">
					<p>수강/출결 관리</p>
					<ul>
						<li><a href="#cont4" class="tab smenu4">조퇴 / 휴가 <span>→</span></a></li>
					</ul>
				</div>
				
				<div class="menu">
					<p>과제 제출/시험</p>
					<ul>
						<li><a href="#" class="tab smenu6">과제 게시판 <span>→</span></a></li>
						<li><a href="#" class="tab smenu7">정기 시험 <span>→</span></a></li>
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

			<hr class="col-0" />
			<!-- content  -->

			<div class="content col-7 mcol-9 smenu1-cont">
				<div id="title-left">출석 정보</div>
				<div id="title-right"></div>
				<div id="status">
					<div>나의정보</div>
					<div class="sta1">
						<p>
							수강생 아이디 : <span><%=session.getAttribute("uname")%></span>
						</p>
						<p>
							수강생 이름 : <span><%=ubean.getUname()%></span>
						</p>
						<p>
							수강생 이메일 : <span><%=ubean.getUemail()%></span>
						</p>
						<p>
							수강생 전화번호 : <span><%=ubean.getUphone()%></span>
						</p>
						<p>
							수강중인 과정 : <span><%=edu.getEname()%></span>
						</p>
					</div>
				</div>
				<div id="buttons">
					<div id="button1">입실 / 퇴실</div>
					&nbsp;&nbsp;
					<div id="button2">조퇴</div>
				</div>
				<script type="text/javascript">
					var chk = 0;
					var current = <%= uadao.selectState(unum)%>
					var st_time = $(".attends tr:nth-child(2) td:nth-child(2)").text();
					$(document).ready(function (){
						
						
						if ( current != 0) {
							$('#button1').css('background-image','url("../imgs/end.png")');

						} else if (current == 0) {
							$('#button1').css('background-image','url("../imgs/start.png")');
						}
						
						
						$('#button1')
						.click(
								function() {
									if (current == 0) {
										alert("입실 되셨습니다.");
										$(this)
												.css(
														'background-image',
														'url("../imgs/end.png")');
										<%
											if(states == 0){
												int hour = cal.get(Calendar.HOUR_OF_DAY);
												int minute = cal.get(Calendar.MINUTE);
												String md = minute+"";
												String hh = hour+"";
												if(hour<10){
													hh = "0"+hh;
												}
												if(minute<10){
													md = "0"+md;
												}
												String st_times = hour+":"+md;
												uadao.updateStart(unum, st_times);
											}
										%>
									} else if (current == 1) {
										alert("퇴실 되셨습니다.");
										<%
										if(states > 0){
											int hours = cal.get(Calendar.HOUR_OF_DAY);
											int minutes = cal.get(Calendar.MINUTE);
											String m = minutes+"";
											String h = hours +"";
											if(hours<10){
												h = "0"+h;
											}
											if(minutes<10){
												m = "0"+m;
											}
											String ed_times = hours+":"+m;
											uadao.updateEnd(unum, ed_times);
										}
										%>
									}
								});
						
						$('#button2').click(function (){
							if(current != 3){
								alert("조퇴 승인 후 가능합니다.");
							}else{
								alert("조퇴 되었습니다.");
								<%
								if(states > 0){
									int hours = cal.get(Calendar.HOUR_OF_DAY);
									int minutes = cal.get(Calendar.MINUTE);
									String m = minutes+"";
									String h = hours +"";
									if(hours<10){
										h = "0"+h;
									}
									if(minutes<10){
										m = "0"+m;
									}
									String ed_times = hours+":"+m;
									uadao.updateEnd(unum, ed_times);
								}
								%>
							}
						});
					});
				</script>
				<div id="atnd_status">
					전체 수강일 : <span><%=list.getS_total()%></span>일 / 출석일 : <span><%=list.getS_append()%></span>일
					/ 결석일 : <span><%=list.getS_absent()%></span>일 / 지각&조퇴일 : <span><%=list.getS_early()%></span>일
				</div>
				<%
					ArrayList<UserAttendDto> ualist = (ArrayList<UserAttendDto>) request.getAttribute("ualist");
				%>
				<div id="attend">
					<div>출석정보</div>
					<div>
						<table class="attends" cellspacing=0>
							<tr>
								<th>날짜</th>
								<th>입실시간</th>
								<th>퇴실시간</th>
								<th>출결상태</th>
							</tr>
							<%for(int i=0;i<ualist.size();i++){ 
								UserAttendDto uabean = ualist.get(i);
								String state = "";
								if(uabean.getState()== 0){
									state = "결석";
								}
								if(uabean.getState()== 1){
									state = "입실완료";
								}
								if(uabean.getState()== 2){
									state = "지각";
								}
								if(uabean.getState()== 3){
									state = "조퇴";
								}
								if(uabean.getState()== 4){
									state = "출석완료";
								}
								String stimes = uabean.getSt_time();
								String etimes = uabean.getEd_time();
													
							%>
							<tr>
								<td><%=uabean.getAtdate() %></td>
								<td><%= stimes %></td>
								<td><%= etimes %></td>
								<td><%=state %></td>
							</tr>
							<%} %>
						</table>
					</div>
				</div>
				<div class="stu_foot"></div>
			</div>



			<div class="content col-7 mcol-9 smenu2-cont">
				<div id="title-left">성적 정보</div>
				<div id="title-right"></div>
				<div class="subject1">
					<%=session.getAttribute("uname")%>님의 성적 정보 입니다.
				</div>
				<div class="subject2">
					<div>
						<p>
							수강생 이름 : <span><%=session.getAttribute("uname")%></span>
						</p>
						<p>
							수강중인 과정 : <span><%=edu.getEname()%></span>
						</p>
						<p>
							수강중인 과목1 : <span><%=edu.getEsub1()%></span>
						</p>
						<p>
							수강중인 과목2 : <span><%=edu.getEsub2()%></span>
						</p>
						<p>
							수강중인 과목3 : <span><%=edu.getEsub3()%></span>
						</p>
					</div>
				</div>
				<div class="subjects">
					<div class="subject3">
						<div><%=edu.getEsub1()%></div>
						<div><%=list.getFir_sub()%></div>
					</div>
					<div class="subject3">
						<div><%=edu.getEsub2()%></div>
						<div><%=list.getSec_sub()%></div>
					</div>
					<div class="subject3">
						<div><%=edu.getEsub3()%></div>
						<div><%=list.getThr_sub()%></div>
					</div>
				</div>
			</div>
			<div class="content col-7 mcol-9 smenu4-cont">
				<div id="title-left">조퇴 / 휴가</div>
				<div id="title-right"></div>
				<%
					Date stdate = edu.getStartdate();
				%>
				<form>
					<select>
						<option>1월</option>
						<option>2월</option>
						<option>3월</option>
					</select>
				</form>
			</div>

			<%
				Integer hrs = (Integer) session.getAttribute("hrs");
				// 웹서버 컨테이너 경로
					    String root = "http://localhost:8080/zxy/";
					    String savePath = root + "upload/";
			%>
			<script type="text/javascript">
				var hrs =
			<%=hrs%>
				;
				if (hrs == null) {
					hrs = 0;
				} else if (hrs > 0) {
					alert("등록 완료 하였습니다.");
					hrs = 0;
				}
			</script>
			<div class="content col-7 mcol-9 smenu6-cont">
				<div id="title-left">과제 게시판</div>
				<div id="title-right"></div>
				<h4>
					과정명 : <span><%=edu.getEname()%></span>
				</h4>
				<table cellspacing="0" id="hwboard" class="board">
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>제출 확인 여부</th>
					</tr>
					<%
						for(int i=0;i<hlist.size();i++){ 
							String sendchk = "알 수 없음.";
							String file1 = "";
							String file2 = "";
							String file3 = "";
							String file4 = "";
							String file5 = "";
							HomeworkDto hbean = hlist.get(i);							
							if(hbean.getHcheck()==1){
								sendchk = "제출 완료 (확인 전.)";
							}
							if(hbean.getHcheck()==2){
								sendchk = "강사 확인 완료.";
							}
					%>

					<tr>
						<td><%=hbean.getHnum()%></td>
						<td><a href="#" class="hworks" id="<%=hbean.getHnum()%>"><%=hbean.getHsub()%></a></td>
						<td><%=hbean.getUname()%></td>
						<td><%=sendchk%></td>
					</tr>
					<tr class="hw_conts" id="hc_<%=hbean.getHnum()%>">
						<td colspan="4">
							<div><%=hbean.getHcont()%></div>
							<%if( hbean.getHadd1() != null){ %>
								<div class="add">첨부파일 1 : <a
								href='<%=savePath%><%=file1%>' download class="adds"><%=hbean.getHadd1()%></a></div>
							<% }%>
							<%if( hbean.getHadd2() != null){ %>
							<div class="add">첨부파일 2 : <a
							href='<%=savePath%><%=file2%>' download  class="adds"><%=hbean.getHadd2()%></a></div>
							<% }%>
							<%if( hbean.getHadd3() != null){ %>
							<div class="add">첨부파일 3 : <a
							href='<%=savePath%><%=file3%>' download  class="adds"><%=hbean.getHadd3()%></a></div>
							<% }%>
							<%if( hbean.getHadd4() != null){ %>
							<div class="add">첨부파일 4 : <a
							href='<%=savePath%><%=file1%>' download  class="adds"><%=hbean.getHadd4()%></a></div>
							<% }%>
							<%if( hbean.getHadd5() != null){ %>
							<div class="add">첨부파일 5 : <a
							href='<%=savePath%><%=file1%>' download class="adds"><%=hbean.getHadd5()%></a></div>
							<% }%>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<a href="#" class="hw_insert" id="in1">제출하기</a> <a href="#"
					class="hw_insert" id="in2">돌아가기</a>
				<div id="hw_form">
					<form action="uploadOK.hb" id="not_edit"
						enctype="multipart/form-data" method="post">

						<table id="not_edit">

							<tr>
								<td style="width: 10%; background-color: rgb(220, 220, 220);">제목</td>
								<td style="width: 40%;" colspan="3"><input type="text"
									alt="edit" name="h_sub"></td>

							</tr>


							<tr>
								<td colspan="4"><textarea name="h_cont" id="" cols="30"
										rows="10" alt="edit"></textarea></td>
							</tr>

							<tr>
								<td colspan="4">
								<div id="fileadd">
									<label for="file">첨부파일</label> <input type="file" name="file" id="file" />
									<button type="button">첨부추가</button>
								</div>
								</td>
							</tr>
						</table>

						<br />
						<center>

							<button type="submit">등록</button>
							<button type="reset">취소</button>
					</form>
					</center>
				</div>
				<script type="text/javascript">
					var fnum = 1;
					$(document)
							.ready(
									function() {
										$('#fileadd>button').click(function() {
															if (fnum > 4) {
																alert("첨부파일은 5개이상 업로드 하실 수 없습니다.");
															} else {
																fnum++;
																var btn = '<br/>첨부파일 '+ fnum + ' <input type="file" name="file'+fnum+'" id="file'+fnum+'" />';
																$('#fileadd').append(btn);
															}
														});
									});

					var view = 0;
					var view2 = 0
					$('.hw_insert').click(function(e) {
						e.preventDefault();
						if (view2 == 0) {
							$('#hwboard').css("display", "none");
							$('#hw_form').css("display", "block");
							$('#in1').css("display", "none");
							$('#in2').css("display", "block");
							view2 = 1;
						} else {
							$('#hw_form').css("display", "none");
							$('#hwboard').css("display", "table");
							$('#in2').css("display", "none");
							$('#in1').css("display", "block");
							view2 = 0;
						}
					});

					$('.hworks').click(function(e) {
						var tid = $(this).attr('id');
						var clk = '#hc_' + tid;
						e.preventDefault();
						if (view == 0) {
							$(clk).css("display", "table-row");
							view = 1;
						} else {
							$(clk).css("display", "none");
							view = 0;
						}
					});
				</script>
			</div>
			<div class="content col-7 mcol-9 smenu7-cont">
				<div id="title-left">정기시험</div>
				<div id="title-right"></div>
				
				<div class="test" id="qselect">
				<h2>응시하실 과목을 선택하세요</h2>
					<div class="qselects">
					<div class="qselect3" id="qsel1">
						<div><%=edu.getEsub1()%></div>
						<div>응시하기</div>
					</div>
					<div class="qselect3" id="qsel2"> 
						<div><%=edu.getEsub2()%></div>
						<div>응시하기</div>
					</div>
					<div class="qselect3" id="qsel3">
						<div><%=edu.getEsub3()%></div>
						<div>응시하기</div>
					</div>
				</div>
				</div>
				
				<form method="post" name="test1"></form>
				<form method="post" name="test2"></form>
				<form method="post" name="test3"></form>
				<div class="test" id="test1">
					<span><h1>Test (Java Programming)</h1></span>
					<form name="test1"></form>
					<div id="question">
					<b>1. 다음 중 아래 add메서드를 잘못 오버로딩 한 것은?<br/></b>
					<p style="border:solid 2px black; border-radius:7px; width: 300px; height:40px; line-height:40px; text-align:center;">long add(int a, int b) { return a+b;}</p>
					A. long add(int x, int y) { return x+y;} <br/>
					B. long add(long a, long b) { return a+b;} <br/>
					C. int add(byte a, byte b) { return a+b;} <br/>
					D. int add(long a, int b) { return (int)(a+b);} <br/>
					<br/>
					<b>2. 다음 중 초기화에 대한 설명으로 옳지 않은 것은? <br/></b>
					A. String 멤버변수는 “”로 자동 초기화된다.<br/>
					B. 지역변수는 반드시 초기화해야 한다.<br/>
					C. 생성자보다 초기화 블럭이 먼저 수행된다.<br/>
					D. 인스턴스변수보다 클래스변수가 먼저 초기화된다.<br/>
					<br/>
					<b>3. 다음 중 지역변수에 대한 설명으로 옳지 않은 것은? <br/></b>
					A. 자동 초기화되므로 별도의 초기화가 필요없다.<br/>
					B. 지역변수가 선언된 메서드가 종료되면 지역변수도 함께 소멸된다.<br/>
					C. 매서드의 매개변수로 선언된 변수도 지역변수이다.<br/>
					D. 스택(stack)영역에 생성되며 가비지 컬렉터에 의해 소멸된다.<br/>
					<br/>
					<b>4. 다음 중 접근 제어자에 대한 설명으로 옳지 않은 것은? <br/></b>
					A. 지역변수에도 접근 제어자를 사용할 수 있다.<br/>
					B. public은 접근제한이 전혀 없는 접근 제어자이다.<br/>
					C. (default)가 붙으면, 같은 패키지 내에서만 접근이 가능하다.<br/>
					D. protected가 붙으면, 같은 패키지 내에서 또는 다른 패키지의 자손 클래스에서 접근이 가능하다<br/>
					<br/>
					<b>5. 다음 중 인터페이스 설명으로 옳지 않은 것은? <br/></b>
					A. 패키지간의 연결을 도와준다.<br/>
					B. 서로 관계없는 클래스들에게 관계를 맺어줄수 있다.<br/>
					C. 독립적인 프로그래밍이 가능하다.<br/>
					D. 다중상속을 가능하게 해준다.<br/>
					E. 표준화를 가능하게 해준다.<br/>
					<br/>
					<b>6. 자바의 상속 특징 중에서 틀린 것은?<br/></b>
					A. 자바에서 모든 클래스의 최상위 슈퍼 클래스는 java.lang.System 클래스이다.<br/>
					B. 자바에서는 상속의 횟수에 제한이 없다.<br/>
					C. 자바에서는 클래스의 다중 상속을 지원하지 않는다.<br/>
					D. 자바에서 상속을 표현하는 키워드는 extends이다.<br/>
					<br/>
					</div>
					<div id="answer">
						<table class="board" cellspacing=0 id="answer1">
							<tr>
								<th>번호</th>
								<th>A</th>
								<th>B</th>
								<th>C</th>
								<th>D</th>
							</tr>
							<%for(int i=0;i<6;i++){ %>
							<tr>
								<td><%=i+1 %></td>
								<td><input type="radio" form="test1" name="ques<%=i+1 %>" value="1"/></td>
								<td><input type="radio" form="test1" name="ques<%=i+1 %>" value="2"/></td>
								<td><input type="radio" form="test1" name="ques<%=i+1 %>" value="3"/></td>
								<td><input type="radio" form="test1" name="ques<%=i+1 %>" value="4"/></td>
							</tr>
							<%} %>
							<tr><td colspan="5"><button type="submit" class="hids"></button> <button type="button" id="edtest1">제출하기</button></td></tr>
						</table>
					</div>
				</div>
				<div class="test" id="test2">
					<span><h1>Test (Database)</h1></span>
					<div id="question">
					
					<b>1. 후보 키에 대한 설명으로 옳지 않은 것은?<br/>		</b>			     
					     1. 릴레이션의 기본 키와 대응되어 릴레이션 간의 참조 무결성 제약 조건을 표현하는데 사용되는 중요한 도구이다.<br/>
					     2. 릴레이션의 후보 키는 유일성과 최소성을 모두 만족해야 한다.<br/>
					     3. 하나의 릴레이션에 속하는 모든 튜플들은 중복된 값을 가질 수 없으므로 모든 릴레이션은 반드시 하나 이상의 후보 키를 갖는다.<br/>
					     4. 릴레이션에서 튜플을 유일하게 구별해 주는 속성 또는 속성들의 조합을 의미한다.<br/>
					<br/>
					<b>2.데이터베이스 환경 하에서 데이터 참조는 데이터베이스에 저장된 레코드들의 위치나 주소에 의해서가 아니라 사용자가 요구하는 데이터의 내용, 즉 데이터 값에 따라 참조된다는 데이터베이스의 특성은?	<br/>	</b>			     
					     1. Content Reference<br/>
					     2. ontinuous Evolution<br/>
					     3. Concurrent Sharing<br/>
					     4. Time Accessibility<br/>
					<br/>
					<b>3.로킹(Locking) 기법에 대한 설명으로 옳지 않은 것은?	<br/>		</b>		     
					     1. 로킹 단위가 작아지면 병행성 수준이 낮아진다.<br/>
					     2. 로킹의 대상이 되는 객체의 크기를 로킹 단위라고 한다.<br/>
					     3. 데이터베이스도 로킹 단위가 될 수 있다.<br/>
					     4. 로킹 단위가 커지면 로크 수가 작아 로킹 오버헤드가 감소한다.<br/>
					<br/>
					<b>4. 데이터베이스 설계에 대한 설명으로 옳지 않은 것은?	<br/>		</b>		     
					     1. 개념적 설계 단계에서는 트랜잭션 인터페이스 설계, 스키마의 평가 및 정제 등의 작업을 수행한다.<br/>
					     2. 요구 조건 분석 단계는 사용자의 요구 조건을 수집하고 분석하여 사용자가 의도하는 데이터베이스의 용도를 파악해야 한다.<br/>
					     3. 논리적 설계 단계에서는 개념적 설계 단계에서 만들어진 정보 구조로부터 특정 목표 DBMS가 처리 할 수 있는 스키마를 생성한다.<br/>
					     4. 물리적 설계 단계에서는 저장 구조와 접근 경로 등을 결정한다.<br/>
					<br/>
					<b>5. 한 릴레이션의 기본 키를 구성하는 어떠한 속성 값도 널(Null) 값이나 중복 값을 가질 수 없음을 의미하는 것은?<br/></b>
					     1. 개체 무결성 제약 조건<br/>
					     2. 참조 무결성 제약 조건<br/>
					     3. 도메인 무결성 제약 조건<br/>
					     4. 키 무결성 제약 조건<br/>
					<br/>
						<b>6. 릴레이션의 특징으로 거리가 먼 것은?	<br/>	</b>			     
					     1. 각 속성은 유일한 이름을 가지며, 속성의 순서는 큰 의미가 있다.<br/>
					     2. 모든 속성 값은 원자 값이다.<br/>
					     3. 튜플 사이에는 순서가 없다.<br/>
					     4. 모든 튜플은 서로 다른 값을 갖는다.<br/>
					     <br/>
					</div>
					<div id="answer2">
						<table class="board" cellspacing=0 id="answer1">
							<tr>
								<th>번호</th>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
							</tr>
							<%for(int i=0;i<6;i++){ %>
							<tr>
								<td><%=i+1 %></td>
								<td><input type="radio" form="test2" name="ques<%=i+1 %>" value="1"/></td>
								<td><input type="radio" form="test2" name="ques<%=i+1 %>" value="2"/></td>
								<td><input type="radio" form="test2" name="ques<%=i+1 %>" value="3"/></td>
								<td><input type="radio" form="test2" name="ques<%=i+1 %>" value="4"/></td>
							</tr>
							<%} %>
							<tr><td colspan="5"><button type="submit" class="hids"></button> <button type="button" id="edtest2">제출하기</button></td></tr>
						</table>
					</div>
				</div>
				<div class="test" id="test3">
					<span><h1>Test (Database)</h1></span>
					<div id="question">					
					<b>1. 서블릿을 작성하기 위해서 반드시 상속받아야 하는 클래스는 무엇인가?<br/></b>
					1) HttpServlet 클래스<br/>
					2) Servlet 인터페이스<br/>
					3) GenericServlet 클래스 <br/>
					4) ServletContext 클래스<br/>
					<br/>
					<b>2. 다음 중 지시자가 아닌 것은 무엇인가?<br/></b>
					1) forward<br/>
					2) include<br/>
					3) taglib<br/>
					4) page<br/>
					<br/>
					<b>3. 다음 중 JSP에서 제공하는 표준 액션(standard action) 태그가 아닌 것은 무엇인가?<br/></b>
					1) plugin  <br/>
					2) forward<br/>
					3) useBean<br/>
					4) include <br/>
					5) setProperty<br/>
					
					<b>4. 다음 중 JSP 페이지에서 호출할 필요가 전혀 없는 메서드는?<br/></b>
					1) getSession 메서드<br/>
					2) addCookies 메서드<br/>
					3) getAttribute 메서드<br/>
					4) getCookies 메서드 <br/>
					
					<b>5. 다음 중 sendRediret 메소드에 대한 설명으로 옳지 않은 것은?<br/></b>
					1) URL에 post 방식으로 파라미터 전달이 가능하다.<br/>
					2) sendRedirect는 클라이언트 요청처리 후,<br/>
					   신규요청을 위해 응답으로 받은 URL로 클라이언트와 재통신한다.<br/>
					3) request 속성으로 저장된 객체는 소멸된다. <br/>
					4) 새로고침 버튼을 눌렀을 때 일어나는 같은 동작의 중복을 막을 수 있다. <br/>
					
					<b>6. JDBC를 이용한 웹 프로그램을 하려고 한다. 관련 API의 사용이 옳은 것은 무엇인가?<br/>	</b>				
					1) PreparedStatement pstmt = conn.prepareStatement( ); <br/>
					2) Statement stmt = conn.createStatement( );<br/>
					    ResultSet rs = stmt.executeUpdate(sql);<br/>
					3) Connction conn = DriverManager.connection(url, id, pw);<br/>
					4) ResultSet rs = stmt.executeQuery();<br/>
					</div>
					<div id="answer3">
						<table class="board" cellspacing=0 id="answer1">
							<tr>
								<th>번호</th>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
							</tr>
							<%for(int i=0;i<6;i++){ %>
							<tr>
								<td><%=i+1 %></td>
								<td><input type="radio" form="test3" name="ques<%=i+1 %>" value="1"/></td>
								<td><input type="radio" form="test3" name="ques<%=i+1 %>" value="2"/></td>
								<td><input type="radio" form="test3" name="ques<%=i+1 %>" value="3"/></td>
								<td><input type="radio" form="test3" name="ques<%=i+1 %>" value="4"/></td>
							</tr>
							<%} %>
							<tr><td colspan="5"><button type="submit" class="hids"></button> <button type="button" id="edtest3">제출하기</button></td></tr>
						</table>
					</div>
				</div>
				<div class="stu_foot"></div>
			</div>
			<script type="text/javascript" src="../js/jquery-ui.js"></script>
			<script type="text/javascript">
			$(document).ready(function(){
				$('#qsel1').click(function(){
					$('.test').css("display","none");
					$('#test1').css("display","block");
				});
				$('#qsel2').click(function(){
					$('.test').css("display","none");
					$('#test2').css("display","block");
				});
				$('#qsel3').click(function(){
					$('.test').css("display","none");
					$('#test3').css("display","block");
				});
				var message = "";
				$('#edtest1').click(function(){
					var ques1= $('input[name="ques1"]:checked,input[form="ques1"]:checked').val();
					var ques2= $('input[name="ques2"]:checked,input[form="ques1"]:checked').val();
					var ques3= $('input[name="ques3"]:checked,input[form="ques1"]:checked').val();
					var ques4= $('input[name="ques4"]:checked,input[form="ques1"]:checked').val();
					var ques5= $('input[name="ques5"]:checked,input[form="ques1"]:checked').val();
					var ques6= $('input[name="ques6"]:checked,input[form="ques1"]:checked').val();
					$.ajax({
    			        // type을 설정합니다.
    			        type : 'post',
    			        url : "test1.hb",
    			        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
    			        data : {"ques1" : ques1, "ques2":ques2, "ques3":ques3, "ques4":ques4, "ques5":ques5, "ques6":ques6},
    			        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
    			        success : function (data) {
    			            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
    			            message = data;
    			            alert(message);
    			            location.href="std_info.hb";
    			        }
    				});
				});
				$('#edtest2').click(function(){
					var ques1= $('input[name="ques1"]:checked,input[form="ques2"]:checked').val();
					var ques2= $('input[name="ques2"]:checked,input[form="ques2"]:checked').val();
					var ques3= $('input[name="ques3"]:checked,input[form="ques2"]:checked').val();
					var ques4= $('input[name="ques4"]:checked,input[form="ques2"]:checked').val();
					var ques5= $('input[name="ques5"]:checked,input[form="ques2"]:checked').val();
					var ques6= $('input[name="ques6"]:checked,input[form="ques2"]:checked').val();
					$.ajax({
    			        // type을 설정합니다.
    			        type : 'post',
    			        url : "test1.hb",
    			        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
    			        data : {"ques1" : ques1, "ques2":ques2, "ques3":ques3, "ques4":ques4, "ques5":ques5, "ques6":ques6},
    			        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
    			        success : function (data) {
    			            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
    			            message = data;
    			            alert(message);
    			            location.href="std_info.hb";
    			        }
    				});
				});
				$('#edtest3').click(function(){
					var ques1= $('input[name="ques1"]:checked,input[form="ques3"]:checked').val();
					var ques2= $('input[name="ques2"]:checked,input[form="ques3"]:checked').val();
					var ques3= $('input[name="ques3"]:checked,input[form="ques3"]:checked').val();
					var ques4= $('input[name="ques4"]:checked,input[form="ques3"]:checked').val();
					var ques5= $('input[name="ques5"]:checked,input[form="ques3"]:checked').val();
					var ques6= $('input[name="ques6"]:checked,input[form="ques3"]:checked').val();
					$.ajax({
    			        // type을 설정합니다.
    			        type : 'post',
    			        url : "test1.hb",
    			        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
    			        data : {"ques1" : ques1, "ques2":ques2, "ques3":ques3, "ques4":ques4, "ques5":ques5, "ques6":ques6},
    			        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
    			        success : function (data) {
    			            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
    			            message = data;
    			            alert(message);
    			            location.href="std_info.hb";
    			        }
    				});
				});
			});
			$(function() {
				$('#answer').draggable();
				$('#answer2').draggable();
				$('#answer3').draggable();
			});
			</script>
			<!-- content end -->

		</div>
	</div>
</body>
</html>