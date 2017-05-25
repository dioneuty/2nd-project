<%@page import="com.hb.customer.model.FaqDto"%>
<%@page import="com.hb.customer.model.NoticeDto"%>
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
<!-- content내의 submenu,subcontent 프레임  grid -->
<link href="../css/std_info.css" rel="stylesheet" type="text/css" />
<!-- subcontent 내부 내용 css -->
<link href="../css/cal.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
<meta charset="utf-8" />

<style type="text/css">
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
#qaboard th:nth-child(1) {
	width: 10%;
}
#qaboard th:nth-child(2) {
	width: 70%;
}
#qaboard th:nth-child(3) {
	width:20%;
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
.notices{
	text-decoration: none;
	font-weight:bold;
	color:black;
}
.qa_conts {
	display: none;
}
</style>
 <style>

        
        #faq_list {
            border: 1px solid #efefef;
            padding: 2%;
        }
        
        #faq_list>li {
            display: inline-block;
            margin-left: 10%;
            cursor: pointer;
        }
        #f_total{
        color:rgb(52, 78, 227);
        font-weight:700;
        }
        #faq_list>li:last-child {
            margin-right: 20%;
        }
        
        .faq_ul {
            margin: 0;
            padding: 0;
        }
        
        .faq_li {
            list-style: none;
        }
        
        .faq_q {
            margin: 0;
            border-top: 1px solid #ddd;
        }
        
        .faq_q>a {
            display: block;
            padding: .5em 1em;
            text-align: left;
            font-weight: bold;
            background: #fafafa;
            color: #000;
            text-decoration: none !important;
            
        }
        .faq_a{
        	margin-left: 43px;
        }
        .faq_q>a:hover,
        .faq_q>a:active,
        .faq_q>a:focus {
            background: #f8f8f8;
        }

    </style>

</head>
<%
	ArrayList<NoticeDto> nlist = (ArrayList<NoticeDto>) request.getAttribute("nlist");
	ArrayList<FaqDto> flist = (ArrayList<FaqDto>) request.getAttribute("flist");
	ArrayList<FaqDto> ftype1 = (ArrayList<FaqDto>) request.getAttribute("ftype1");
	ArrayList<FaqDto> ftype2 = (ArrayList<FaqDto>) request.getAttribute("ftype2");
	ArrayList<FaqDto> ftype3 = (ArrayList<FaqDto>) request.getAttribute("ftype3");
	HanbUserDto ubean = (HanbUserDto) session.getAttribute("ubean");
%>

<body>
	<%@ include file="../temple/menu.jspf"%>
	<script type="text/javascript">
		var res =
	<%=result%>
		;
		var chk = 0;
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
				<img src="../imgs/customer.png" alt="a" />
				<div class="menu">
					<p>고객 센터</p>
					<ul>
						<li><a href="#" class="tab smenu1 active">공지 사항 <span>→</span></a></li>
						<li><a href="#" class="tab smenu2"> 자주 묻는 질문 <span>→</span></a></li>
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
				<div id="title-left">공지사항</div>
				<div id="title-right"></div>
				<table cellspacing="0" id="hwboard" class="board">
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<%
						for(int i=0;i<nlist.size();i++){ 
							NoticeDto nbean = nlist.get(i);
					%>
					<tr>
						<td><%=nbean.getNNum()%></td>
						<td><a href="#" class="hworks notices" id="<%=nbean.getNNum()%>"><%=nbean.getNSub()%></a></td>
						<td><%=nbean.getUnum()%></td>
						<td><%=nbean.getNDate()%></td>
					</tr>
					<tr class="hw_conts" id="hc_<%=nbean.getNNum()%>">
						<td colspan="4">
							<div><%=nbean.getNContent()%></div>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				
				</div>
				<script type="text/javascript">
					var view = 0;
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


			<div class="content col-7 mcol-9 smenu2-cont">
				<div id="title-left">자주 묻는 질문</div>
				<div id="title-right"></div>
				<div id="faq">
                <ul id="faq_list">
                	 <li id="f_total">전체</li>
                    <li id="f_first">수강신청</li>
                    <li id="f_second">취업</li>
                    <li id="f_third">이용안내</li>
                </ul>
                
				<div id="faq_total">
                    <ul class="faq_ul">
                    <% for(int i=0; i<flist.size();i++){
                    	FaqDto fdto = flist.get(i);
                    	 %>
                        <li class="faq_li" id="faq_total_a1">
                            <p class="faq_q"><a href="#faq_total_a1">Q : <%=fdto.getFsub() %></a></p>
                            <p class="faq_a">A : <%= fdto.getFacont() %></p>
                        </li>
                        
                       <% }%>
                    </ul>
                </div>
				
                <div id="faq_first">
                    <ul class="faq_ul">
                    <% for(int i=0; i<ftype1.size();i++){
                    	FaqDto fdto = ftype1.get(i);
                    	 %>
                        <li class="faq_li" id="faq_first_a1">
                            <p class="faq_q"><a href="#faq_total_a1">Q : <%=fdto.getFsub() %></a></p>
                            <p class="faq_a">A : <%= fdto.getFacont() %></p>
                        </li>
                        
                       <% }%>
                    </ul>
                </div>
                <div id="faq_second">
                    <ul class="faq_ul">
                        <% for(int i=0; i<ftype2.size();i++){
                    	FaqDto fdto = ftype1.get(i);
                    	 %>
                        <li class="faq_li" id="faq_second_a1">
                            <p class="faq_q"><a href="#faq_second_a1">Q : <%=fdto.getFsub() %></a></p>
                            <p class="faq_a">A : <%= fdto.getFacont() %></p>
                        </li>
                        
                       <% }%>
                    </ul>
                </div>
                <div id="faq_third">
                    <ul class="faq_ul">
                        <% for(int i=0; i<ftype3.size();i++){
                    	FaqDto fdto = ftype3.get(i);
                    	 %>
                        <li class="faq_li" id="faq_third_a1">
                            <p class="faq_q"><a href="#faq_third_a1">Q : <%=fdto.getFsub() %></a></p>
                            <p class="faq_a">A : <%= fdto.getFacont() %></p>
                        </li>
                        
                       <% }%>
                    </ul>
                </div>

            </div>
             <script>
    $(function() {
        
        $('.faq_a').hide();
        $('.faq_q>a').click(function() {
            $(".faq_a").not($(this).parent().next(".faq_a").slideToggle(500)).slideUp();
            return false;
        });

        $('#faq_first, #faq_second, #faq_third').hide();
        $('#f_total').click(function() {
            $('#faq_list>li').css('color','black').css('font-weight','400');
            $(this).css('color','rgb(52, 78, 227)').css('font-weight','700');
            $('#faq_first, #faq_second, #faq_third').hide();
            $('#faq_total').fadeIn();
        });
        $('#f_first').click(function() {
            $('#faq_list>li').css('color','black').css('font-weight','400');
            $(this).css('color','rgb(52, 78, 227)').css('font-weight','700');
            $('#faq_total,#faq_second, #faq_third').hide();
            $('#faq_first').fadeIn();
        });
        $('#f_second').click(function() {
            $('#faq_list>li').css('color','black').css('font-weight','400');
            $(this).css('color','rgb(52, 78, 227)').css('font-weight','700');
            $('#faq_total,#faq_first, #faq_third').hide();
            $('#faq_second').fadeIn();
        });
        $('#f_third').click(function() {
            $('#faq_list>li').css('color','black').css('font-weight','400');
            $(this).css('color','rgb(52, 78, 227)').css('font-weight','700');
            $('#faq_total,#faq_second, #faq_first').hide();
            $('#faq_third').fadeIn();
        });
    });


    </script>
            
			</div>

			<!-- content end -->
			</div>

		</div>

</body>
</html>