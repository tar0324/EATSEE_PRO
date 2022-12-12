<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, java.io.*"
    isELIgnored="false"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<!--ajax -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<!--mk_css  -->
<link rel="stylesheet" href="${contextPath }/css/mk/login.css">



<script>
//아이디 비밀번호 focusin,focusout
$(function() {
    $(".input_text").on("focusin", function(event) { 
    	var id = $(this).attr('id');
    	if(id == "id"){
    		$("#id_line").addClass("focus").addClass("on");
    	} else if(id == "pw") {
    		$("#pw_line").addClass("focus").addClass("on");
    	}
    	
    })
    $(".input_text").on("focusout", function(event) { 
    	var id = $(this).attr('id');
    	if(id == "id"){
    		$("#id_line").removeClass("focus").removeClass("on");
    	} else if(id == "pw") {
    		$("#pw_line").removeClass("focus").removeClass("on");
    	}
    })
});

//넛지베너 닫기
function nudgeclose(){
	document.getElementById("nudge_tooltip").style.display = "none";
}


//탭메뉴 활성화
$(function() {
	 $(".menu_item").click(function() { 
	    	var id =  $(this).children('a').attr('id');
	    	if(id == "loinid"){
	    		//비활성화
	    		location.reload();
	    		$("#ones").removeClass("on");
	    		$("#ones").attr("aria-selected","false");
	    		document.getElementById("onescont").style.display = "none";
	    		document.getElementById("checkcont").style.display = "none";
	    		
	    		
	    		//활성화
	    		$("#loinid").addClass("on");
	    		$("#loinid").attr("aria-selected","true");
	    		document.getElementById("loinidcont").style.display = "block";
	    	} else if (id == "ones"){
	    		//비활성화
	    		$("#loinid").removeClass("on");
	    		$("#loinid").attr("aria-selected","false");
	    		document.getElementById("loinidcont").style.display = "none";
	    		document.getElementById("checkcont").style.display = "none";
	    		
	    		//활성화
	    		$("#ones").addClass("on");
	    		$("#ones").attr("aria-selected","true");
	    		document.getElementById("onescont").style.display = "block";
	    		
	    	} 
	    	
	    })

});

//input 박스 clear버튼 활성화 (로그인)
function inputclearbtn(id){
	if(id == "id") {
		document.getElementById("id_clear").style.display = "block";
	} else if(id == "pw") {
		document.getElementById("pw_clear").style.display = "block";
	}
	
}

//input clear버튼 클릭 시 input value 초기화 (로그인)
function inputclear(id){
	if(id == "id_clear") {
		document.getElementById("id").value ="" ;
		document.getElementById("id_clear").style.display = "none";
	} else if(id == "pw_clear") {
		document.getElementById("pw").value ="" ;
		document.getElementById("pw_clear").style.display = "none";
	}
}

//로그인 유효성 검사
function loginChk() {
	var form = document.frmNIDLogin;
	if(!form.user_id.value) {
		var sections  = document.querySelectorAll(".login_error_wrap");
		
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		document.getElementById("err_empty_id").style.display = "block";
		form.user_id.focus();
        return;
	}
	 if (!form.user_pwd.value) {
		 var sections  = document.querySelectorAll(".login_error_wrap");
			
			for(var i = 0; i < sections.length; i++){
				var item = sections.item(i);
				item.style.display = "none";
			}
		/* var section = document.querySelectorAll(".login_error_wrap").style.display = "none"; */
		document.getElementById("err_empty_pw").style.display = "block";
	    form.user_pwd.focus();
	    return;
	}
	    form.action =  "${contextPath}/user/login.do";
	    form.method="POST"
	    form.submit();
}




//비회원 예약 조회 focusin,focusout
$(function() {
    $(".input_row").on("focusin", function(event) { 
    	var id = $(this).attr('id');
    	if(id == "num_line1"){
    		$("#num_line1").addClass("focus").addClass("on");
    	} else if(id == "num_line") {
    		$("#num_line").addClass("focus").addClass("on");
    	}
    	
    })
    $(".input_row").on("focusout", function(event) { 
    	var id = $(this).attr('id');
    	if(id == "num_line"){
    		$("#num_line").removeClass("focus").removeClass("on");
    	}  else if(id == "num_line1") {
    		$("#num_line1").removeClass("focus").removeClass("on");
    	}
    })
});

//input 박스 clear버튼 활성화 (비회원 예약조회)
function inputclearbookbtn(id){
	if(id == "disposable1") {
		document.getElementById("name_clear").style.display = "block";
	} else if(id == "disposable") {
		document.getElementById("num_clear").style.display = "block";
	}
	
}

//input clear버튼 클릭 시 input value 초기화 (비회원 예약조회)
function inputbookclear(id){
	if(id == "name_clear") {
		document.getElementById("disposable1").value ="" ;
		document.getElementById("name_clear").style.display = "none";
	} else if(id == "num_clear") {
		document.getElementById("disposable").value ="" ;
		document.getElementById("num_clear").style.display = "none";
	}
}


//비회원 예약 조회 유효성 검사
function nouserbookChk() {
	var form = document.frmNoUser;
	if(!form.user_name.value) {
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		document.getElementById("err_empty_name").style.display = "block";
		form.user_name.focus();
        return;
	}
	 if (!form.order_id.value) {
		 var sections  = document.querySelectorAll(".login_error_wrap");
			for(var i = 0; i < sections.length; i++){
				var item = sections.item(i);
				item.style.display = "none";
			}
		document.getElementById("err_empty_num").style.display = "block";
	    form.order_id.focus();
	    return;
	}
	    form.action = "${contextPath}/nouserbook";
	    form.method="GET"
	    form.submit();
}

//유효성검사
$(document).ready(function() {
	if(${result =="loginFailed"}){
		document.querySelector(".login_error_wrap").style.display = "none";
		document.getElementById("err_common").style.display = "block";
	}
	if(${result =="nouserFailed"}){
		//에러 메시지 비활성화/활성화
		document.querySelector(".login_error_wrap").style.display = "none";
		document.getElementById("err_nouserbook").style.display = "block";
		//비회원 예약 확인 탭메뉴 비활성화/활성화
		//비활성화
		$("#loinid").removeClass("on");
		$("#loinid").attr("aria-selected","false");
		document.getElementById("loinidcont").style.display = "none";
		
		//활성화
		$("#ones").addClass("on");
		$("#ones").attr("aria-selected","true");
		document.getElementById("onescont").style.display = "block";
	}
	//비회원 예약 확인창
	if(${result =="nousercheck"}){
		//탭메뉴 창 비활성화/활성화
		document.querySelector(".panel_item").style.display = "none";
		//넛지배너 닫기
		document.getElementById("nudge_tooltip").style.display = "none";
		//비밀번호 찾기, 아이디찾기, 회원가입 삭제 비활성화
		const parent = document.getElementById("find_wrap");
		
		const child = parent.getElementsByClassName("find_wrapli")
		for (var i = 0; i < child.length; i++) {
			child[i].style.display = "none";
		} 
		
		
		//비회원 예약 확인 탭메뉴 비활성화/활성화
		//비활성화
		$("#loinid").removeClass("on");
		$("#loinid").attr("aria-selected","false");
		document.getElementById("loinidcont").style.display = "none";
		
		//활성화
		$("#ones").addClass("on");
		$("#ones").attr("aria-selected","true");
		document.getElementById("checkcont").style.display = "block";
		document.getElementById("iframe").style.display = "block";
	}
	
});




</script> 

<style>


</style>

<meta charset="UTF-8">
<title>로그인창</title>


</head>
<body>
<div id="wrap" class="wrap">

<%--     <div class="u_skip"><a href="https://www.naver.com">본문 바로가기</a></div>
    <header class="header" role="banner">
        <div class="header_inner">
            <a href="${contextPath }/main.do" class="logo">
            	<img alt="먹고보자" src="${contextPath }/image/mk/logo180.png">
                <h1 class="blind">EATSEE</h1>
            </a>
        </div>
    </header> --%>

    <div id="container" class="container">
    
        <div class="u_skip"><a href="#">본문 바로가기</a></div>
    <header class="header" role="banner">
        <div class="header_inner">
            <a href="${contextPath }/main.do" class="logo">
            	<img alt="먹고보자" src="${contextPath }/image/mk/logo180.png">
                <h1 class="blind">EATSEE</h1>
            </a>
        </div>
    </header>
        <!-- content -->
        <div class="content">
            <div class="login_wrap">
                <ul class="menu_wrap" role="tablist">
                    <li class="menu_item" role="presentation">
                        <!--[주] 탭메뉴 활성화시(=선택시) "on"을 추가해주세요. 접근성: aria-selected는 탭 선택시 true, 미선택시 false로 적용-->
                        <!--[주:접근성] 탭메뉴의 id 값과 탭내용의 aria-controls를 연결하고 있습니다. -->
                        <a href="#none" id="loinid" class="menu_id on" role="tab" aria-selected="true" >
                            <span class="menu_text"><span class="text">ID 로그인</span></span>
                        </a>
                    </li>
                    
                    <li class="menu_item" role="presentation">
                        <a href="#none" id="ones" class="menu_ones" role="tab" aria-selected="false" >
                            <span class="menu_text"><span class="text">비회원 예약 조회</span></span>
                        </a>
                        <!--넛지배너-->
                        <div class="nudge_banner" id="nudge_tooltip">
                            <span class="nudge_text">비회원이시라면 비회원 예약조회를 해주세요.</span>
                            <button type="button" id="nudge_close" class="nudge_close" onclick="nudgeclose()">
	                           <span class="icon_nudge_close">
	                            	<img alt="nudge_close" src="${contextPath }/image/mk/close.png" style="width:8px">
	                           </span>
                            </button>
                        </div>
                    </li>
                </ul>
                
                    <ul class="panel_wrap">
                        <li class="panel_item" id="loinidcont" style="display: block;">
                            <form id="frmNIDLogin" name="frmNIDLogin" target="_top" autocomplete="off" >
                            <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">아이디</span>
                                            </span>
                                        </div>
                                        <input type="text" id="id" name="user_id" placeholder="아이디" title="아이디" class="input_text" maxlength="41" value="" onkeyup="inputclearbtn(this.id)">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;" onclick="inputclear(this.id);">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">비밀번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="user_pwd" placeholder="비밀번호" title="비밀번호" class="input_text" maxlength="16" onkeyup="inputclearbtn(this.id)">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;" onclick="inputclear(this.id);">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                               <!--  <div class="login_keep_wrap" id="login_keep_wrap">
                                    <div class="keep_check">
                                        <input type="checkbox" id="keep" name="nvlong" class="input_keep" value="off">
                                        <label for="keep" class="keep_text">로그인 상태 유지</label>
                                    </div>
                                    <div class="ip_check">
                                        <a href="/login/ext/help_ip3.html" target="_blank" id="ipguide" title="IP보안"><span class="ip_text">IP보안</span></a>
                                        <span class="switch">
                                            <input type="checkbox" id="switch" class="switch_checkbox" value="off">
                                            <label for="switch" class="switch_btn">
                                                <span class="blind" id="switch_blind">on</span>
                                            </label>
                                        </span>
                                    </div>
                                </div> -->

<!--                                 <div class="login_error_wrap" id="err_capslock" style="display: none;">
                                    <div class="error_message">
                                        <strong>CapsLock</strong>이 켜져 있습니다.
                                    </div>
                                </div> -->

                                <div class="login_error_wrap" id="err_empty_id" style="display: none;">
                                    <div class="error_message">
                                        <strong>아이디</strong>를 입력해 주세요.
                                    </div>
                                </div>

                                <div class="login_error_wrap" id="err_empty_pw" style="display: none;">
                                    <div class="error_message">
                                        <strong>비밀번호</strong>를 입력해 주세요.
                                    </div>
                                </div>
								<div class="login_error_wrap" id="err_common" style="display: none;">
                                    <div class="error_message">
                                        아이디 또는 비밀번호를 잘못 입력했습니다.<br> 입력하신 내용을 다시 확인해주세요.
                                    </div>
                                </div>
                                <div class="btn_login_wrap">

                                    <button type="button" class="btn_login" id="log.login" onclick="loginChk()">
                                        <span class="btn_text">로그인</span>
                                    </button>
								
                                </div>
                            </div>
                            </form>
                        </li>
                        
                        <!-- 비회원 예약조회 -->
                        <li class="panel_item" id="onescont" style="display: none;">
						<form name="frmNoUser">
                            <div class="panel_inner" role="tabpanel" aria-controls="ones">
                                <!--안내-->
                                <div class="ones_text">
                                    예약 정보 중 <span class="accent">예약자 명</span>과
                                    <span class="accent">예약 번호</span>를 입력해 주세요.
                                </div>

                                <!--예약 정보 입력 창-->
                                <div class="input_row" id="num_line1">
                                    <input type="text" id="disposable1" name="user_name" placeholder="예약자명을 입력하세요." title="예약자명을 입력하세요." class="input_text" style="text-align: center;" onkeyup="inputclearbookbtn(this.id)">
                                    <span role="button" class="btn_delete" id="name_clear" style="display: none;" onClick="inputbookclear(this.id)">
                                        <span class="icon_delete"><span class="blind">삭제</span></span>
                                    </span>
                                </div>
                                
                                <div class="input_row" id="num_line" style="margin-top:10px">
                                    <input type="text" id="disposable" name="order_id" placeholder="예약번호를 입력하세요." title="예약번호를 입력하세요." class="input_text" style="text-align: center;" onkeyup="inputclearbookbtn(this.id)">
                                    <span role="button" class="btn_delete" id="num_clear" style="display: none;" onClick="inputbookclear(this.id)">
                                        <span class="icon_delete"><span class="blind">삭제</span></span>
                                    </span>
                                </div>
                                <div class="login_error_wrap" id="err_empty_name" style="display:none;margin:8px;">
                                    <span class="error_message">예약자명을 입력하세요.</span>
                                </div>
                                <div class="login_error_wrap" id="err_empty_num" style="display:none;margin:8px;">
                                    <span class="error_message">예약번호를 입력하세요.</span>
                                </div>
                                <div class="login_error_wrap" id="err_nouserbook" style="display: none;padding-bottom: 10px;">
                                    <div class="error_message">
                                        입력한 정보와 일치하는 예약 건이 없습니다.
                                    </div>
                                </div>

                                <!--버튼-->
                                <div class="btn_ones_wrap">
                                    <button type="button" class="btn_login" id="otnlog.login" onClick="nouserbookChk()">
                                        <!-- tg-text=loginbtn -->
                                        <span class="btn_text">예약 조회</span>
                                    </button>
                                </div>
                            </div>
							</form>
                        </li>
                        
                         <!-- 비회원 예약조회 확인-->
                        <li class="panel_item" id="checkcont" style="height:650px;display: none;">
                        <input type="hidden" id="nouserbook_num" name="nouserbook_num" value="${nouser.book_num }">
                        <input type="hidden" id="nouserorder_id" name="nouserorder_id" value="${nouser.order_id }">
                        <input type="hidden" id="nouserseller_id" name="nouserseller_id" value="${nouser.seller_id }">
                        <input type="hidden" id="nouserseller_name" name="nouserseller_name" value="${nouser.seller_name }">
                        <input type="hidden" id="nouseruser_name" name="nouseruser_name" value="${nouser.user_name }">
                        <input type="hidden" id="nouserreserv_date" name="nouserreserv_date" value="${nouser.reserv_date}">
                        <input type="hidden" id="nouserreserv_time" name="nouserreserv_time" value="${nouser.reserv_time }">
                        <input type="hidden" id="nouseruser_tel" name="nouseruser_tel" value="${nouser.user_tel }">
                        <input type="hidden" id="nousercount_pp" name="nousercount_pp" value="${nouser.count_pp }">
                        <input type="hidden" id="nouseruser_email" name="nouseruser_email" value="${nouser.user_email }">
                        <input type="hidden" id="nouserreserv_pay" name="nouserreserv_pay" value="${nouser.reserv_pay }">
                        <input type="hidden" id="nouserreg_date" name="nouserreg_date" value="${nouser.reg_date }">
                        <input type="hidden" id="nouserreserv_status" name="nouserreserv_status" value="${nouser.reserv_status }">
                        <input type="hidden" id="nouserseller_tel" name="nouserseller_tel" value="${nouser.seller_tel }">
                        <input type="hidden" id="nouserseller_addr" name="nouserseller_addr" value="${nouser.seller_addr }">
                        <input type="hidden" id="nouserseller_detailaddr" name="nouserseller_detailaddr" value="${nouser.seller_detailaddr }">
                        <input type="hidden" id="nouserstore_benefit" name="nouserstore_benefit" value="${nouser.store_benefit }">
                        <object data="${contextPath}/nousercheckbook" type="text/html" width=" 100%" height=" 100%"></object>
                        <%-- <jsp:include page="${contextPath}/nousercheckbook"/> --%>
							<%-- <iframe id="iframe" frameborder="no" scrolling="yes" style="width: 100%; height: 650px; visibility: inherit; display: none; border: 0px; vertical-align: bottom;"src="${contextPath}/nousercheckbook"></iframe> --%>
                        </li>
                    </ul>
               
            </div>
            <ul class="find_wrap" id="find_wrap">

                <li class="find_wrapli"><a target="_blank" href="${contextPath }/user/find_pwd.do" class="find_text">비밀번호 찾기</a></li>
                <li class="find_wrapli"><a target="_blank" href="${contextPath }/user/find_id.do" class="find_text">아이디 찾기</a></li>
                <li class="find_wrapli"><a target="_blank" href="${contextPath}/user/memberForm_main.do" class="find_text">회원가입</a>
                </li>

            </ul>
            <!--이벤트 배너-->
				<div id="gladbanner" class="banner_wrap">
					<div style="width: 100%; height: auto; margin: 0px auto;">
						<iframe id="gladbanner_tgtLREC" frameborder="no" scrolling="no"
							tabindex="-1" name="" title="AD"
							style="width: 100%; height: 147px; visibility: inherit; display: block; border: 0px; vertical-align: bottom;"
							sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"
							src="${contextPath }/login_banner"></iframe><!-- ${contextPath }/login_banner -->
					</div>
				</div>
			</div>
        <!-- //content -->
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="footer_inner">
            <!--[주]고객센터,제휴문의,서비스안내-->
            <ul class="footer_link" id="footer_link">
                <!-- <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/privacy.html" id="fot.privacy"><span class="text"><strong>개인정보처리방침</strong></span></a></li>
                <li><a target="_blank" class="footer_item" href="https://help.naver.com/support/service/main.nhn?serviceNo=532" id="fot.help"><span class="text">회원정보 고객센터</span></a></li> -->
            </ul>
            <div class="footer_copy">
                <span class="text">Copyright</span>
                <span class="corp">© EATSEE</span>
                <span class="text">All Rights Reserved.</span>
            </div>
        </div>
    </div>

</div>
<input type="hidden" id="nclicks_nsc" name="nclicks_nsc" value="nid.login_kr">
<input type="hidden" id="nid_buk" name="nid_buk" value="exist">
<input type="hidden" id="removeLink" name="removeLink" value="">
<input type="hidden" id="hide_util" name="hide_util" value="">
<input type="hidden" id="ncaptchaSplit" name="ncaptchaSplit" value="none">
<input type="hidden" id="id_error_msg" name="id_error_msg" value="<strong>아이디</strong>를 입력해주세요.">
<input type="hidden" id="pw_error_msg" name="pw_error_msg" value="<strong>비밀번호</strong>를 입력해주세요.">
<input type="hidden" id="locale" name="locale" value="ko_KR">
<input type="hidden" id="adult_surl_v2" name="adult_surl_v2" value="">
<input type="hidden" id="ispopup" name="ispopup" value="false">
<script type="text/javascript" src="/login/js/bvsd.1.3.5.min.js"></script>
<script type="text/javascript" async="" src="https://ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js"></script>
<script type="text/javascript" src="/login/js/v2/default/common_202201.js?v=20220322"></script>
<script type="text/javascript" src="/login/js/v2/default/default_202105.js?v=20210910"></script>
<div id="nv_stat" style="display:none;">20</div>


</body>
</html>