<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <title>한빛교육센터</title>

    <link href="../css/mygrid.css" rel="stylesheet" type="text/css" />

<meta name="viewport" content="width = device-width, initial-scale=1.0"> 
    <link rel="stylesheet" href="../hanbitsogae/css/reset.css">
    <!-- CSS reset -->
    <link rel="stylesheet" href="../hanbitsogae/css/style.css">
    <!-- Resource style -->
    <script src="../hanbitsogae/js/modernizr.js"></script>
    <!-- Modernizr -->




    <style type="text/css">
    #mlogo {
            background-image: url(../imgs/logo5.png);
            min-height: 78px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            height: 100px;
        }
        
        #login>a {
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
        
        #menu2>table {}
        
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
        
        #login {
            height: 100px;
        }
        
        #login>a {
            color: white;
        }
        
        #menu2 {
            background-color: white;
            height: 250px;
            position: absolute;
            width: 80%;
            display: none;
            z-index: 10;
        }
        /*학원소개용 css*/
    }
    /* 모바일 css*/
    #m_list>img {
        margin: 25px 80%;
    }
    #m_list_item {
        color: deepskyblue;
        top: 12%;
        position: absolute;
        left: 43.5%;
        display: none;
        width: 47%;
    }
    #m_list_item>* {
        background-color: deepskyblue;
    }
    #m_list_item>ul {
        margin: 0px auto;
        padding: 0px;
    }
    #m_list_item>ul>ul {
        list-style: none;
        margin: 0px auto;
        padding: 0px;
        padding-top: 7px;
        padding-bottom: 6px;
    }
    #m_list_item>ul>ul>a,
    #m_list_item>ul>ul>li>a {
        text-decoration: none;
        color: white;
    }
    #m_list_item>ul>ul>li {
        display: none;
        background-color: cornflowerblue;
    }
    body {
        background-color: white;
    }
    #mlogo {
        min-height: 100px;
    }
    #sogae>div>div>img {
        width: 100%;
    }
    @media screen and (min-width:1200px) {
        #fixedmenu {
            position: fixed;
            z-index: 999;
            right: 10%;
            width: 80%;
        }
        
        #mlogo {
            min-height: 100px;
        }
        /*학원소개용 css*/
        /*지도페이지 css*/
        
        #map {
            margin: 0px auto;
            margin-top: 270px;
        }
        
        #sogae {
            display: none;
        }
        
        #mlogo,
        #blank,
        #login,
        #menu1 {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        #menu2 {
            background-color: rgba(255, 255, 255, 0.9);
            width: 100%;
        }
        
        #mlogo {
            background-image: url(../imgs/logo6.png);
            min-height: 78px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            height: 100px;
        }
        
        #menu1>table>tbody>tr>td>a {
            color: white;
        }
        
        #menu1>table>tbody>tr>td:hover>a {
            color: black;
        }
        
        #blank {
            height: 100px;
        }
    }
    /*학원소개용 중간사이즈 미디어쿼리*/
    @media screen and (min-width:769px) and (max-width:1199px) {
        .cd-section {
            display: none;
        }
    }
    @media screen and (max-width:768px) {
        .cd-section {
            display: none;
        }
        
        #menu2 {
            z-index: -10;
            /*모바일에서 자꾸 가려져서 뒤로 보냄*/
            display: none;
        }
        
        #menu2>table {
            display: none;
        }
    }
    </style>



    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../js/jquery.bxslider/jquery.bxslider.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#menu1>table>tbody>tr>td").click(function() {
                $("#menu2").slideToggle();
            })


            var toggled = true;
            $("#m_list>img").on('click', function() {
                $("#m_list_item").slideToggle();
                if (!toggled) {
                    $(this).attr("src", "../imgs/list.png");
                    toggled = true;
                } else {
                    $(this).attr("src", "../imgs/next.png");
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



        })
    </script>


</head>
<!--none/scaleDown/rotate/gallery/catch/opacity/fixed/parallax. -->
<% Integer utypes = (Integer) session.getAttribute("utype");
if(utypes == null){
	utypes = 0;
}
%>
<body data-hijacking="on" data-animation="catch">

    <div class="container" id="fixedmenu">

        <div class="row mrow">

            <!--헤더 -->
            <!--            상위메뉴-->

            <div class="col-3 mcol-0" id="mlogo"></div>
            <div class="col-8 mcol-0" id="blank">&nbsp;</div>
            <div class="col-1 mcol-0" id="login">
                <a href="#">로그인</a>
            </div>
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
               <%@ include file="../temple/menulink.jspf"%>
            </div>
        </div>

        <!-- 여기는 모바일메뉴-->
        <div class="row">
            <div class="col-0 mcol-5" id="mlogo">a</div>
            <div class="col-0 mcol-5"></div>
            <div class="col-0 mcol-2" id="m_list">
                <img src="../imgs/list.png" />
            </div>

            <div class="col-0 mcol-12" id="m_list_item">
                 <%@ include file="../temple/mobilelink.jspf"%>
            </div>
        </div>
    </div>



    <section class="cd-section visible fir">
        <div style="background-image: url(../imgs/sogaeimg/second.jpg)">
            <h2>&nbsp;</h2>
        </div>
    </section>

    <section class="cd-section">
        <div style="background-image: url(../imgs/sogaeimg/first.jpg)">
            <h2>&nbsp;</h2>
        </div>
    </section>

    <section class="cd-section">
        <div style="background-image: url(../imgs/sogaeimg/meas.jpg)">
            <div id="map" style="width:900px;height:300px;background:yellow"> </div>
            <h2>&nbsp;</h2>
        </div>
    </section>



    <nav>
        <ul class="cd-vertical-nav">
            <li><a href="#0" class="cd-prev inactive">Next</a></li>
            <li><a href="#0" class="cd-next">Prev</a></li>
        </ul>
    </nav>

    <!-- 중간사이즈 content -->
    <div class="container" id="sogae">
        <div class="row mrow">
            
            <div class="col-12 mcol-12"><img src="../imgs/sogaeimg/second.jpg" alt="">
                <img src="../imgs/sogaeimg/first.jpg" alt="">
                <div id="map2" style="width:100%;height:300px;background:yellow">
                </div>
            </div>

        </div>


        <!-- .cd-vertical-nav -->
        <script src="../hanbitsogae/js/jquery-2.1.4.js"></script>
        <script src="../hanbitsogae/js/velocity.min.js"></script>
        <script src="../hanbitsogae/js/velocity.ui.min.js"></script>
        <script src="../hanbitsogae/js/main.js"></script>
        <!-- Resource jQuery -->
        <!--    container end-->



        <script>
            function myMap() {
               

                var hongdae = {
                    lat: 37.555351,
                    lng: 126.922308
                };
                 var map2 = new google.maps.Map(document.getElementById('map2'), {
                    zoom: 18,
                    center: hongdae
                });
               
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 18,
                    center: hongdae
                });

                var marker = new google.maps.Marker({
                    position: hongdae,
                    map: map
                });
                var marker = new google.maps.Marker({
                    position: hongdae,
                    map: map2
                });
                //            var map = new google.maps.Map(mapCanvas, mapOptions);
            }
        </script>

        <!-- GoogleMap -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZcOmpyGiBI9rRhnw75CokUtWKdcewqzA&callback=myMap"></script>
</body>

</html>
