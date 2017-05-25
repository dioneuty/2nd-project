<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width = device-width, initial-scale=1.0"> 
    <link rel="stylesheet" type="text/css" href="../css/mygrid.css">
    <link rel="stylesheet" type="text/css" href="../css/contentsTitle.css">
    <style>
        
        
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

    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
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
	<%@ include file="../temple/menu.jspf" %> 
    <div class="container portfolio">
        <div class="row">
   			<div class="col-3"></div>
            <div class="col-9">
                <div id="title-left">Portfolio</div>
                <div id="title-right"></div>



                <div id="line"><img src="../imgs/right.jpg" alt=""></div>
                <div id="folio">
                    <div>
                        <a href="https://www.naver.com">
                            <div id="thumbnail"><img src="../imgs/thumbnailnaver.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailgoogle.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailinsta.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailnatuur.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailpoorchic.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailgentlemon.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailkimjang.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailporsche.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailsplant.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailccle.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailizm.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailpyun.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailgukh.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailmoon.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnaildmuse.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnaildarksoul.jpg" style="width:100%;height:230px" alt=""></div>
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
                            <div id="thumbnail"><img src="../imgs/thumbnailku.jpg" style="width:100%;height:230px" alt=""></div>
                        </a>
                        <div id="explain">
                            <ul>
                                <li>과정명 :UI/UX 웹프로그래밍 마스터 과정</li>
                                <li>이름:딩딩이</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="morebutton"> 더보기 +</div>
            </div>
        </div>
    </div>
</body>

</html>
