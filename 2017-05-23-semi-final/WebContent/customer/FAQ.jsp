<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="../css/mygrid.css">
    <link rel="stylesheet" type="text/css" href="../css/contentsTitle.css">
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
        #f_first{
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

    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>

</head>

<body>
<div class="container">
        <div class="row col-9">
            <div id="title-left">FAQ</div>
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
                        <li class="faq_li" id="faq_first_a1">
                            <p class="faq_q"><a href="#faq_first_a1">Q : 수강신청은 어떻게 하나요?</a></p>
                            <p class="faq_a">A : [온라인]교육과정>개강과정안내 게시판에서 원하는 과목을 선택한 후 수강신청 버튼을 눌러 신청하실 수 있습니다. <br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;[오프라인] 방문 상담 후 수강신청이 가능합니다.</p>
                        </li>
                        <li class="faq_li" id="faq_first_a2">
                            <p class="faq_q"><a href="#faq_first_a2">Q : 수강신청은 아무때나 가능 한가요?</a></p>
                            <p class="faq_a">A : 매달 1일부터 강의가 시작하므로 미리 수강가능 여부를 확인 하신 후에 신청하실 수 있습니다.</p>
                        </li>
                        <li class="faq_li" id="faq_first_a3">
                            <p class="faq_q"><a href="#faq_first_a3">Q : 한 수업당 정원은 어떻게 되나요?</a></p>
                            <p class="faq_a">A : 보통 20명 내외이며 과정별, 강의실 별로 차이가 있습니다.</p>
                        </li>
                        <li class="faq_li" id="faq_second_a1">
                            <p class="faq_q"><a href="#faq_second_a1">Q : 취업 연계는 어떤 방식으로 이루어 지나요?</a></p>
                            <p class="faq_a">A : 한빛교육센터는 여러 기업체와 협력을 맺고 있으며, 취업지원팀은 과정을 수료한 수강생을 대상으로하여 취업연계를 진행하고 있습니다.</p>
                        </li>
                        <li class="faq_li" id="faq_second_a2">
                            <p class="faq_q"><a href="#faq_second_a2">Q : 취업 분야는 어떻게 되나요?</a></p>
                            <p class="faq_a">A : JAVA 기반 웹 프로그래밍 개발자, 안드로이드 앱개발자, 웹/앱 서버 관리자 등이 있습니다.</p>
                        </li>
                        <li class="faq_li" id="faq_third_a1">
                            <p class="faq_q"><a href="#faq_third_a1">Q : 홈페이지의 게시판은 누구나 사용 가능한가요?</a></p>
                            <p class="faq_a">A : 한빛소개, 개강과정소개, 포트폴리오, FAQ를 제외한 나머지 게시판은 로그인 후 사용자에 따라 사용 가능합니다.</p>
                        </li>
                        <li class="faq_li" id="faq_third_a2">
                            <p class="faq_q"><a href="#faq_third_a2">Q : 회원가입은 어떻게 하나요?</a></p>
                            <p class="faq_a">A : 홈페이지 상단의 회원가입 버튼을 눌러 회원가입을 신청한 후 승인 절차를 통과해야 합니다.</p>
                        </li>
                        <li class="faq_li" id="faq_third_a3">
                            <p class="faq_q"><a href="#faq_third_a3">Q : LMS시스템은 어떤 것들이 있나요?</a></p>
                            <p class="faq_a">A : 수강생 개인의 출결관리, 취업지원 정보, 과제 및 시험 등이 있습니다.</p>
                        </li>
                    </ul>
                </div>
				
                <div id="faq_first">
                    <ul class="faq_ul">
                        <li class="faq_li" id="faq_first_a1">
                            <p class="faq_q"><a href="#faq_first_a1">Q : 수강신청은 어떻게 하나요?</a></p>
                            <p class="faq_a">A : [온라인]교육과정>개강과정안내 게시판에서 원하는 과목을 선택한 후 수강신청 버튼을 눌러 신청하실 수 있습니다. <br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;[오프라인] 방문 상담 후 수강신청이 가능합니다.</p>
                        </li>
                        <li class="faq_li" id="faq_first_a2">
                            <p class="faq_q"><a href="#faq_first_a2">Q : 수강신청은 아무때나 가능 한가요?</a></p>
                            <p class="faq_a">A : 매달 1일부터 강의가 시작하므로 미리 수강가능 여부를 확인 하신 후에 신청하실 수 있습니다.</p>
                        </li>
                        <li class="faq_li" id="faq_first_a3">
                            <p class="faq_q"><a href="#faq_first_a3">Q : 한 수업당 정원은 어떻게 되나요?</a></p>
                            <p class="faq_a">A : 보통 20명 내외이며 과정별, 강의실 별로 차이가 있습니다.</p>
                        </li>
                    </ul>
                </div>
                <div id="faq_second">
                    <ul class="faq_ul">
                        <li class="faq_li" id="faq_second_a1">
                            <p class="faq_q"><a href="#faq_second_a1">Q : 취업 연계는 어떤 방식으로 이루어 지나요?</a></p>
                            <p class="faq_a">A : 한빛교육센터는 여러 기업체와 협력을 맺고 있으며, 취업지원팀은 과정을 수료한 수강생을 대상으로하여 취업연계를 진행하고 있습니다.</p>
                        </li>
                        <li class="faq_li" id="faq_second_a2">
                            <p class="faq_q"><a href="#faq_second_a2">Q : 취업 분야는 어떻게 되나요?</a></p>
                            <p class="faq_a">A : JAVA 기반 웹 프로그래밍 개발자, 안드로이드 앱개발자, 웹/앱 서버 관리자 등이 있습니다.</p>
                        </li>
                    </ul>
                </div>
                <div id="faq_third">
                    <ul class="faq_ul">
                        <li class="faq_li" id="faq_third_a1">
                            <p class="faq_q"><a href="#faq_third_a1">Q : 홈페이지의 게시판은 누구나 사용 가능한가요?</a></p>
                            <p class="faq_a">A : 한빛소개, 개강과정소개, 포트폴리오, FAQ를 제외한 나머지 게시판은 로그인 후 사용자에 따라 사용 가능합니다.</p>
                        </li>
                        <li class="faq_li" id="faq_third_a2">
                            <p class="faq_q"><a href="#faq_third_a2">Q : 회원가입은 어떻게 하나요?</a></p>
                            <p class="faq_a">A : 홈페이지 상단의 회원가입 버튼을 눌러 회원가입을 신청한 후 승인 절차를 통과해야 합니다.</p>
                        </li>
                        <li class="faq_li" id="faq_third_a3">
                            <p class="faq_q"><a href="#faq_third_a3">Q : LMS시스템은 어떤 것들이 있나요?</a></p>
                            <p class="faq_a">A : 수강생 개인의 출결관리, 취업지원 정보, 과제 및 시험 등이 있습니다.</p>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>


    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
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

</body>

</html>