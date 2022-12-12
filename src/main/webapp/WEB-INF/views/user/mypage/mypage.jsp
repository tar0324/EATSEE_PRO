<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> </title>

</head>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">

</script>
<style>
.wrap {
    width: 100%;
    min-width: 1180px;
    overflow: hidden;
}
#my10x10WrapV15 .container {

    /* background: #FFC079 url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_pattern_beige.png) repeat 0 0; */
}

html, body, blockquote, caption, dd, div, dl, dt, fieldset, form, frame, h1, h2, h3, h4, h5, h6, hr, iframe, input, legend, li, object, ol, p, pre, q, select, table, textarea, tr, td, ul, button {
    margin: 0;
    padding: 0;
}

body, h1, h2, h3, h4 {
    font-size: 12px;
    font-family: 'Core Sans C','Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움',sans-serif;
    line-height: 1.6;
    color: #555;
}

 #my10x10WrapV15 #contentWrap {
    width: 100%;
    padding-top: 40px;
    /* background: url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_pattern_mint.png) repeat-x 0 0; */
}

#contentWrap {
    padding: 30px 0 80px 0;
}

#contentWrap {
    width: 1140px;
    margin: 0 auto;
    padding: 30px 0 75px 0;
    z-index: 40;
}

.my10x10V15 {
    width: 850px;
    margin: 0 auto;
}

.my10x10V15 h2 {
    line-height: 16px;
}

a:link, a:active, a:visited {
    color: #555;
}

.my10x10MainV15 {
    overflow: hidden;
    margin-top: 4px;
}

.lnbMy10x10V15 {
    float: left;
    width: 212px;
}

.my10x10MainV15 .lnbMy10x10V15 .article:first-child {
    margin-top: 20px;
}

.lnbMy10x10V15 .profile {
    padding-top: 29px;
    background-color: #fff;
    text-align: center;
}

.lnbMy10x10V15 .profile .hello {
    color: #000;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.25em;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.lnbMy10x10V15 .article .nodata {
    margin-top: 28px;
}

.my10x10MainV15 .nodata {
    text-align: center;
}

.lnbMy10x10V15 .profile ul {
    margin-top: 24px;
    border-top: 1px dotted #ccdbe1;
    margin-left: -1px;
}

.lnbMy10x10V15 .profile ul li {
    float: left;
    width: 50%;
    border-bottom: 1px solid #f4eade;
}

.lnbMy10x10V15 .profile ul li a:hover {
    text-decoration: none;
}

.lnbMy10x10V15 .profile ul li a strong {
    display: block;
    color: #000;
}

.lnbMy10x10V15 .profile ul li a strong:hover {
    text-decoration: none;
    color:#F7570B;
}


a:link, a:active, a:visited {
    color: #555;
    text-decoration: none;
}

ol, ul {
    list-style: none;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.lnbMy10x10V15 .profile ul li a {
    display: block;
    padding: 13px 0;
    border-left: 1px solid #f4eade;
    background-color: #f9f9f9;
    color: #555;
    font-size: 13px;
}

.lnbMy10x10V15 .profile ul:after {
    clear: both;
    display: block;
    content: '';
}

.lnbMy10x10V15 .article {
    margin-top: 20px;
}

.lnbMy10x10V15 .quick {
    background-color: #fff;
}

.lnbMy10x10V15 .heading {
    display: block;
    overflow: hidden;
    position: relative;
    width: 212px;
    height: 38px;
    color: #fff;
    font-size: 11px;
    line-height: 38px;
    text-align: center;
}

strong {
    font-weight: bold;
}

.lnbMy10x10V15 .quick .heading span {
    background-position: -112px -36px;
}

.lnbMy10x10V15 .heading span {
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #555;
    background-image: url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_sprite.png);
    background-repeat: no-repeat;
}

.lnbMy10x10V15 .quick ul {
    padding: 14px 20px 20px;
}

.lnbMy10x10V15 .quick ul li {
    margin-top: 12px;
    font-size: 13px;
    line-height: 1.25em;
}

.lnbMy10x10V15 .quick ul li a {
    color: #555;
}

.my10x10MainV15 .section2 {
    width: 598px;
    margin-left: 20px;
}

.my10x10MainV15 .section {
    float: left;
}

.my10x10MainV15 .section2 .article {
    position: relative;
    padding-top: 16px;
    border-top: 2px solid #555;
}
.my10x10MainV15 .section .article {
    margin-top: 20px;
    background-color: #fff;
}
.my10x10MainV15 .orderV15 {
    min-height: 212px;
}

.my10x10MainV15 .section h3 {
    padding: 0 10px;
}
.my10x10MainV15 h3 {
    color: #000;
    font-size: 14px;
    line-height: 1.25em;
}

.my10x10MainV15 .orderV15 .nodata {
    margin-top: 27px;
}
.my10x10MainV15 .nodata {
    text-align: center;
}

.my10x10MainV15 .nodata img {
    vertical-align: top;
}

fieldset, img {
    border: 0;
}

.my10x10MainV15 .wishV15 {
    min-height: 232px;
}

.my10x10MainV15 .wishV15 h3 {
    padding-left: 28px;
    background: url(http://fiximage.10x10.co.kr/web2013/my10x10/blt_wish.gif) no-repeat 10px 3px;
}

.my10x10MainV15 .wishV15 .nodata {
    margin-top: 30px;
}


/* 위시 있을 때 */
.my10x10MainV15 .wishV15 .pdtList {
    padding-bottom: 20px;
}

.my10x10MainV15 .pdtList {
    overflow: hidden;
    margin-top: 26px;
    padding-left: 13px;
}

.my10x10MainV15 .pdtList li {
    float: left;
    position: relative;
    /* width: 142px; */
    background: none;
}

.my10x10MainV15 .pdtList li .figure {
    display: block;
    width: 106px;
    padding: 0 18px;
    border-left: 1px dotted #ddd;
    width: 106px;
    height: 106px;
    overflow: hidden;
    display: flex;
    align-items: center;
}

.my10x10MainV15 .section2 .article .more {
    position: absolute;
    top: 15px;
    right: 10px;
    color: #777;
    font-size: 11px;
    font-weight: normal;
}

/* 상품후기 */
.my10x10MainV15 .reviewV15 {
    float: left;
    width: 290px;
    min-height: 178px;
}
.my10x10MainV15 .reviewV15 .nodata {
    margin-top: 47px;
}

.my10x10MainV15 .latelyV15 {
    float: right;
    width: 288px;
    min-height: 232px;
}

.my10x10MainV15 .latelyV15 .nodata {
    margin-top: 47px;
}

/* 카드 */
/*css 초기화*/

.card {
	height: 200px;
	width: 250px;
	border-radius: 15px;
	display: inline-block;
	/* margin-top: 30px; */
	margin-left: 20px;
	/* margin-bottom: 30px; */
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	overflow: hidden;
}



.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
	width: 100%;
	height: 120px;
	border-radius: 15px 15px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;	

}

.card:hover .card-header  {
	opacity: 0.8;
	height: 50px;
}

.card-header-is_closed{
	width:30px;
	height:30px;
	background-color:#FD9F28;
    /* background-color: #EF5A31 ; */
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    /* margin: 15px 15px 0 0; */
    border-radius: 50%;
    font-weight: bold;
    padding: 5px 5px;
    line-height: 20px;
}

h1 {
    font-size: 22px;
    font-weight: bold;
}

.card-body {
	padding:5px;
}

.card-body-header{
	line-height: 25px;
	margin: 10px 20px 0px 20px;

}
.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
    overflow: hidden;
	height: 180px;
	margin: 5px 20px;
}
.card:hover .card-body-description {
    opacity: 1;
    -webkit-transition: .5s ease-in-out;
    -moz-transition: .5s ease-in-out;
    -ms-transition: .5s ease-in-out;
    -o-transition: .5s ease-in-out;
    transition : .5s ease-in-out;
    overflow: scroll;
}


.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
  	position: absolute; 
  	margin-top: 15px;
  	margin-bottom: 6px;
    bottom: 0; 
    width: 314px;
    font-size: 14px;
    color: #9FA5A8;
    padding: 0 15px;
}

.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}

.icon-view_count {
    width: 25px;
    height: 17px;
	background: url("images/eye.jpg") no-repeat;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
    height: 17px;
	background: url("images/comment.jpg") no-repeat;	
}
.reg_date {
	float: right;
}
</style>
<body>
<div id ="my10x10WrapV15" class="wrap">
	<div class="container">
		<div id="contentWrap">
			<div class="my10x10V15">
<%-- 				<h2>
					<img src="${contextPath }/image/mk/my.png" alt="MY EATSEE" width="120px" style="margin-left: 40px;">
				</h2> --%>

				<div class="my10x10MainV15">
					<!-- for dev msg : my10x10 menu -->
					<div id="lnbMy10x10V15" class="lnbMy10x10V15">
						<!---->
						<div class="article profile new_pro21">
							<h2>
								<img src="${contextPath }/image/mk/my.png" alt="MY EATSEE" width="120px" class="hello">
							</h2>
							<p class="hello">Hello, <span style="color:#FD9F28">${member.user_nick }</span> </p>
						

						<!-- my badge-->

						<div class="nodata" style="display: none;">
							<span></span>
						</div>


						<ul>
							<li><a href="#" title="예약"><strong>0건</strong>예약</a></li>
							<li class="mymileage"><a href="#"
								title="#"><strong>${wishSum}건</strong>찜한가게</a><span
								id="mileageCreditAvailable"></span></li>
							<li><a href="#" title="내리뷰"><strong>0건</strong>리뷰</a></li>
							<li><a href="#" title="플레이리스트"><strong>0건</strong>플레이리스트</a></li>
						</ul>
					</div>



					<div class="article nav15">
						<div class="quick">
							<strong class="heading"><span></span>QUICK MENU</strong>
							<ul>
								<li>
									<a href="/my10x10/qna/myqnalist.asp" title="1:1 상담">1:1 상담</a>
								</li>
								<li>
									<a href="/my10x10/userinfo/confirmuser.asp" title="개인정보 수정">개인정보 수정</a>
								</li>
								<!-- <li><a href="/my10x10/myeventmaster.asp" title="이벤트 당첨안내">당첨안내</a></li>
								<li><a href="/my10x10/order/order_return_detail.asp"
									title="반품/환불">반품/환불</a></li>
								<li><a href="/my10x10/order/order_myItemList.asp"
									title="내가 구매한 상품 보기">내가 구매한 상품 <span class="icoNew"><img
											src="http://fiximage.10x10.co.kr/web2013/common/ico_new2.gif"
											alt="New"></span></a></li> -->


							</ul>
						</div>


					</div>
				</div>

				<div class="section section2">
					<!-- order list -->
					<div class="article orderV15">
						<h3>최근 주문내역</h3>

						<div class="nodata">
							<p>
								<img
									src="http://fiximage.10x10.co.kr/web2015/my10x10/txt_no_data_order.png"
									alt="최근 주문 상품이 없습니다">
							</p>
						</div>

					</div>
					<!-- // order list -->

					<!--my wish-->
					<div class="article wishV15">
						<h3>MY WISH</h3>
						<div class="detail">
								<ul class="pdtList">
								<c:forEach var="wishList" items="${wishList }" varStatus="wishNum" end="1">
									<li>
									<a href=""> <!-- 클릭 시 링크 설정 -->
												<div class="card">
													<!-- 카드 헤더 -->
													<div class="card-header" style="background-image: url(${contextPath}/store/download.do?seller_id=${wishList.seller_id}&imageFileName=${wishList.image_fileName});">
														<div class="card-header-is_closed">
															<c:if test="${wishList.category_code eq 10 }">
										    					<div class="card-header-text">먹</div>
										    				</c:if>
										    				<c:if test="${wishList.category_code eq 20 }">
										    					<div class="card-header-text">볼</div>
										    				</c:if>
														</div>
													</div>
													<!--  카드 바디 -->
													<div class="card-body">
														<!--  카드 바디 헤더 -->
														<div class="card-body-header">
															<h6>${wishList.seller_name}</h6>
															<p class=""><span class="badge bg-warning text-dark">${wishList.keyword }</span></p>
															<!-- <p class="card-body-nickname">작성자: ENDORPHIN0710</p> -->
														</div>
														<p class="card-body-description" style="overflow: hidden">${wishList.seller_addr} ${wishList.seller_detailaddr}</p>
														<!--  카드 바디 본문 -->
														<!--  카드 바디 푸터 -->
														<!-- <div class="card-body-footer">
															<hr
																style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
															<i class="icon icon-view_count"></i>조회 38회 <i
																class="icon icon-comments_count"></i>댓글 4개 <i
																class="reg_date"> 2018/04/12 </i>
														</div> -->
													</div>
												</div>
										</a>
									</li>
								</c:forEach>
									<!-- <li>
										<a href="/shopping/category_prd.asp?itemid=4939220" title="상품 페이지로 이동" class="figure"><img src="http://thumbnail.10x10.co.kr/webimage/image/list120/493/C004939220-1.jpg?cmd=thumb&amp;w=106&amp;h=106&amp;fit=true&amp;ws=false" width="106" height="106" alt="[텐텐단독] 블랙캣 시퀀스 다이어리"></a>
										<span class="pdtBrand"><a href="/street/street_brand.asp?makerid=artholic1" title="브랜드로 이동">Be on D</a></span>
										<span class="pdtName"><a href="/shopping/category_prd.asp?itemid=4939220">[텐텐단독] 블랙캣 시퀀스 다이어리</a></span>
										<span class="pdtStTag">
											<img src="http://fiximage.10x10.co.kr/web2013/shopping/tag_sale.gif" alt="SALE"> <img src="http://fiximage.10x10.co.kr/web2013/shopping/tag_coupon.gif" alt="쿠폰"> 
										</span>
									</li> -->
								
								</ul>
								<a href="/my10x10/mywishlist.asp" class="more" title="MY WISH 더보기"><span>more</span> &gt;</a>
							</div>

<!--위시가 없을 때  -->
<!-- 						<div class="nodata">
							<p>
								<img
									src="http://fiximage.10x10.co.kr/web2015/my10x10/txt_no_data_wish.png"
									alt="등록된 위시가 없습니다">
							</p>
						
						</div> -->

					</div>
					<!--// my wish-->

					<!-- postscript -->
					<div class="article reviewV15">
						<h3>상품후기</h3>

						<div class="nodata">
							<p>
								<img
									src="http://fiximage.10x10.co.kr/web2015/my10x10/txt_no_data_review.png"
									alt="작성할 상품후기가 없습니다">
							</p>
						
						</div>

					</div>
					<!-- // postscript -->

					<!-- today product -->
					<div class="article latelyV15">
						<h3>최근 본 상품</h3>

						<div class="nodata">
							<p>
								<img
									src="http://fiximage.10x10.co.kr/web2015/my10x10/txt_no_data_lately.png"
									alt="최근 본 상품이 없습니다.">
							</p>
						</div>

					</div>
					<!-- // today product -->
				</div>

				
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>