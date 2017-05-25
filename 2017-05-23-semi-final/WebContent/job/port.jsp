<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/mygrid.css">
<link rel="stylesheet" type="text/css" href="../css/contentsTitle.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<style>
		
        
        #jobcondition {
            
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            margin: 0px auto;
            width: 80%;
        }
        
        #jobcondition>tbody>tr {
            text-align: left;
           
        }
        
        #jobcondition>tbody>tr>td {
            border-top: 1px solid rgb(194, 194, 194);
            border-bottom: 1px solid rgb(194, 194, 194);
             min-width: 100px;
        }
        
        #pageindex>a {
            margin-left: 10px;
            text-decoration: none;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script>
        $(document).ready(function() {
            var seenum = 4;
            $("#jobcondition>tbody>tr").each(function(idx) {
                if (idx > seenum) {
                    $(this).css("display", "none");
                }
            })


            var pagecnt = 0;
            if ((($("#jobcondition>tbody>tr").length - 1) / 4) > 0) {
                if (($("#jobcondition>tbody>tr").length - 1) % 4 == 0) {
                    pagecnt = ($("#jobcondition>tbody>tr").length - 1) / 4;
                } else {
                    pagecnt = ($("#jobcondition>tbody>tr").length - 1) / 4;
                    pagecnt = pagecnt + 1;
                }
            }
            var pagenums = "";
            for (var i = 1; i <= pagecnt; i++) {
                pagenums += "<a href='#' onclick='movepage(" + i + ")'>" + i + "</a>";
                $("#pageindex").html(pagenums);
            }


        })

        function movepage(a) {
            $("#jobcondition>tbody>tr").each(function(idx) {
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
</head>
<body>
	<%@ include file="../temple/menu.jspf" %>
	<div class="container">
        <div class="row">
        <div class="col-3 mcol-0"></div>
            <div class="col-9 mcol-12">

                <div id="title-left">취업현황</div>
                <div id="title-right"></div>
                <div id="line"><img src="imgs/bar.jpg" alt=""></div>
                <div>
                    <table id="jobcondition" cellspacing="0">
                        <tr>
                            <th>번호</th>
                            <th>이름</th>
                            <th>수료과정</th>
                            <th>취업</th>
                            <th>분야</th>
                        </tr>
                        <tr>
                            <td>05</td>
                            <td>김☆중 </td>
                            <td>ui/ux ㄴㅁㅇㅁㄴㅇㅁㄴㅇ</td>
                            <td>google</td>
                            <td>웹</td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td>성◎완</td>
                            <td>java기반</td>
                            <td>롟데칠성음료</td>
                            <td>2017-5-8</td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td>윤☆성</td>
                            <td>ui/ux ㄴㅁㅇㅁㄴㅇㅁㄴㅇ</td>
                            <td>네이버웹툰</td>
                            <td>2017-5-8</td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td>육☆재</td>
                            <td>web blacssd</td>
                            <td>좋은곳</td>
                            <td>2017-5-3</td>
                        </tr>
                        <tr>
                            <td>01</td>
                            <td>지☆완</td>
                            <td>web blacssd</td>
                            <td>제일 좋은 기업</td>
                            <td>2017-5-1</td>
                        </tr>
                        <tr>
                            <td>05</td>
                            <td>김☆중 </td>
                            <td>ui/ux ㄴㅁㅇㅁㄴㅇㅁㄴㅇ</td>
                            <td>google</td>
                            <td>2017-5-10</td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td>성◎완</td>
                            <td>java기반</td>
                            <td>롟데칠성음료</td>
                            <td>2017-5-8</td>
                        </tr>

                    </table>
                </div>
                <center>
                    <div id="pageindex">sadas</div>
                </center>
            </div>
        </div>
    </div>
</body>
</html>