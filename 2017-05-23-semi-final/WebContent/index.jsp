<%@page import="com.hb.user.model.UserAttendDao"%>
<%@page import="com.hb.user.model.UserAttendDto"%>
<%@page import="com.hb.customer.model.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
	<%
		String uids = (String) session.getAttribute("uids");
		Boolean result = (Boolean) session.getAttribute("result");
		Integer utypes = (Integer) session.getAttribute("utype");
		Integer join_result = (Integer) session.getAttribute("join_result");
		ArrayList<NoticeDto> nlist = (ArrayList<NoticeDto>)request.getAttribute("nlist");
		if(join_result == null){
			join_result = -1;
		}
		if(utypes == null){
			utypes = 0;
		}
		String path = request.getContextPath();
	
		System.out.println("userid :"+uids+"/ login result : "+result+"/ utype :"+utypes);
		
		ArrayList<NoticeDto> nlists = (ArrayList<NoticeDto>) request.getAttribute("nlist");
		
		
	%>
	
<head>
    <title>한빛교육센터</title>
    <meta name="viewport" content="width = device-width, initial-scale=1.0"> 
    <link href="css/mygrid.css" rel="stylesheet" type="text/css" />
    <link href="css/animate.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
        <script type="text/javascript">
        var join_re = <%=join_result %>       
        var res = <%= result %>;
        $(document).ready(function() {
        	
        		if(join_re > 0){
            		alert("회원가입에 성공하였습니다.");
            		join_re = -1;
            	}else if(join_re == 0){
            		alert("회원가입에 실패하였습니다.")
            	}else{
            		console.log(join_re);
            	}
        	
                $('#login>a').click(function(e) {
        			e.preventDefault();
        			$('.lbg').css("display", "block");
        			$('.containers').css("display", "block");
        			$('body').css("overflow-y","hidden");
        		});
                
                $('#mlogin>a').click(function(e) {
        			e.preventDefault();
        			$('.lbg').css("display", "block");
        			$('.containers').css("display", "block");
        			$('.lbg .containers .bg').hide();
        			$('body').css("overflow-y","hidden");
        		});
        		
        		$('#logout>a').click(function() {
        			alert("로그아웃 되었습니다.");
        			$('.lbg').css("display", "none");
        			$('.containers').css("display", "none");
        			$('body').css("overflow-y","auto");
        			$('#err').text(" ");
        		});
        		
        		if(res == null || res == true){
        			$('.lbg').css("display", "none");
        			$('.containers').css("display", "none");
        			$('body').css("overflow-y","auto");
        			$('#err').text(" ");
        		}else {
        			$('.lbg').css("display", "block");
        			$('.containers').css("display", "block");
        			$('body').css("overflow-y","hidden");
        			$('#err').text("ID/비밀번호를 확인해 주세요.");
        		}
           
        });
        

    </script>
    <style>
        /* 메뉴 */
        body{
        	overflow-x : hidden;
        }
        #mlogo {
            background-image: url(imgs/logo5.png);
            min-height: 78px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            height: 100px;
        }
    	#mlogo>a{
        	width: 100%;
        	height: 100%;
        	display:inline-block;
        	text-decoration: none;
        }
        #login>a {
            text-decoration: none;
            color: black;
        }
        
        #logout>a{
        	text-decoration: none;
            color: black;
        }
        
        #menu1 {
            border: solid 1px rgb(234, 234, 234);
        }
        
        #menu1>table,
        #menu2>table {
            margin: 4px auto;
            width: 95%;
        }
        
        #menu1>table>tbody>tr>td,
        #menu2>table>tbody>tr>td {
            border-right: 1px rgb(234, 234, 234) solid;
            width: 13%;
            text-align: center;
        }
        
        #menu2>table>tbody>tr>td {
            padding-top: 10px;
        }
        
        #menu1>table>tbody>tr>td>a,
        #menu2>table>tbody>tr>td>a {
            text-decoration: none;
            color: black;
        }
        
        #menu1>table>tbody>tr>td:last-child,
        #menu2>table>tbody>tr>td:last-child {
            border-right: none;
        }
        
        #menu1>table>tbody>tr>td:hover {
            background-color: rgb(234, 234, 234);
        }
        
        #menu2 {
            background-color: white;
            height: 250px;
            position: absolute;
            width: 80%;
            display: none;
            z-index: 10;
        }
        /*메뉴 끝*/
        /*슬라이더*/
        
        #slider {
            margin: auto -12.5%;
            width: 125%;
            height: 400px;
            background-color: dimgray;
        }
        
        .mySlides {
            display: none
        }
        /* Slideshow container */
        
        .slideshow-container {
            max-width: 80%;
            position: relative;
            margin: auto;
            height: 400px;
        }
        /* Next & previous buttons */
        
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
        }
        /* Position the "next button" to the right */
        
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }
        /* On hover, add a black background color with a little bit see-through */
        
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
        /* Caption text */
        
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }
        /* Number text (1/3 etc) */
        
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }
        /* The dots/bullets/indicators */
        
        .dot {
            cursor: pointer;
            height: 13px;
            width: 13px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }
        
        .active,
        .dot:hover {
            background-color: #717171;
        }
        /* Fading animation */
        
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }
        
        @-webkit-keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }
        
        @keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }
        /* On smaller screens, decrease text size */
        
        @media only screen and (max-width: 300px) {
            .prev,
            .next,
            .text {
                font-size: 11px
            }
        }
        /*슬라이더 끝 */
        /*모바일 폼 */
        
        #m_list {
            height: 100px;
        }
        
        #m_list_item {
            position: absolute;
            top: 100px;
            z-index: 30;
            width: 100%;
            left: 0%;
        }
        
        #m_list>img {
            padding-top: 20px;
            width: 100%;
        }
        
        #m_list_item>ul {
            background-color: rgb(21, 70, 105);
            width: 100%;
            margin: 0px auto;
            padding: 0px;
            text-align: left;
        }
        
        #m_list_item>ul>ul {
            margin: 0px auto;
            width: 60%;
            padding: 0px;
        }
        
        #m_list_item>ul>ul>li>a,
        #m_list_item>ul>ul>a {
            text-decoration: none;
            color: rgb(233, 233, 233);
        }
        
        #m_list_item>ul>ul>li>a:hover,
        #m_list_item>ul>ul>a:hover {
            -webkit-animation: mymove 1s;
        }
        
        @-webkit-keyframes mymove {
            from {
                color: rgb(153, 205, 241);
            }
            to {
                color: white;
            }
        }
        
    
        #m_list_item>ul>ul>li {
            
            display: none;
            list-style: none;
            padding-top: 10px;
            margin-left: 30px;
            border-bottom: 1px solid rgb(233, 233, 233);
            height: 30px;
        }
        
        #m_list_item>ul>ul {
            padding-top: 10px;
            padding-bottom: 3px
        }
        
        #m_list_item>ul>ul:last-child {
            padding-bottom: 20px
        }
        /*모바일 폼 끝*/
        
        @media screen and (max-width:768px) {
            #menu2 {
                z-index: -10;
                /*모바일에서 자꾸 가려져서 뒤로 보냄*/
                display: none;
            }
            #menu2>table {
                display: none;
            }
        }
        
        #proc_name {
            padding-top: 40px;
            padding-bottom: 40px;
        }
        
        #proc>div {
            padding-bottom: 80px;
        }
        
        #proc>div>center>a>img {
            width: 80%;
            padding: 0px;
            margin: 0px auto;
        }
        
        #proc>div>center>div:nth-child(2) {
            color: rgb(21, 70, 105);
            font-weight: bold;
        }
        
        #proc>div>center>div:nth-child(3) {
            text-decoration-color: red;
            text-decoration: 3px solid red;
        }
        
        #review {
            padding-top: 8px;
            margin-left: -12.5%;
            width: 125%;
            background-color: gainsboro;
            height: 250px;
        }
        
        #review>div:nth-child(1) {
            margin-left: 12.5%;
        }
        
        #review>div>a>img {
            width: 99%;
        }
        
        #under {
            background-size: 100% 100%;
            background-image: url(imgs/main/underbg.jpg);
            height: 285px;
        }
        
        .footer {
            padding: 0px;
            margin: auto -12.5%;
            width: 125%;
            height: 120px;
            background-color: rgb(200, 200, 200);
        }
        
        .footer>#foot_logo {
            margin: 25px 0px;
        }
        
        #copy {
            height: 80px;
            overflow: hidden;
            margin: 20px 0px;
        }
        
        #m_list_item {
            display: none;
        }
        #notice>img,
        #question>div>img {
            margin: 0px auto;
            width: 30%;
        }
        
        #question>div>a>img {
            width:90%;
        }
        
        @media screen and (max-width:768px) {
            #review>div:nth-child(1) {
                margin-left: 0;
            }
            #proc>div>center>img {
                width: 30%;
            }
            #proc>div>center>a>img {
                width: 30%;
            }
            #review>div>a>img {
                width: 80%;
                margin-left: 10.5%;
            }
            #review {
               background-color:white;
                height: 0px;
            }
            #under{
               
                background-image: none;
            }
            #under>div:first-child{
                 margin-top: 80px;
            } 
            #under>div:last-child{
                 margin-bottom: 80px;
            }
        }
        .tlt {
            
            position: absolute;
            top: 20%;
            left: 20%;;
            color: rgb(40,80,220);
        }
        
        .tlt2 {
            position: absolute;
            top: 40%;
            left:38%;
            color:white;
        }
        
        .tlt3 {
            position: absolute;
            top: 65%;
            left:50%;
            color: azure;
        }
        .tlt4 {
            position: absolute;
            top: 100px;
            left: 200px;
            color: white;
        }
        .tlt5 {
            position: absolute;
            top: 200px;
            left: 300px;
             color: white;
        }
        .notices li{
        	list-style-image:url('imgs/no.png');
        }
        .notices li>a{
        	text-decoration:none;
        	font-weight:bold;
        	font-size: 20px;
        	color:black;
        }
        .notices li>a:hover{
        	color:skyblue;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#menu1>table>tbody>tr>td").click(function() {
                $("#menu2").slideToggle();
            })

	            $("#m_list_item>ul>ul>a").click(function(){
	                $("#m_list_item>ul>ul>a").css("border-bottom","none");
	                $(this).css("border-bottom","1px solid rgb(233, 233, 233)");
	            })
            var toggled = true;
            $("#m_list>img").on('click', function() {
                $("#m_list_item").slideToggle();
                if (!toggled) {
                    $(this).attr("src", "imgs/list.png");
                    toggled = true;
                } else {
                    $(this).attr("src", "imgs/next.png");
                    toggled = false;
                }
            }); //오른쪽위 바뀌는거


            //하위메뉴 술라이드
            $("#m_list_item>ul>ul:nth-child(1)>a").click(function() {
                $("#m_list_item>ul>ul:nth-child(2)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(3)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(4)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(5)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(6)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(1)>li").slideToggle();
            })
            $("#m_list_item>ul>ul:nth-child(2)>a").click(function() {
                $("#m_list_item>ul>ul:nth-child(1)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(3)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(4)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(5)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(6)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(2)>li").slideToggle();
            })
            $("#m_list_item>ul>ul:nth-child(3)>a").click(function() {
                $("#m_list_item>ul>ul:nth-child(1)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(2)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(4)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(5)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(6)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(3)>li").slideToggle();
            })
            $("#m_list_item>ul>ul:nth-child(4)>a").click(function() {
                $("#m_list_item>ul>ul:nth-child(1)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(2)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(3)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(5)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(6)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(4)>li").slideToggle();
            })
            $("#m_list_item>ul>ul:nth-child(5)>a").click(function() {
                $("#m_list_item>ul>ul:nth-child(1)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(2)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(3)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(4)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(6)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(5)>li").slideToggle();
            })
            $("#m_list_item>ul>ul:nth-child(6)>a").click(function() {
                $("#m_list_item>ul>ul:nth-child(1)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(2)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(3)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(4)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(5)>li").slideUp();
                $("#m_list_item>ul>ul:nth-child(6)>li").slideToggle();
            })
            //하위메뉴 슬라이드끝

            $("#proc>div:nth-child(3)>center>a>img").mouseover(function() {
                $("#proc>div>center>img").css('display', 'block');
                $("#proc>div:nth-child(3)>center>a>img").attr({
                    "src": "imgs/main/Java_5.png"
                });
            }).mouseleave(function() {
                $("#proc>div>center>img").css('display', 'none');
                $("#proc>div:nth-child(3)>center>a>img").attr({
                    "src": "imgs/main/Java_3.png"
                });
            })
            $("#proc>div:nth-child(4)>center>a>img").mouseover(function() {
                $("#proc>div:nth-child(4)>center>a>img").attr({
                    "src": "imgs/main/Web_5.png"
                });
            }).mouseleave(function() {
                $("#proc>div:nth-child(4)>center>a>img").attr({
                    "src": "imgs/main/Web_3.png"
                });
            })
            $("#proc>div:nth-child(5)>center>a>img").mouseover(function() {
                $("#proc>div:nth-child(5)>center>a>img").attr({
                    "src": "imgs/main/DB_5.png"
                });
            }).mouseleave(function() {
                $("#proc>div:nth-child(5)>center>a>img").attr({
                    "src": "imgs/main/DB_3.png"
                });
            })

            $("#review>div:nth-child(3)>a>img").mouseover(function() {
                $("#review>div:nth-child(3)>a>img").attr({
                    "src": "imgs/main/job1.jpg"
                });
            }).mouseleave(function() {
                $("#review>div:nth-child(3)>a>img").attr({
                    "src": "imgs/main/job1-1.jpg"
                });
            })
            $("#review>div:nth-child(2)>a>img").mouseover(function() {
                $("#review>div:nth-child(2)>a>img").attr({
                    "src": "imgs/main/job2.jpg"
                });
            }).mouseleave(function() {
                $("#review>div:nth-child(2)>a>img").attr({
                    "src": "imgs/main/job2-1.jpg"
                });
            })
            $("#review>div:nth-child(1)>a>img").mouseover(function() {
                $("#review>div:nth-child(1)>a>img").attr({
                    "src": "imgs/main/job3.jpg"
                });
            }).mouseleave(function() {
                $("#review>div:nth-child(1)>a>img").attr({
                    "src": "imgs/main/job3-1.jpg"
                });
            })
        })
    </script>
</head>

<body>
    <div class="container">
    	
        <!-- 헤더 -->
        <!-- 모바일 메뉴 -->
        <div class="row" id="mobile">
            <div class="col-0 mcol-5" id="mlogo"></div>
            <div class="col-0 mcol-6">&nbsp;</div>
            <div class="col-0 mcol-1" id="m_list">
                <img src="imgs/list.png" />
            </div>
            <div class="col-0 mcol-5"></div>
            <%if(result == null || !result){ %>
            <div class="col-0 mcol-12" id="login">
                <a href="#">로그인</a>
            </div>
            <% }else{%>
            <div class="col-0 mcol-12" id="logout">
                <a href="<%=path %>/logout.hb">로그아웃</a>
            </div>
            <%}%>
            <div class="col-0 mcol-12" id="m_list_item">
                <%@ include file="temple/mobilelink.jspf" %>
            </div>
        </div>
        <!-- 모바일 메뉴 -->
        <div class="row">
        	<%@include file="temple/login_pc.jspf"%>
            <div class="col-3 mcol-0" id="mlogo"><a href="<%=path %>/index.hb">&nbsp;</a></div>
            <div class="col-8 mcol-0">&nbsp;</div>
            <%if(result == null || !result){ %>
            <div class="col-1 mcol-0" id="login">
                <a href="#">로그인</a>
            </div>
            <% }else{%>
            <div class="col-1 mcol-0" id="logout">
                <a href="<%=path %>/logout.hb">로그아웃</a>
            </div>
            <%}%>
        </div>
        <div class="row">
            <!--            상위메뉴-->
            <div class="col-12 mcol-0" id="menu1">
                <table>
                    <tr>
                        <td><a href="#">한빛소개</a></td>
                        <td><a href="#">교육과정</a></td>
                        <td><a href="#">취업지원</a></td>
                        <td><a href="#">수강생</a></td>
                        <td><a href="#">직원</a></td>
                        <td><a href="#">고객센터</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12" id="menu2">
                <%@ include file="temple/menulink.jspf" %> 
            </div>
        </div>

        <!-- 슬라이더 -->
        <div class="row">
            <div class="col-12 mcol-12" id="slider">
                <div class="slideshow-container">
                    <div class="mySlides fade">
                        <div class="numbertext">1 / 3</div>
                        <img src="imgs/main/bg1.jpg" style="width:100%;height:400px;">
                        <div>
                            <h1 class="tlt">
                                <ul class="texts" style="display: none">
                                    <li>한빛교육센터</li>
                                    <li>홍대점에 방문해주셔서</li>
                                </ul>
                            </h1>
                            <h2 class="tlt2">
                                <ul class="texts">
                                    <li>홍대점 입니다</li>
                                    <li>진심으로 환영합니다!</li>
                                </ul>
                            </h2>
                        </div>
                    </div>
                    <div class="mySlides fade">
                        <div class="numbertext">2 / 3</div>
                        <img src="imgs/main/bg2.jpg" style="width:100%;height:400px;">
                        <div>
                            <h1 class="tlt3">
                                <ul class="texts" style="display: none">
                                    <li>실무중심교육, 높은 취업률!</li>
                                    <li>초보자, 비전공자도 최고의 전문가로!</li>
                                    <li>차별화된 취업지원 시스템!</li>
                                </ul>
                            </h1>
                        </div>
                    </div>
                    <div class="mySlides fade">
                        <div class="numbertext">3 / 3</div>
                        <img src="imgs/main/bg3.jpg" style="width:100%;height:400px;">
                        <div>
                            <h1 class="tlt4">
                                <ul class="texts" style="display: none">
                                    <li>정부기관으로부터</li>
                                    <li>고용노동부 기관평가 3년인증기관[최고등급](2016년)</li>

                                </ul>
                            </h1>
                            <h1 class="tlt5">
                                <ul class="texts">
                                    <li>교육과정 및 운영의 우수 훈련기관 선정!</li>
                                    <li>국가전략산업직종훈련 정보통신분야 우수훈련기관선정(2014년)</li>
                                </ul>
                            </h1>
                        </div>
                    </div>
                    
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <br>
            </div>
        </div>
        <!-- 슬라이더 -->
        <!--       content-->
        <div class="row" id="proc">
            <center>
                <div class="col-12 mcol-12" id="proc_name"><img src="imgs/main/process.png" alt="">
                </div>
            </center>
            <div class="col-3"></div>
            <div class="col-2">
                <center>
                    <a href="#"><img src="imgs/main/Java_3.png"></a>
                    <div>JavaPrograming</div>
                    <div>great awesome java lecture</div>

                </center>
            </div>
            <div class="col-2">
                <center>
                    <a href="#"><img src="imgs/main/Web_3.png"></a>
                    <div>Web</div>
                    <div>super awesome WEB</div>
                </center>
            </div>
            <div class="col-2">
                <center>
                    <a href="#"><img src="imgs/main/DB_3.png"></a>
                    <div>DB</div>
                    <div>hey jude don't make it bad</div>
                </center>
            </div>
        </div>
        <div class="row" id="review">
           <div class="col-3 mcol-12">
                <a href="#"><img src="imgs/main/job3-1.jpg" alt=""></a>
            </div>
            <div class="col-3 mcol-12">
                <a href="#"><img src="imgs/main/job1-1.jpg" alt=""></a>
            </div>
            <div class="col-3 mcol-12">
                <a href="#"><img src="imgs/main/job2-1.jpg" alt=""></a>
            </div>
            
        </div>

        <div class="row" id="under">

            <div class="col-2 mcol-12">
                &nbsp;
            </div>
            <div class="col-4 mcol-12" id="notice">
                <img src="imgs/main/gongG.png" alt="">
                <div>
                    <ul class="notices">
               		<% for(int i = 0 ; i < nlist.size();i++) {
               			if(i<5){
               				NoticeDto nbean = nlist.get(i);%>               		
               				<li><a href="/zxy/customer/custom_info.hb"><%= nbean.getNSub() %></a></li>	
               			<%}else{
               				break;
               			}
                    } %>
                    </ul>
                </div>
            </div>
            <div class="col-4 mcol-12" id="question">
                <div><img src="imgs/main/question.png" alt=""></div>

                <div>
                    <a><img src="imgs/main/kakaotalkdirect.png" alt=""></a>
                </div>

                <div>
                    <a href="#"><img src="imgs/main/facebookdirect.png" alt=""></a>
                </div>

            </div>
            <div class="col-2">

            </div>

        </div>
        <div class="row footer">
            <div class="col-2 mcol-0">
                &nbsp;    &nbsp;    &nbsp;
            </div>
            <div class="col-2 mcol-3" id="foot_logo">
                <img src="imgs/logo6.png">
            </div>
            <div class="col-6 mcol-0" id="copy">
                (주)한빛이엔아이 ｜ 사업자등록번호 : 220-85-43667 ｜ 통신판매신고 : 마포 제 0358호<br/> 한빛ENI : 02-707-1480 / (121-854) 서울시 마포구 신수동 63-14 구프라자 3층 / 대표이사 : 염기호<br/> 개인정보보호관리책임자 : 허윤<br/> Copyright (c) 2015 한빛교육센터 All rights reserved.
            </div>
            <div class="col-2 mcol-0">
                &nbsp;
            </div>
        </div>
    </div>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            //            
       
        }
    </script>
    <script src="js/jquery.fittext/jquery.lettering.js" type="text/javascript"></script>
    <script src="js/jquery.fittext/jquery.textillate.js" type="text/javascript"></script>
    <script src="js/jquery.fittext/jquery.fittext.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(document).ready(function() {
            $('.tlt').textillate({ in: {
                    effect: 'fadeInLeftBig',
                    delayScale: 1,
                    delay: 50,
                    sync: true,
                    shuffle: true
                },
                out: {
                    effect: 'fadeOutRightBig',
                    shuffle: true,
                    sync: true
                },
                loop: true
            });

            $('.tlt2').textillate({ in: {
                    effect: 'fadeInRightBig',
                    delayScale: 1,
                    delay: 50,
                    sync: true,
                    shuffle: true
                },
                out: {
                    effect: 'fadeOutLeftBig',
                    shuffle: true,
                    sync: true
                },
                loop: true
            });

            $('.tlt3').textillate({ in: {
                    effect: 'bounce',
                    delay: 50,
                    sync: false,
                    shuffle: false,
                    sequence: true
                },
                out: {
                    effect: 'fadeOut',
                    sync: true
                },
                loop: true
            });
            $('.tlt4').textillate({ in: {
                    effect: 'fadeInLeftBig',
                    delayScale: 1,
                    delay: 50,
                    sync: true,
                    shuffle: true
                },
                out: {
                    effect: 'fadeOutRightBig',
                    shuffle: false,
                    sync: true
                },
                loop: true
            });
            $('.tlt5').textillate({ in: {
                    effect: 'fadeInRightBig',
                    delayScale: 1,
                    delay: 50,
                    sync: true,
                    shuffle: false
                },
                out: {
                    effect: 'fadeOutLeftBig',
                    shuffle: false,
                    sync: true
                },
                loop: true
            });
        });
      
    </script>
</body>

</html>


