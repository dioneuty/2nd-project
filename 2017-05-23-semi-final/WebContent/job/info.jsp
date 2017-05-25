<%@page import="com.hb.job.model.JobStateDto"%>
<%@page import="com.hb.job.model.JobInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width = device-width, initial-scale=1.0"> 
    <link rel="stylesheet" type="text/css" href="../css/mygrid.css" />
   	<link rel="stylesheet" type="text/css" href="../css/contentsTitle.css" />
   	<link href="../css/mygrid2.css" rel="stylesheet" type="text/css" /> <!-- content내의 submenu,subcontent 프레임  grid -->
	<link href="../css/std_info.css" rel="stylesheet" type="text/css" /> <!-- subcontent 내부 내용 css -->
	<link href="../css/board.css" rel="stylesheet" type="text/css" />
    <style>     
        
        #info {
            
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            margin: 0px auto;
            width: 80%;
        }
        
        #info>tbody>tr {
            text-align: left;
            
        }
        
        #info>tbody>tr>td {
          
            border-top: 1px solid rgb(194, 194, 194);
            min-width: 100px;
        }
        #pageindex>a{
            margin-left: 10px;
            text-decoration: none;
        }
        .container2 .aside * {
        	text-align: center;
        	font-family: "Hanna";
        }
        
         .container2 .aside img{
   				width:200px;
   	            padding: 10px auto;
                margin:10px 0px;
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
     #jobcondition {
           
            margin: 0px auto;
            width: 90%;
        }
  .board td:nth-child(2) {
	text-align: center;
}     
      .board td:nth-child(3) {
	text-align: left;
}  
        
        
        #pageindex>a {
            margin-left: 10px;
            text-decoration: none;
        }
        .ji_conts{
        	display: none;
        }
        .ji_conts:hover{
        	background-color: white;
        }
        #job_detail {
            margin: 0px auto;
            width: 100%;
        } 
        #job_detail>tbody>tr>td {
            height: 35px;
            border-radius: 5px;
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        	 
            var seenum = 4;
            $("#info>tbody>tr").each(function(idx) {
                if (idx > seenum) {
                    $(this).css("display", "none");
                }
            })
            var pagecnt = 0;
            if ((($("#info>tbody>tr").length - 1) / 4) > 0) {
                if (($("#info>tbody>tr").length - 1) % 4 == 0) {
                    pagecnt = ($("#info>tbody>tr").length - 1) / 4;
                } else {
                    pagecnt = ($("#info>tbody>tr").length - 1) / 4;
                    pagecnt = pagecnt + 1;
                }
            }
            var pagenums = "";
            for (var i = 1; i <= pagecnt; i++) {
                pagenums += "<a href='#' onclick='movepage(" + i + ")'>" + i + "</a>";
                $("#ipageindex").html(pagenums);
            }


        });

        function movepage(a) {
            $("#info>tbody>tr").each(function(idx) {
                var last = a * 4;
                var first = last - 3;
                if (idx > 0 && first <= idx && last >= idx) {
                    $(this).css("display", "table-row");
                } else if (idx == 0) {

                } else {
                    $(this).css("display", "none");
                }
            });
        }



    </script>
</head>

<body>
<%@ include file="../temple/menu.jspf" %>
    <div class="container2">
        <div class="row">
        <!-- menu start -->

				<div class="aside col-2 mcol-0">
					<img src="../imgs/job.png" alt="a" />
					<div class="menu">
						<p> 취업 지원</p>
						<ul>
							<li><a href="#" class="tab smenu1 active">취업현황 <span>→</span></a></li>
							<li><a href="#" class="tab smenu2">채용 정보 <span>→</span></a></li>
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
				
				<!-- content1 start -->
				<% ArrayList<JobStateDto> jslist = (ArrayList<JobStateDto>) request.getAttribute("jslist"); %>
				<div class="content col-7 mcol-9 smenu1-cont">

                <div id="title-left">취업현황</div>
                <div id="title-right"></div>
                <div id="line"><img src="../imgs/bar.jpg" alt=""></div>
                <div>
                    <table id="jobcondition" cellspacing="0" class="board">
                        <tr>
                            <th>번호</th>
                            <th>이름</th>
                            <th>수료과정</th>
                            <th>취업 업체명</th>
                            <th>분야</th>
                        </tr>
                        <% for(int i=0 ; i<jslist.size();i++) {
                        	JobStateDto jsbean = jslist.get(i);
                        %>
                        <tr>
                            <td><%= jsbean.getJnum() %></td>
                            <td><%= jsbean.getUname() %> </td>
                            <td><%= jsbean.getJsub() %></td>
                            <td><%= jsbean.getJcompany() %></td>
                            <td><%= jsbean.getJfield() %></td>
                        </tr>
                        <%} %>

                    </table>
                </div>
                <center>
                    <div id="ipageindex"></div>
                </center>
            </div>
            <!-- content1 end -->
            <!-- content2 start -->
			<% ArrayList<JobInfoDto> jilist = (ArrayList<JobInfoDto>) request.getAttribute("jilist"); %>
            <div class="content col-7 mcol-9 smenu2-cont">
                <div id="title-left">채용정보</div>
                <div id="title-right"></div>
                <div id="line"><img src="../imgs/bar.jpg" alt=""></div>
                 <table cellspacing="0" id="jinfo" class="board">
                    <tr class="jlists">
                        <th style="width:50px;">번호</th>
                        <th style="width:100px;">업체명</th>
                        <th style="width:50px;">모집 인원</th>
                        <th style="width:50px;">급여</th>
                        <th style="width:100px;">마감날짜</th>
                    </tr>
                    <%for(int i= 0; i<jilist.size();i++){ 
                    	JobInfoDto jibean = jilist.get(i);
                    %>
                    <tr>
                        <td><%= jibean.getJiNum()%></td>
                        <td><a href="#" class="hworks jinfo" id="<%=jibean.getJiNum()%>"><%= jibean.getJiComp() %></a></td>
                        <td><%= jibean.getJiRecruit() %></td>
                        <td><%= jibean.getJiPay() %></td>
                        <td><%= jibean.getJiEnddate() %></td>
                    </tr>
                    <tr class="ji_conts" id="ji_<%=jibean.getJiNum()%>">
						<td colspan="5">
							<div> 
					<table id="job_detail">
                    <tr>
                        <td style="width:20%;background-color:rgb(234,234,234);">글번호</td>
                        <td style="width:40%;"><%= jibean.getJiNum()%></td>
                        <td style="width:20%;background-color:rgb(234,234,234);">글쓴이</td>
                        <td style="width:40%;">관리자</td>
                    </tr>
                    <tr>
                        <td style="width:10%;background-color:rgb(234,234,234);">업체명</td>
                        <td style="width:40%;"><%= jibean.getJiComp()%></td>
                        <td style="width:10%;background-color:rgb(234,234,234);">지역</td>
                        <td style="width:40%;"><%= jibean.getJiArea()%></td>
                    </tr>
                    <tr>
                        <td style="width:10%;background-color:rgb(234,234,234);">모집인원</td>
                        <td style="width:40%;"><%= jibean.getJiRecruit()%></td>
                        <td style="width:10%;background-color:rgb(234,234,234);">고용형태</td>
                        <td style="width:40%;"><%= jibean.getJiType()%></td>
                    </tr>
                    <tr>
                        <td style="width:10%;background-color:rgb(234,234,234);">마감날짜</td>
                        <td style="width:40%;"><%= jibean.getJiEnddate()%></td>
                        <td style="width:10%;background-color:rgb(234,234,234);">급여</td>
                        <td style="width:40%;"><%= jibean.getJiPay()%></td>
                    </tr>
                    <tr>
                        <td style="width:10%;background-color:rgb(234,234,234);">연락처</td>
                        <td style="width:40%;"><%= jibean.getJiPhone()%></td>
                        <td style="width:10%;background-color:rgb(234,234,234);">작성일</td>
                        <td style="width:40%;"><%= jibean.getJiDate()%></td>
                    </tr>
                    <tr>
                        <td colspan="4" height="250px;" style="border:1px solid rgb(234,234,234);"> <%= jibean.getJiCont() %></td>
                    </tr>
                </table>
                </div>
						</td>
					</tr> 
                    <%} %>
                </table>
                <center>
                    <div id="pageindex"> </div>
                </center>
            </div>
            <script type="text/javascript">
					var view = 0;
					$('.jinfo').click(function(e) {
						var tid = $(this).attr('id');
						var clk = '#ji_' + tid;
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
            <script type="text/javascript">
        $(document).ready(function() {
            var seenum = 4;
            $("#jinfo>tbody>tr").each(function(idx) {
                if (idx > seenum) {
                    $(this).css("display", "none");
                }
            })
            var pagecnt = 0;
            if ((($(".jlists").length - 1) / 4) > 0) {
                if (($(".jlists").length - 1) % 4 == 0) {
                    pagecnt = ($(".jlists").length - 1) / 4;
                } else {
                    pagecnt = ($(".jlists").length - 1) / 4;
                    pagecnt = pagecnt + 1;
                }
            }
            var pagenums = "";
            for (var i = 1; i <= pagecnt; i++) {
                pagenums += "<a href='#' onclick='movepage(" + i + ")'>" + i + "</a> &nbsp;";
                $("#pageindex").html(pagenums);
            }


        })

        function movepage(a) {
            $("#jinfo>tbody>tr").each(function(idx) {
                var last = a * 4;
                var first = last - 3;
                if (idx > 0 && first <= idx && last >= idx) {
                    $(this).css("display", "table-row");
                } else if (idx == 0) {

                } else {
                    $(this).css("display", "none");
                }
            })
        }
    </script>
            <!-- content2 end  -->
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