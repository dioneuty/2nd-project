<%@page import="com.hb.edu.model.EpilogueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width = device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/mygrid.css">
<link rel="stylesheet" type="text/css" href="../css/contentsTitle.css">
<link href="../css/mygrid2.css" type="text/css" rel="stylesheet" />
<!-- content내의 submenu,subcontent 프레임  grid -->
<link href="../css/std_info.css" type="text/css" rel="stylesheet" />
<!-- subcontent 내부 내용 css -->
<style>
.cate>div {
	border-bottom: 1px solid #525252;
	border-top: 1px solid #525252;
	box-sizing: border-box;
	display: inline-block;
	width: 30%;
	max-width: 180px;
	text-align: center;
	background-color: darkgray;
}

.cate>div>a {
	text-decoration: none;
	color: white;
}

#ca1 {
	background-color: #154669;
}

#ca2 {
	background-color: #0e7aa1;
}

#ca3 {
	background-color: #27a5cc;
}

#lec_summary {
	background-color: rgb(235, 235, 235);
}

#lec_table>table>tbody>tr>td:nth-child(1) {
	background-color: rgb(235, 235, 235);
	width: 100px;
	text-align: center;
}

#lec_intro>img {
	width: 100%;
}

#lec_intro>img:last-child {
	margin-bottom: 15%;
}

#lec_intro>#lec_pro {
	width: 75%;
	margin: 0px 10%;
}

#curri_table {
	width: 100%;
}

#curri_table>tbody>tr>th {
	background-color: rgb(235, 235, 235);
}

#curri_table>tbody>tr>td {
	border-bottom: solid 1px gray;
	padding: 20px;
}

#curri_table>tbody>tr>td:nth-child(1) {
	width: 35%;
}

#curri_table>tbody>tr>td:nth-child(2) {
	width: 50%;
}

#curri_table>tbody>tr>td:nth-child(3) {
	width: 15%;
}

#lec_button {
	margin: 10% 45%;
}

#intro_detail {
	background-color: rgb(235, 235, 235);
}

@media screen and (max-width:768px) {
	#teamimg, #pesentaionimg {
		display: none;
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	#teamimgmobile, #presentationmobile {
		display: none;
	}
}

@media screen and (min-width:1200px) {
	#teamimgmobile, #presentationmobile {
		display: none;
	}
}

.container2 .aside * {
	text-align: center;
	font-family: "Hanna";
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

.container2  .char1 * {
	text-align: center;
	color: #011548;
}

#folio>div {
	min-width: 300px;
	margin-left: 8px;
	height: 335px;
	display: none;
}

#thumbnail {
	border-top: 1px solid rgb(233, 233, 233);
	border-bottom: 1px solid rgb(233, 233, 233);
	border-right: 1px solid rgb(233, 233, 233);
	border-left: 1px solid rgb(233, 233, 233);
	height: 230px;
}

#explain {
	border: none;
	height: 70px;
	border-bottom: 1px solid rgb(123, 93, 93);
	font-family: sans-serif;
}

#explain>ul>li {
	list-style: none;
	margin-left: -40px;
	text-align: center;
}

#morebutton {
	cursor: pointer;
	margin-top: 6%;
	width: 100%;
	height: 30px;
	background-color: rgb(204, 204, 204);
	text-align: center;
	font-weight: bold;
	font-family: sans-serif;
	font-size: 1.5em;
}
.profile{
	display : inline-block;
	width : 60px;
	height : 60px;
	margin: 0px auto;
	background-image: url("../imgs/profile.png");
	background-repeat: no-repeat;
	background-size: 100% 100%; 
}
.ep_cont {
	display:inline-block;
	width: 85%;
	margin: 5px auto;
	margin-bottom: 10px;
}

.ep_header {
	background-image: url("../imgs/ep_header.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	margin-top: 15px;
}

.ep_mid {
	background-image: url("../imgs/ep_mid.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	padding-bottom: 5px;
	padding-left: 30px;
}

.ep_footer {
	background-image: url("../imgs/ep_footer.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	padding-right: 30px;
	padding-bottom: 5px;
	text-align: right;
	color: rgb(135, 135, 135);
}

#lines {
	width: 100%;
	height: 3px;
	background-color: rgb(52, 78, 227);
}

#eptext {
	width: 70%;
	height: 20px;
	margin-right: 30px;
	margin-left: 20px;
	padding: 16px 13px;
	color: #263238;
	border: 1px solid #d9d9d9;
	background: transparent;
	border-radius: 5px;
}

#epsend {
	width: 15%;
	border-radius: 5px;
	cursor: pointer;
	padding: 8px 13px;
	background-color: #263238;
	color: #ffffff;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		if($('#eptext').val()== null){
			e.preventDefault();
		}
		
		var more = 5;
		$("#folio>div").each(function(index) {
			if (index <= 5) {
				$(this).css("display", "inline-block");
			}
		})

		$("#morebutton").click(function() {
			more += 6;
			the(more);
			if (more >= $("#folio>div").length) {
				$("#morebutton").css("display", "none");
			}
		})
	})

	function the(a) {
		$("#folio>div").each(function(index) {
			if (index <= a) {
				$(this).css("display", "inline-block");
			}

		})
	}
</script>
</head>

<body>
	<%@ include file="../temple/menu.jspf"%>
	<div class="container2 portfolio">
		<div class="row">
			<!-- menu start -->

			<div class="aside col-2 mcol-0">
				<h1>교육 과정</h1>
				<div class="menu">
					<p>교육 과정</p>
					<ul>
						<li><a href="#" class="tab smenu1 active"> 개강 과정 안내 <span>→</span></a></li>
						<li><a href="#" class="tab smenu2"> 수강생 후기 <span>→</span></a></li>
						<li><a href="#" class="tab smenu3"> 포트폴리오 <span>→</span></a></li>
					</ul>
				</div>
				<div class="char1">
					<h1>교 육 문 의</h1>
				</div>
			</div>
			<!-- menu end -->

			<!-- content1 start -->
			<div class="content col-7 mcol-9 smenu1-cont">
				<div id="title-left">Lecture</div>
				<div id="title-right"></div>

				<div id="lecture">

					<div id="lec_name">
						<h1>JAVA기반 웹&앱 개발자 양성 과정</h1>
						<br /> <br />
					</div>

					<div class="cate" id="c1">
						<div id="ca1">
							<a href="#c1">과정개요</a>
						</div>
						<div>
							<a href="#c2">과정소개</a>
						</div>
						<div>
							<a href="#c3">커리큘럼</a>
						</div>
					</div>

					<div id="lec_summary">
						<h3>과정개요</h3>
						<p>
							애플리케이션에 시각적인 요소를 디자인하기 위해 비주얼 디자인 콘셉트를 도출, GUI를 상세 디자인하는 능력을 함양하고
							디자인 가이드를 바탕으로 애플리케이션의 UI를 제작, 테스트하는 능력을 배양하여 심미적 요소와 기능적 요소를 모두
							갖춘 최상의 애플리케이션 제작이 가능한 인재를 양성한다. 또한, 애플리케이션 구현에 필요한 데이터베이스를 구현할 수
							있는 능력을 배양한다.<br /> <br />
						</p>
					</div>
					<div id="lec_table">
						<table>
							<tr>
								<td>교육기간</td>
								<td>2017.05.25 ~ 2017.11.27 (6개월, 총 1,000시간)</td>
							</tr>
							<tr>
								<td>교육일정</td>
								<td>월 ~ 금 09:00 ~ 18:00 [점심시간 13:00 ~ 14:00] * 1일 8시간</td>
							</tr>
							<tr>
								<td>교육대상</td>
								<td>취업 또는 창업 희망자, 성별/연령 제한없음, 비전공자&초보자 가능 (수강전 공부하면 좋은 선수과목
									: C언어 기초)</td>
							</tr>
							<tr>
								<td>교육비용</td>
								<td>0원(전액 무료)</td>
							</tr>
							<tr>
								<td>교육정원</td>
								<td>20명내외</td>
							</tr>
							<tr>
								<td>진출분야</td>
								<td>1.자바기반 웹개발자 (홈페이지제작 및 쇼핑몰사이트 구축)<br> 2.안드로이드 앱개발자
									(창업용 앱개발 및 구글 플레이스토어 어플제작)<br> 3.웹/앱 서버 관리자<br></td>
							</tr>
						</table>
						<br /> <br />
					</div>

					<div class="cate" id="c2">
						<div>
							<a href="#c1">과정개요</a>
						</div>
						<div id="ca2">
							<a href="#c2">과정소개</a>
						</div>
						<div>
							<a href="#c3">커리큘럼</a>
						</div>
					</div>
					<div id="lec_intro">
						<h3 id="h3">과정소개</h3>
						<ul id="intro_detail">
							<br />
							<li>자바 문법과 이론 등 가장 및 바탕이 되는 수업과 웹 개발에 대한 개념과 이론을 배울 수 있습니다.</li>
							<li>자바 언어인 JSP를 이용하여 사이트의 게시판과 회원가입 프로그램 등을 제작하고 실습하는 이론을 배울
								수 있습니다.</li>
							<li>자바 Spring 프레임워크를 이용하여 좀 더 복잡하고 세부적인 개발에 필요한 기술 능력을 배울 수
								있습니다.</li>
							<li>본 프로그램은 NCS 과정으로 실제 프로그래머의 업무에 필요한 분석과 설계 방법 또한 배울 수
								있습니다.<br /> <br />
							</li>
						</ul>
						<img id="lec_pro" src="../imgs/process/process_map.png" /> <img
							id="teamimg" src="../imgs/process/process_team.jpg" /> <img
							id="pesentaionimg" src="../imgs/process/process_presentation.jpg" />
						<img id="teamimgmobile"
							src="../imgs/process/process_moblieProject.jpg" /> <img
							id="presentationmobile"
							src="../imgs/process/process_mobliePresentation.jpg" />

					</div>

					<div class="cate" id="c3">
						<div>
							<a href="#c1">과정개요</a>
						</div>
						<div>
							<a href="#c2">과정소개</a>
						</div>
						<div id="ca3">
							<a href="#c3">커리큘럼</a>
						</div>
					</div>
					<div id="lec_curri">
						<h3>커리큘럼</h3>

						<table id="curri_table">
							<tr>
								<th>과목명</th>
								<th>교육내용</th>
								<th>비고</th>
							</tr>
							<tr>
								<td>JAVA, JSP 웹 개발</td>
								<td>- JAVA<br /> - JSP<br /> - SERVLET<br /> - 객체<br />
									- 클래스<br /> - JDBC<br />
								</td>
								<td>NCS</td>
							</tr>
							<tr>
								<td>Oracle DB구축</td>
								<td>- DBMS<br /> - SQL구문<br /> - WAS<br /> - 게시판구축<br />
									- 화면설계서 작성<br /> - UI구현<br /> - DB구현 및 설계<br />
								</td>
								<td>NCS</td>
							</tr>
							<tr>
								<td>HTML, CSS, JQuery</td>
								<td>- HTML<br /> - HTML5<br /> - CSS3<br /> - Javascipt<br />
									- Ajax<br />
								</td>
								<td>NCS</td>
							</tr>
						</table>
					</div>
					<div id="lec_button">
						<button id="lec_sub">수강신청</button>
					</div>
				</div>
			</div>
			<!-- content1 end -->
		<% 
			ArrayList<EpilogueDto> eplist = (ArrayList<EpilogueDto>) request.getAttribute("eplist"); 
			HanbUserDao hdao = new HanbUserDao();
		%>
			<!-- content2 start -->
			<div class="content col-7 mcol-9 smenu2-cont">
				<div id="title-left">Epilogue</div>
				<div id="title-right"></div>
				<div class="ep_inst">
					<form action="ep_insert.hb" method="post">
						<input type="text" name="epils" id="eptext" required="required" placeholder="140자 내외로 작성."/>
						<button type="submit" id="epsend">후기 등록</button>
					</form>
				</div>
				<hr id="lines">
				<% for(int i =0;i<eplist.size();i++){ 
					EpilogueDto epbean = eplist.get(i);
				%>
				<div class="profile"></div>
				<div class="ep_cont">
					ID(이름) : <span><%=uids %></span><span>(<%=epbean.getUname() %>)</span>
					<div class="ep_header">&nbsp;</div>
					<div class="ep_mid"><%=epbean.getEpCont()%></div>
					<div class="ep_footer"><%=epbean.getEpDate()%></div>
				</div><br/>
				<%} %>
			</div>
			<script type="text/javascript">
				var utype = <%=utypes%>
				$("#epsend").click(function(e){
					if(utype == 0 || utype == null){
						e.preventDefault();
						alert("로그인 하셔야만 등록하실 수 있습니다.");
					}
					if($('#eptext').val()== ""){
						e.preventDefault();
						alert("공백은 등록하실 수 없습니다.");
					}
				});
			</script>
			<!-- content2 end -->

			<!-- content3 start -->

			<div class="content col-7 mcol-9 smenu3-cont">
				<div id="title-left">Portfolio</div>
				<div id="title-right"></div>



				<div id="line">
					<img src="../imgs/right.jpg" alt="">
				</div>
				<div id="folio">
					<div>
						<a href="https://www.naver.com">
							<div id="thumbnail">
								<img src="../imgs/thumbnailnaver.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA기반 웹&앱 개발자 양성 과정</li>
								<li>이름:김아무개</li>
							</ul>
						</div>
					</div>
					<div>
						<a href="https://google.com">
							<div id="thumbnail">
								<img src="../imgs/thumbnailgoogle.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA+JSP+DB 전문가 양성 과정</li>
								<li>이름:박아무개</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="https://www.instagram.com/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailinsta.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:윤아무개</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.natuur-pop.com/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailnatuur.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA+JSP+DB 전문가 양성 과정</li>
								<li>이름:곽누구</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.poorchic.co.kr/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailpoorchic.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA기반 웹&앱 개발자 양성 과정</li>
								<li>이름:서현진</li>
							</ul>
						</div>
					</div>


					<div>
						<a href="http://kr.gentlemonster.com/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailgentlemon.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:정유미</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.kimchang.com/frame1.jsp">
							<div id="thumbnail">
								<img src="../imgs/thumbnailkimjang.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA+JSP+DB 전문가 양성 과정</li>
								<li>이름:박해진</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.porsche.com/korea/ko/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailporsche.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA+JSP+DB 전문가 양성 과정</li>
								<li>이름:김남길</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://splant.co.kr/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailsplant.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:윤여정</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.ccle.co.kr/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailccle.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:김성민</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.izm.co.kr/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailizm.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 : JAVA+JSP+DB 전문가 양성 과정</li>
								<li>이름:한혜진</li>
							</ul>
						</div>
					</div>


					<div>
						<a href="http://www.wwdoctor.com/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailpyun.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 :JAVA기반 웹&앱 개발자 양성 과정</li>
								<li>이름:김진경</li>
							</ul>
						</div>
					</div>


					<div>
						<a href="http://www.nanet.go.kr/main.do">
							<div id="thumbnail">
								<img src="../imgs/thumbnailgukh.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 :UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:김진경</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.moon1st.com/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailmoon.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 :JAVA기반 웹&앱 개발자 양성 과정</li>
								<li>이름:눙눙이</li>
							</ul>
						</div>
					</div>


					<div>
						<a href="http://www.daelimmuseum.org/dmuseum/index.do">
							<div id="thumbnail">
								<img src="../imgs/thumbnaildmuse.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 :JAVA+JSP+DB 전문가 양성 과정</li>
								<li>이름:이성경</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="https://www.darksouls3.com/ko/">
							<div id="thumbnail">
								<img src="../imgs/thumbnaildarksoul.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 :UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:천우희</li>
							</ul>
						</div>
					</div>

					<div>
						<a href="http://www.konkuk.ac.kr/">
							<div id="thumbnail">
								<img src="../imgs/thumbnailku.jpg"
									style="width: 30%; height: 230px" alt="">
							</div>
						</a>
						<div id="explain">
							<ul>
								<li>과정명 :UI/UX 웹프로그래밍 마스터 과정</li>
								<li>이름:딩딩이</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="morebutton">더보기 +</div>
			</div>
			<!-- content3 end -->

			<script type="text/javascript">
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
				});
			</script>
		</div>
	</div>
</body>

</html>