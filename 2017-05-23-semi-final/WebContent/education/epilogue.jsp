<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.ep_header{
		background-image:url("../imgs/ep_header.png");
		background-repeat: no-repeat;
		background-size: 100% 100%;
	}
	.ep_mid{
		background-image:url("../imgs/ep_mid.png");
		background-repeat: no-repeat;
		background-size: 100% 100%;
		margin-left: 10px;
	}
	.ep_footer{
		background-image:url("../imgs/ep_footer.png");
		background-repeat: no-repeat;
		background-size: 100% 100%;
		margin-left: 10px;
	}
	#line{
		width:100%;
		height: 3px;
		background-color: rgb(52, 78, 227);
	}
	#eptext{
		width: 60%;
		height: 20px;
		margin-right: 15px;
		padding: 16px 13px;
		color: #263238; 
		border: 1px solid #d9d9d9;
		background: transparent;
		border-radius: 5px;
	}
	#epsend{
		width: 30%;
		border-radius: 5px;
		cursor: pointer;
		background-color: #263238;
		color: #ffffff;
	}
</style>
</head>
<body>
	<!-- content2 start -->
	<div class="content col-7 mcol-9 smenu2-cont">
		<div id="title-left">Epilogue</div>
		<div id="title-right"></div>
		<div class="ep_inst">
		<form>
		<input type="text" name="epils" id="eptext"/>
		<button type="submit" value="후기 등록" id="epsend"></button>
		</form>
		</div>
		<hr id="line">
		<div class="ep_cont">
			
			<div class="ep_header">&nbsp;</div>
			<div class="ep_mid">&nbsp;</div>
			<div class="ep_footer">&nbsp;</div>		
		</div>
	</div>
	<!-- content2 end -->
</body>
</html>