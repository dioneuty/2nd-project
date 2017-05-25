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

body{
	overflow-x:hidden; 
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

  		#findingbox1,
        #findingbox2 {
            position: absolute;
            display: inline-block;
            border: 1px solid #d9d9d9;
            width: 20%;
            min-height: 60px;
            color: #263238;
            text-align: center;
            cursor: pointer;
            font-size: 90%;
            border-radius:10px;
            line-height: 60px;
            background-color: #EBF7FF;
        }
        #findingbox1:hover,
        #findingbox2:hover {           
            border: 2px solid #263238;       
        }
        
        #find_input {
            margin-top: 15px;
            width: 99%;
            height: 40px;
            display: none;
        }
        
        #findid_send,
        #findpw_send,
        #find_send {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 80%;
            display: none;
            border-radius:10px;
        }
        
        #findingbox1 {
            left: 25%;
        }
        #findingbox2>div,
        #findingbox1>div {
            border: 1px solid #263238;
            margin: 15px auto;
            width: 80%;
            height: 40px;
            display: none;
            line-height: 40px;
            border-radius:10px;
        }
        #findingbox2>div:hover,
        #findingbox1>div:hover {
        	background-color: #263238;
        	color: #ffffff;
        }
        #namespan{
        	padding: 10px 20%;
        	font-size: 20px;
        	font-weight: bold;
        }
        #pwspan{
        	padding: 10px 20%;
        	font-size: 20px;
        	font-weight: bold;
        }
        #closed {
            float: right;
            padding-right: 15px;
            padding-top: 10px;
            display: none;
            font-size: 20px;
        }
        
        #close2 {
            float: right;
            padding-right: 15px;
            padding-top: 10px;
            display: none;
            font-size: 20px;
        }
        
        #findingbox2 {
            left: 50%;
        }
        .hid{
        	display: none;
        }
</style>


</head>

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
		<div class="row" style="position:relative;">


			<!-- menu start -->

			<div class="aside col-2 mcol-0">
				<img src="../imgs/student.png" alt="a" />
				<div class="menu">
					<p>계정 관리</p>
					<ul>
						<li><a href="#" class="tab smenu1 active">아이디 /패스워드 찾기 <span>→</span></a></li>
					</ul>
				</div>
				<div class="char1">
					<h1>교 육 문 의</h1>
				</div>
			</div>
			<!-- menu end -->

			<hr class="col-0" />
			<!-- content  -->


			<div class="content col-7 mcol-9 smenu1-cont">
				<div id="title-left">아이디 /비밀번호 찾기</div>
				<div id="title-right"></div>

				 <form action="findid.hb" id="idfind" ></form>
                 <form action="findpw.hb" id="passfind" ></form>
                <div id="findingbox1">
                    <span id="namespan"> 아이디 찾기 </span>
                    <span id="closed">x</span>

                    <div>E-mail로 찾기</div>
                    <input type="text" form="idfind" name="id_email" class="id_email" placeholder="E-mail로 찾기" id="find_input">

                    <div>휴대전화번호로 찾기</div>
                    <input type="text" form="idfind" name="id_phone" class="id_phone" placeholder="휴대전화번호로 찾기 (' - '하이픈 없이 입력)" id="find_input">

                    <button type="button" form="idfind" name="sending" id="findid_send">찾기</button>
                    <button type="submit" class="hid">sub</button>

                </div>
                <div id="findingbox2">
                    <span id="pwspan"> 패스워드 찾기</span>
                    <span id="close2">x</span>
                    <div>비밀번호 분실 ID</div>
                    <input type="text" form="passfind" name="pass_Id" class="pass_id" placeholder="ID를 입력해 주세요." id="find_input">
                    <button name="next" id="find_send">ID 확인</button>
                    <div>E-mail로 찾기</div>
                    <input type="text" form="passfind" name="pass_Email" class="pass_email" placeholder="E-mail로 찾기" id="find_input">

                    <div>휴대전화번호로 찾기</div>
                    <input type="text" form="passfind" name="pass_Phone" class="pass_phone" placeholder="휴대전화번호로 찾기 (' - '하이픈 없이 입력)" id="find_input">

                    <button type="button" form="passfind" name="sending" id="findpw_send">찾기</button>
                    <button type="submit" class="hid">sub</button>

                </div>
				</div>


			

			<!-- content end -->
			</div>
	</div>

		<script type="text/javascript">
		$(document).ready(function() {
            $(".container").fadeIn();
            $("#findingbox1,#findingbox2").addClass('nonspread');
            $("#findingbox1>div,#findingbox2>div").eq(0).css("margin-top", "30px");



            $("#findingbox1>#namespan").eq(0).click(function() {
                if ($("#findingbox1").hasClass('nonspread')) {
                    $("#findingbox2").fadeOut();
                    $("#findingbox1").animate({
                        width: '40%',
                        height: '300px'
                    });
                    $("button[name=sending]").fadeIn();
                    $("#closed").fadeIn();
                    $("#findingbox1>div").fadeIn();
                    $("#findingbox1").removeClass('nonspread');
                    $("#findingbox1").addClass('spread');
                }

            });
            $("#closed").click(function() {
                if ($("#findingbox1").hasClass('spread')) {

                    $("#findingbox1").animate({
                        height: '60px',
                        width: '20%'
                    });
                    $("button[name=sending]").hide();
                    $("#closed").css('display', 'none');
                    $("#findingbox1>div").fadeOut();
                    $("#findingbox2").fadeIn('slow');
                    $("input").hide();
                    $("#findingbox1").removeClass('spread');
                    $("#findingbox1").addClass('nonspread');
                }

            });

            $("#findingbox2>#pwspan").eq(0).click(function() {
                if ($("#findingbox2").hasClass('nonspread')) {
                    $("#findingbox1").fadeOut();
                    $("#findingbox2").animate({
                        left: '25%',
                        height: '300px',
                        width: '40%'
                    });

                    $("input[name=pass_Id]").prev().fadeIn();
                    $("input[name=pass_Id]").next().fadeIn();
                    $("#close2").fadeIn();
                    $("#findingbox2").removeClass('nonspread');
                    $("#findingbox2").addClass('spread');
                }
            });
            $("#close2").click(function() {
                if ($("#findingbox2").hasClass('spread')) {

                    $("#findingbox2").animate({
                        left: '50%',
                        height: '60px',
                        width: '20%'
                    })
                    $("#close2").css('display', 'none');
                    $("#close2").nextAll().hide();
                    $("button[name=sending]").hide();
                    $("#findingbox1").fadeIn('slow')
                    $("#findingbox2").removeClass('spread');
                    $("#findingbox2").addClass('nonspread');
                }
            });

            $("input[name=id_email],input[name=pass_Email]").prev().click(function() {
                $(this).hide();
                $(this).next().fadeIn();
            });

            $("input[name=id_phone],input[name=pass_Phone]").prev().click(function() {
                $(this).hide();
                $(this).next().fadeIn();
            });

            $("input[name=pass_Id]").prev().click(function() {
                $(this).hide();
                $(this).next().fadeIn();
            });
            $("button[name=next]").nextAll().hide();
            $("button[name=next]").click(function() {
                if ($(this).prev().val() == '') {

                    alert("채워주세요");
                    return false;
                }
                $(this).hide();
                $(this).prev().hide();
                $(this).prev().prev().hide();
                $("input[name=pass_Email]").prev().fadeIn();
                $("input[name=pass_Phone]").prev().fadeIn();
                $("button[name=sending]").fadeIn();
            });
			$('#find_send').click(function (){
				var passid = $('.pass_id').val();
				$.ajax({
			        // type을 설정합니다.
			        type : 'post',
			        url : "findid_check.hb",
			        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
			        data : {"passid" : passid},
			        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
			        success : function (data) {
			            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
			            console.log(data);
			            if (data > 0) {
			                alert("아이디가 확인 되었습니다.");               
			            } else {
			                alert("아이디가 존재하지 않습니다.");
			            }             
			        }
				});
			});
            $("#findid_send").click(function() {
            	var idemail = $('.id_email').val();
            	var idphone = $('.id_phone').val();
            	var message = "";
                if ($("input[name=id_email]").val() == '' && $("input[name=id_phone]").val() == '') {
                    alert("핸드폰 번호나 비밀번호 둘 중에 하나는 입력하셔야 됩니다.");
                    return false;
                }else{
                	$.ajax({
    			        // type을 설정합니다.
    			        type : 'post',
    			        url : "findid.hb",
    			        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
    			        data : {"idemail":idemail, "idphone":idphone},
    			        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
    			        success : function (data) {
    			            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
    			            message = data;
    			            if(message==""){
    			            	message = "전화번호나 이메일이 올바르지 않습니다.";
    			            }
    			            	alert(message);
    			        }
    				});
                }
            });
            $("#findpw_send").click(function() {
            	var passid = $('.pass_id').val();
            	var passemail = $('.pass_email').val();
            	var passphone = $('.pass_phone').val();
            	var message = "";
                if ($("input[name=pass_Email]").val() == '' && $("input[name=pass_Phone]").val() == '') {
                    alert("핸드폰 번호나 비밀번호 둘 중에 하나는 입력하셔야 됩니다.");
                    return false;
                }else{
                	$.ajax({
    			        // type을 설정합니다.
    			        type : 'post',
    			        url : "findpw.hb",
    			        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
    			        data : {"passid" : passid, "passemail":passemail, "passphone":passphone},
    			        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
    			        success : function (data) {
    			            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
    			            message = data;
    			            if(message==""){
    			            	message = "전화번호나 이메일이 올바르지 않습니다.";
    			            }
    			            	alert(message);
    			        }
    				});
                }
            });
        });

    </script>
		
		
		
		
		
		
		

</body>
</html>