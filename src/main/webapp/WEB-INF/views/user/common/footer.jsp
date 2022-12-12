<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
em {
    font-style: normal;
    font-weight: bold;
}
.footer-wrap {
    height: auto;
    min-height: 100%;
    min-width: 1140px;
    color: #000;
    font-size: 13px;
    font-weight: normal;
    border-top: 1px solid gray;
}

.footerV18 {
    /* position: relative;  */
    width: 940px;
    margin: 42px auto;
    padding-left: 200px;
    text-align: left;
}

.footerV18:after {
    visibility: hidden;
    display: block;
    clear: both;
    height: 0;
    content: '';
}

.footerV18 .logo {
    position: absolute;
    left: 0;
    top: 0;
    width: 140px;
    height: 27px;
    
    text-indent: -999em;
}

.footerV18 .company {
    width: 568px;
}
.footerV18 .foot-cont {
    float: left;
}
html, body, blockquote, caption, dd, div, dl, dt, fieldset, form, frame, h1, h2, h3, h4, h5, h6, hr, iframe, input, legend, li, object, ol, p, pre, q, select, table, textarea, tr, td, ul, button {
    margin: 0;
    padding: 0;
}

.footerV18 .company em {
    display: inline-block;
    padding-bottom: 16px;
    font-size: 16px;
}

.footerV18 .company p {
    line-height: 2;
}

.btn-linkV18.link2 {
    color: #666;
}
.footer-wrap a {
    color: #000;
}
a:link, a:active, a:visited {
    color: #555;
}
a:link, a:active, a:visited {
    color: #555;
}
.btn-linkV18 {
    font-size: 12px;
}
.lMar05 {
    margin-left: 5px;
}

.btn-linkV18.link2 span {
    background-position: -28px 0;
}
.btn-linkV18 span {
    position: relative;
    top: -2px;
    display: inline-block;
    width: 4px;
    height: 6px;
    background: url(//fiximage.10x10.co.kr/web2018/common/arrow_right.png?v=1.1) 0 0 no-repeat;
}

.goTopV18 {
    position: fixed;
    left: 50%;
    bottom: 60px;
    z-index: 999;
    width: 50px;
    height: 50px;
    margin-left: 620px;
    color: #666;
    font-size: 10px;
    line-height: 1.1;
    font-weight: normal;
    text-align: center;
    cursor: pointer;
    background-color: #eee;
    border-radius: 50%;
}

.goTopV18 .icoV18 {
    display: block;
    width: 8px;
    height: 7px;
    margin: 13px auto 6px;
    background-position: -236px 0;
}
.icoV18 {
    background-image: url(//fiximage.10x10.co.kr/web2018/common/sp_icon.png?v=1.21);
}
.icoV18, .arrow-top, .arrow-right, .arrow-bottom {
    display: inline-block;
    position: relative;
    vertical-align: middle;
    background-repeat: no-repeat;
    text-indent: -999em;
}

</style>
<script>

$(function() {
    $("#FOOTER_TOP_BTN").click(function() {   //버튼 클릭 이벤트
        $('html, body').animate({  //animation을 걸어서 화면 맨위로 이동하도록 설정
            scrollTop : 0
        }, 200);
        return false;
    });
});


</script>
<title>푸터 부분</title>
</head>
<body>
<div class="footer-wrap">
	<div class="footerV18">
		<%-- <span><img src="${contextPath }/image/mk/blacklogo.png" > </span> --%>
		<div class="foot-cont company">
			<em>먹고보자 :: EATSEE</em>
			<p>대표이사 : 송민경 / 대전광역시 서구 갈마로 </p>
			<p>사업자등록번호 : 000-00-00000 / 통신판매업 신고 : 제 00-0000호 <a href=""  class="btn-linkV18 link2 lMar05">사업자 정보확인 <span></span></a></p>
			<p>개인정보보호책임자 : 홍길동 / 소비자피해보상보험 SGI 서울보증 <a href="" class="btn-linkV18 link2 lMar05">서비스 가입 사실 확인 <span></span></a></p>
			<p class="tPad15">호스팅서비스:먹고보자 EATSEE</p>
			<p class="copyright">COPYRIGHT © EATSEE ALL RIGHTS RESERVED.</p>
		</div>
		<p class="goTopV18" id="FOOTER_TOP_BTN"><span class="icoV18" ></span>TOP</p>
	</div>
</div>



</body>
</html>