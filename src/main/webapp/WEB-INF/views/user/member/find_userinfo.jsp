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
<link rel="stylesheet" href="${contextPath }/css/mk/find_id.css">



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
	    		document.getElementById("checkpwdcont").style.display = "none";
	    		
	    		
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
	    		document.getElementById("checkpwdcont").style.display = "none";
	    		
	    		
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

//아이디 찾기 유효성 검사
function idCheck() {
	var form = document.frmNIDLogin;
	var isName = /^[a-zA-Z가-힣]{2,15}$/;
	var isNum = /^01(?:0|1|[6-9])(?:\d{4})\d{4}$/;
	if(!form.user_name.value) {
		//활성화 되어있는 에러메시지 숨긴처리
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		
		
		document.getElementById("err_empty_id").style.display = "block";
		form.user_name.focus();
        return;
	} else if (!isName.test(form.user_name.value)) {
		//활성화 되어있는 에러메시지 숨긴처리
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		
		
		document.getElementById("err_id").style.display = "block";
		form.user_name.focus();
        return;
	}
	 if (!form.tel.value) {
		//활성화 되어있는 에러메시지 숨긴처리
		 var sections  = document.querySelectorAll(".login_error_wrap");
			for(var i = 0; i < sections.length; i++){
				var item = sections.item(i);
				item.style.display = "none";
			}
			
		/* var section = document.querySelectorAll(".login_error_wrap").style.display = "none"; */
		document.getElementById("err_empty_pw").style.display = "block";
	    form.tel.focus();
	    return;
	} else if (!isNum.test(form.tel.value)){
		//활성화 되어있는 에러메시지 숨긴처리
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		
		document.getElementById("err_pw").style.display = "block";
	    form.tel.focus();
	    return;
	}
	    form.action =  "${contextPath}/user/find_id_Result.do";
	    form.method="POST"
	    form.submit();
}



//비밀번호 찾기!!!!!!

//비밀번호 찾기 focusin,focusout
$(function() {
    $(".input_row").on("focusin", function(event) { 
    	var id = $(this).attr('id');
    	if(id == "num_line1"){
    		$("#num_line1").addClass("focus").addClass("on");
    	} else if(id == "num_line") {
    		$("#num_line").addClass("focus").addClass("on");
    	} else if(id == "num_line2") {
    		$("#num_line2").addClass("focus").addClass("on");
    	}
    	
    })
    $(".input_row").on("focusout", function(event) { 
    	var id = $(this).attr('id');
    	if(id == "num_line"){
    		$("#num_line").removeClass("focus").removeClass("on");
    	}  else if(id == "num_line1") {
    		$("#num_line1").removeClass("focus").removeClass("on");
    	} else if(id == "num_line2") {
    		$("#num_line2").removeClass("focus").removeClass("on");
    	}
    })
});

//input 박스 clear버튼 활성화 (비밀번호 찾기)
function inputclearbookbtn(id){
	if(id == "disposable1") {
		document.getElementById("name_clear").style.display = "block";
	} else if(id == "disposable") {
		document.getElementById("num_clear").style.display = "block";
	} else if(id == "disposable2") {
		document.getElementById("findpwid_clear").style.display = "block";
	}
	
}

//input clear버튼 클릭 시 input value 초기화 (비밀번호 찾기)
function inputbookclear(id){
	if(id == "name_clear") {
		document.getElementById("disposable1").value ="" ;
		document.getElementById("name_clear").style.display = "none";
	} else if(id == "num_clear") {
		document.getElementById("disposable").value ="" ;
		document.getElementById("num_clear").style.display = "none";
	} else if(id == "findpwid_clear") {
		document.getElementById("disposable2").value ="" ;
		document.getElementById("findpwid_clear").style.display = "none";
	}
}


//비밀번호 찾기 유효성 검사
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






</script>


<meta charset="UTF-8">
<title>로그인창</title>


</head>
<body>
<div id="wrap" class="wrap">
    <div id="container" class="container">
        <div class="u_skip"><a href="https://www.naver.com">본문 바로가기</a></div>
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
                            <span class="menu_text"><span class="text">아이디 찾기</span></span>
                        </a>
                    </li>
                    
                    <li class="menu_item" role="presentation">
                        <a href="#none" id="ones" class="menu_ones" role="tab" aria-selected="false" >
                            <span class="menu_text"><span class="text">비밀번호 찾기</span></span>
                        </a>
                    </li>
                </ul>
                
                    <ul class="panel_wrap">
                        <li class="panel_item" id="loinidcont" style="display: block;">
                            <form id="frmNIDLogin" name="frmNIDLogin" target="_top" autocomplete="off" >
                            <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                              <!--안내-->
                                <div class="ones_text">
                                    회원정보에 저장된 <span class="accent">성명</span>과
                                    <span class="accent">휴대전화번호</span>를 입력해 주세요.
                                </div>
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">성명</span>
                                            </span>
                                        </div>
                                        <input type="text" id="id" name="user_name" placeholder="성명" title="성명" class="input_text" maxlength="41" value="" onkeyup="inputclearbtn(this.id)">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;" onclick="inputclear(this.id);">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">전화번호</span>
                                            </span>
                                        </div>
                                        <input type="tel" id="pw" name="tel" placeholder="전화번호 / 하이폰(-)제외 번호만입력" title="전화번호" class="input_text" maxlength="16" onkeyup="inputclearbtn(this.id)">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;" onclick="inputclear(this.id);">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="login_error_wrap" id="err_empty_id" style="display: none;">
                                    <div class="error_message">
                                        <strong>성명</strong>을 입력해 주세요.
                                    </div>
                                </div>
                                 <div class="login_error_wrap" id="err_id" style="display: none;">
                                    <div class="error_message">
                                        <strong>2~15자의 한글과 영문 대 소문자</strong>만 사용하세요.
                                    </div>
                                </div>

                                <div class="login_error_wrap" id="err_empty_pw" style="display: none;">
                                    <div class="error_message">
                                        <strong>전화번호</strong>를 입력해 주세요.
                                    </div>
                                </div>
                                
                                 <div class="login_error_wrap" id="err_pw" style="display: none;">
                                    <div class="error_message">
                                        <strong>전화번호</strong>를 정확하게 입력해 주세요.
                                    </div>
                                </div>
								<div class="login_error_wrap" id="err_common" style="display: none;">
                                    <div class="error_message">
                                        성명 또는 전화번호를 잘못 입력했습니다.<br> 입력하신 내용을 다시 확인해주세요.
                                    </div>
                                </div>
                                <div class="btn_login_wrap">

                                    <button type="button" class="btn_login" id="log.login" onclick="idCheck()">
                                        <span class="btn_text">확인</span>
                                    </button>
								
                                </div>
                            </div>
                            </form>
                        </li>
                        <!-- 아이디 찾기 결과 -->
                        <li class="panel_item" id="checkcont" style="display: none;">
                        <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                              <!--안내-->
                              <c:if test="${check == 1}">
                                 <div class="ones_text">
                                 	일치하는 정보가 존재하지 않습니다.
                                </div>
								</c:if>
								<c:if test="${check == 0}">
								  <div class="ones_text">
                                 	고객님의 정보와 일치하는 아이디는  [${user_id }]  입니다.
                               	  </div>
								</c:if>

                            </div>
                        
                        </li>
                        
                        <!-- 비밀번호 찾기 -->
                        <li class="panel_item" id="onescont" style="display: none;">
						<form name="frmFindPwd">
                            <div class="panel_inner" role="tabpanel" aria-controls="ones">
                                <!--안내-->
                                <div class="ones_text">
                                    회원정보에 저장된 <span class="accent">아이디, 성명, 이메일인증</span>을 통해
                                    <span class="accent">비밀번호</span>를 찾을 수 있습니다.
                                </div>

                                <!--비밀번호 찾기-->
                                 <div class="input_row" id="num_line2">
                                    <input type="text" id="disposable2" name="user_id" placeholder="아이디를 입력하세요." title="아이디를 입력하세요." class="input_text" style="text-align: center;" onkeyup="inputclearbookbtn(this.id)">
                                    <span role="button" class="btn_delete" id="findpwid_clear" style="display: none;" onClick="inputbookclear(this.id)">
                                        <span class="icon_delete"><span class="blind">삭제</span></span>
                                    </span>
                                </div>
                                
                                <div class="input_row" id="num_line1">
                                    <input type="text" id="disposable1" name="user_name" placeholder="성명을 입력하세요." title="성명을 입력하세요." class="input_text" style="text-align: center;" onkeyup="inputclearbookbtn(this.id)">
                                    <span role="button" class="btn_delete" id="name_clear" style="display: none;" onClick="inputbookclear(this.id)">
                                        <span class="icon_delete"><span class="blind">삭제</span></span>
                                    </span>
                                </div>
                                
                                <div class="input_row" id="num_line" style="margin-top:10px">
                                    <input type="email" id="disposable" name="user_email" placeholder="이메일을 입력하세요. ex)eatsee@naver.com" title="본인확인 이메일을 입력하세요." class="input_text" style="text-align: center;" onkeyup="inputclearbookbtn(this.id)">
                                    <span role="button" class="btn_delete" id="num_clear" style="display: none;" onClick="inputbookclear(this.id)">
                                        <span class="icon_delete"><span class="blind">삭제</span></span>
                                    </span>
                                </div>
                                
                                
                                <div class="input_row" id="num_line3" style="margin-top:10px; display:none">
                                    <input type="text" id="mail_check_input_box" name="mail_check_input_box" placeholder="인증번호를 입력하세요." title="인증번호를 입력하세요." class="input_text" style="text-align: center;" onkeyup="inputclearbookbtn(this.id)" oninput="checkauth()" maxlength="6" class="prove_ck">
                                    <span role="button" class="btn_delete" id="num_clear" style="display: none;" onClick="inputbookclear(this.id)">
                                        <span class="icon_delete"><span class="blind">삭제</span></span>
                                    </span>
                                </div>
                                <div class="login_error_wrap" id="mail-check-warn1" style="display:none;margin:8px;">
									<span class="error_message" >인증번호가 일치합니다.</span>
								</div>
								
								<div class="login_error_wrap" id="mail-check-warn2" style="display:none;margin:8px;">
									<span class="error_message" >인증번호가 불일치 합니다. 다시 확인해주세요</span>
								</div>
								
								
								
                                
                                <div class="login_error_wrap" id="err_empty_findpwid" style="display:none;margin:8px;">
                                    <span class="error_message">아이디를 입력하세요.</span>
                                </div>
                                <div class="login_error_wrap" id="err_empty_findpwname" style="display:none;margin:8px;">
                                    <span class="error_message">성명을 입력하세요.</span>
                                </div>
                                <div class="login_error_wrap" id="err_empty_findpwemail" style="display:none;margin:8px;">
                                    <span class="error_message">이메일을 입력하세요.</span>
                                </div>
                                <div class="login_error_wrap" id="err_empty_valcode" style="display: none;padding-bottom: 10px;">
                                    <div class="error_message">
                                        인증번호 6자리를 입력해주세요.
                                    </div>
                                </div>
                                
                                <!--버튼-->
                                <div class="btn_ones_wrap" id="emailbtn">
                                    <button type="button" class="btn_login prove">
                                        <!-- tg-text=loginbtn -->
                                        <span class="btn_text">인증번호 보내기</span>
                                    </button>
                                </div>

                                <!--버튼-->
                                <div class="btn_ones_wrap" id="findpwdbtn" style="display:none">
                                    <button type="button" class="btn_login" onClick="pwd_search(this.form)">
                                        <!-- tg-text=loginbtn -->
                                        <span class="btn_text">비밀번호 찾기</span>
                                    </button>
                                </div>
                            </div>
							</form>
                        </li>
                        
                         <!-- 비밀번호 찾기 결과 -->
                        <li class="panel_item" id="checkpwdcont" style="display: none;">
                        <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                              <!--안내-->
                              <c:if test="${check == 1}">
                                 <div class="ones_text">
                                 	일치하는 정보가 존재하지 않습니다.
                                </div>
								</c:if>
								<c:if test="${check == 0}">
								  <div class="ones_text">
                                 	고객님의 정보와 일치하는 비밀번호는  [${user_pwd }]  입니다.
                               	  </div>
								</c:if>

                            </div>
                        
                        </li>
                    </ul>
               
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

<script>
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
	//아이디 찾기 결과 창
	if(${result =="findid"}){
		//탭메뉴 창 비활성화/활성화
		document.querySelector(".panel_item").style.display = "none";
		
/* 		const child = parent.getElementsByClassName("find_wrapli")
		for (var i = 0; i < child.length; i++) {
			child[i].style.display = "none";
		}  */
		
		
		
		//비밀번호 찾기 탭메뉴 비활성화
		$("#ones").removeClass("on");
		$("#ones").attr("aria-selected","false");
		document.getElementById("onescont").style.display = "none";
		
		//아이디찾기 탭메뉴 활성화
		$("#loinid").addClass("on");
		$("#loinid").attr("aria-selected","true");
		document.getElementById("checkcont").style.display = "block";
	}
	
	//비밀번호 찾기 결과 창
	if(${result =="findpwd"}) {
		//전체 탭메뉴 창 비활성화/활성화
		document.querySelector(".panel_item").style.display = "none";
		
		//비밀번호찾기 탭메뉴 활성화
		$("#ones").addClass("on");
		$("#ones").attr("aria-selected","true");
		document.getElementById("checkpwdcont").style.display = "block";
		
		//아이디 찾기 탭메뉴 비활성화
		$("#loinid").removeClass("on");
		$("#loinid").attr("aria-selected","false");
		
	}
	
});
</script>


<script>

//비밀번호 찾기 유효성 검사 및 인증번호 보내기

	idSignal = false;
	nameSignal = false;
	emailSignal = false;
	inputcode =""
	//인증번호 이메일 전송
 	$('.prove').click(function ()  {
 		
 	//mk
 	var form = document.frmFindPwd;
 	if(!form.user_id.value) {
 		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		document.getElementById("err_empty_findpwid").style.display = "block";
		form.user_id.focus();
        return;
 	}
 	if(!form.user_name.value) {
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		document.getElementById("err_empty_findpwname").style.display = "block";
		form.user_name.focus();
        return;
	}
	 if (!form.user_email.value) {
		 var sections  = document.querySelectorAll(".login_error_wrap");
			for(var i = 0; i < sections.length; i++){
				var item = sections.item(i);
				item.style.display = "none";
			}
		document.getElementById("err_empty_findpwemail").style.display = "block";
	    form.user_email.focus();
	    return;
	}
 		
 	
  	var email = $("#disposable").val();
  	console.log("완성된 이메일 : " + email);
  	/* var checkNum = $('#mail_check_input_box'); */
  	$.ajax({
  		type:"GET",
  		url:'<c:url value ="/user/mailCheck.do?email="/>' + email,
  		success : function(data){
  			console.log("data : " + data);
  			$("#emailbtn").css('display','none');
  			$('#num_line3').css('display', 'block');
  			$('#findpwdbtn').css('display', 'block');
  			
  			code = data;
  			console.log("code:"+code);
  			alert("인증번호가 전송되었습니다.");
  			
  		},
  		error:function(){
  			alert("에러입니다");
  		}
  	});
   
   })
</script>
	
<script>
//인증번호 비교
/* var $resultMsg = $('#mail-check-warn2'); */
function checkauth(){
	inputCode = document.getElementById('mail_check_input_box').value;
	console.log("inputCode"+inputCode);
	console.log(code);
	if(inputCode == code){
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		
		$('#mail-check-warn1').css('display','block');
		$('#mail-check-warn1 span').css('color','green');
		$('.prove').attr('disabled',true);
		$('#disposable').attr('readonly',true);
		$('.prove_ck').attr('readonly',true);
	}else{
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		$('#mail-check-warn2').css('display','block');
	}
}
</script>

<script>

//비밀번호 찾기
function pwd_search(form) {
 	//mk
 	if(!form.user_id.value) {
 		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		document.getElementById("err_empty_findpwid").style.display = "block";
		form.user_id.focus();
        return;
 	}
 	if(!form.user_name.value) {
		var sections  = document.querySelectorAll(".login_error_wrap");
		for(var i = 0; i < sections.length; i++){
			var item = sections.item(i);
			item.style.display = "none";
		}
		document.getElementById("err_empty_findpwname").style.display = "block";
		form.user_name.focus();
        return;
	}
	 if (!form.user_email.value) {
		 var sections  = document.querySelectorAll(".login_error_wrap");
			for(var i = 0; i < sections.length; i++){
				var item = sections.item(i);
				item.style.display = "none";
			}
		document.getElementById("err_empty_findpwemail").style.display = "block";
	    form.user_email.focus();
	    return;
	}
	 if (!form.mail_check_input_box.value) {
		 var sections  = document.querySelectorAll(".login_error_wrap");
			for(var i = 0; i < sections.length; i++){
				var item = sections.item(i);
				item.style.display = "none";
			}
		document.getElementById("err_empty_valcode").style.display = "block";
	    form.mail_check_input_box.focus();
	    return;
	}
	
	if(inputCode == code){
		form.action="${contextPath}/user/find_pwd_Result.do";
		form.method="post";
		form.submit();
	}else{
		alert("인증번호를 확인해주세요.");
	}
   
  }
</script>

</body>
</html>
