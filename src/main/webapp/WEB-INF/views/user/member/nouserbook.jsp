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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<!--ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!--fontawesome  -->
<script src="https://kit.fontawesome.com/089abea6f1.js" crossorigin="anonymous"></script>


<style>
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button {
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
}
body.place_my {
    background-color: #f9f9f9;
}
body, input, textarea, select, table, button, code {
    font-family: -apple-system,BlinkMacSystemFont,helvetica,Apple SD Gothic Neo,sans-serif;
    font-size: 16px;
    line-height: 24px;
}

.fn:before {
    font-family: 'Naver Icons';
    font-style: normal;
    font-weight: normal;
    speak: none;
    display: inline;
    text-decoration: inherit;
    width: 1em;
    text-align: center;
    font-variant: normal;
    text-transform: none;
    line-height: 1em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.fn-up2:before {
    content: "\EAC3";
}

.user_app {
    overflow: hidden;
    background-color: #e9ecef;
}

.toast_area {
    z-index: 30000;
    overflow: hidden;
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    width: 100%;
    margin: 0 auto;
    opacity: 0;
    -webkit-transform: translateY(-100%);
    transform: translateY(-100%);
    -webkit-transition: opacity 0.1s 0.2s, -webkit-transform 0.2s;
    transition: opacity 0.1s 0.2s, -webkit-transform 0.2s;
    transition: transform 0.2s, opacity 0.1s 0.2s;
    transition: transform 0.2s, opacity 0.1s 0.2s, -webkit-transform 0.2s;
}

.toast_area .toast_max_layout {
    max-width: 720px;
    margin: 0 auto;
}

.toast_area .inner_area {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin: 15px 18px;
    padding: 12px 15px;
    border-radius: 8px;
    background: rgba(17,17,17,0.95);
    -webkit-box-shadow: 0 4px 4px rgb(0 0 0 / 15%);
    box-shadow: 0 4px 4px rgb(0 0 0 / 15%);
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}



.ct {
    position: relative;
    min-height: 100vh;
}

.top_title {
    z-index: 8000;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 56px;
    background-color: #fff;
    border-bottom: 1px solid rgba(0,0,0,0.1);
    -moz-background-clip: padding;
    -webkit-background-clip: padding;
    background-clip: padding-box;
    -webkit-box-sizing: border-box;
    moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
}

.top_title .title {
    display: block;
    margin: 0 55px 0 50px;
    padding: 16px 0;
    font-weight: 600;
    font-size: 20px;
    letter-spacing: -1px;
    color: #333;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow-wrap: normal;
}

.top_title .title .fn-home1 {
    margin-right: 6px;
    vertical-align: -1px;
    font-size: 18px;
    color: #333;
}

.fn {
    display: inline-block;
    height: 1em;
    line-height: 1em;
}

.top_title .title .fn-home1:before {
    font-weight: bold;
}

.fn-home1:before {
    content: "\EA4B";
}



.page_confirm {
    margin-bottom: -3px;
    padding: 56px 0 1px;
    background-color: #e9ecef;
    border-bottom: none !important;
}

.page_confirm .page_confirm_inner {
    max-width: 736px;
    margin: 0 auto;
}

.page_confirm .confirm_item_top {
    position: relative;
    margin: 9px 10px -2px;
    padding-bottom: 4px;
}

.page_confirm .confirm_item_top:before {
    bottom: 0;
    left: 0;
    background-image: url(/public/assets/bg/bg_confirm_check_bottom_left.png);
    background-position: 0 0;
}

.page_confirm .confirm_item_top:before, .page_confirm .confirm_item_top:after {
    content: '';
    position: absolute;
    width: 50%;
    height: 4px;
    background-size: 374px 4px;
    background-repeat: no-repeat;
    z-index: 10;
}

.page_confirm .confirm_item_top:after {
    bottom: 0;
    right: 0;
    background-image: url(/public/assets/bg/bg_confirm_check_bottom_right.png);
    background-position: 100% 0;
}

.page_confirm.okay .confirm_item_top .confirm_title {
    background-color: #FD9F28;
    border-bottom: 1px dashed rgba(0,0,0,0.1);
}

.page_confirm .confirm_item_top .confirm_title {
    position: relative;
    padding: 15px 21.5px 0 19.5px;
    height: 34px;
    background-image: none;
    background-position: 0 0;
    background-size: 4px 49px;
    background-repeat: repeat-x;
    font-size: 17px;
    font-weight: 600;
    color: #fff;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow-wrap: normal;
}

.page_confirm.okay .confirm_item_top .confirm_title>.ico_clock {
    width: 17px;
    height: 17px;
    background-position: -264px -87px;
    vertical-align: -2px;
    margin-right: 5px;
}

.admission_fee .popup_content .coupon_list .coupon_item .coupon:before, .section_my .my_summary .summary_board .item .link_summary_board .ico_all, .section_my .my_summary .summary_board .item .link_summary_board .ico_scheduled, .section_my .my_summary .summary_board .item .link_summary_board .ico_completed, .section_my .my_summary .summary_board .item .link_summary_board .ico_cancel2, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_all, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_scheduled, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_completed, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_cancel2, .section_my .admission_coupon_area .admission_link:before, .section_my .my_booking_home .err .ico_info_nolist, .section_my .my_booking_home .list_cards .card .card_header .middle .ico_clock, .section_my .my_booking_home .list_cards .card .card_header .middle .ico_check, .section_my .my_booking_home .list_cards .card .card_header .middle .ico_cancel, .place_my_wrapper .header_my .contents_area .info_content .ico_share, .place_my_wrapper .header_my .contents_area .info_link .ico_receipt, .place_my_wrapper .header_my .contents_area .info_link .ico_mission, .place_my_wrapper .header_my .contents_area .info_link .tooltip_new::before, .place_my_wrapper .section_upcoming .upcoming_item .icon_link_area .payment_area .ico_post_npay1, .place_my_wrapper .section_upcoming .upcoming_item .icon_link_area .payment_area .ico_post_npay2, .npay_payment_info .ico_npay, .sec_booking_guide .guide_header .guide_subtitle .ico_npay_m, .guide_contents .guide_step .ico_post_npay1, .guide_contents .guide_step .ico_post_npay2, .npay_amount_info .text1 .ico_npay, .page_confirm .detail_info .info_lst .info_item .item_tit .btn_write_calendar .icon_calendar, .page_confirm .detail_info .info_lst .info_item .item_desc .btn_write_calendar .icon_calendar, .page_confirm .detail_info .info_lst .info_item .ico_mystyle, .page_confirm .confirm_item_top .confirm_title .ico_clock, .page_confirm .confirm_item_top .confirm_top_content .detail_info .info_box .item_tit .ico_mystyle, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_left .ico_n_book, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_right .ico_n_book, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_center .ico_n_book, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_left .ico_n_calendar, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_right .ico_n_calendar, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_center .ico_n_calendar, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_left .ico_arrow_split, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_right .ico_arrow_split, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_center .ico_arrow_split, .page_confirm.okay .confirm_item_top .confirm_title>.ico_clock, .page_confirm.cancel .confirm_item_top .confirm_title .ico_clock, .page_confirm.used .confirm_item_top .confirm_title .ico_clock {
    display: inline-block;
    overflow: hidden;
    color: transparent;
    white-space: nowrap;
    background-image: url(/public/images/sprites/sp_my-3b9782ad.png);
    background-size: 281px 270px;
}
.page_confirm .confirm_item_top .confirm_title .ico_clock {
    width: 17px;
    height: 17px;
    background-position: -264px -68px;
    vertical-align: -2px;
    margin-right: 5px;
}

.page_confirm.okay .confirm_item_top .confirm_title>.ico_clock+.title_text {
    left: 0;
}

.page_confirm.okay .confirm_item_top .confirm_title>.title_text {
    position: relative;
    left: -2px;
}

.page_confirm .confirm_item_top .confirm_title {
    position: relative;
    padding: 15px 21.5px 0 19.5px;
    height: 34px;
    background-image: none;
    background-position: 0 0;
    background-size: 4px 49px;
    background-repeat: repeat-x;
    font-size: 17px;
    font-weight: 600;
    color: #fff;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow-wrap: normal;
}

.page_confirm .confirm_item_top .confirm_top_content {
    position: relative;
    padding: 16px 30px 19.5px;
    background-color: #fff;
}

.page_confirm .confirm_item_top .confirm_top_content::before {
    content: '';
    position: absolute;
    top: -8px;
    left: -8px;
    border-top: 16px solid;
    border-top-color: #e9ecef;
    border-top-color: var(--booking-color-bg1);
    border-left: 16px solid transparent;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}

.page_confirm .confirm_item_top .confirm_top_content::after {
    content: '';
    position: absolute;
    top: -8px;
    right: -8px;
    border-left: 16px solid;
    border-left-color: #e9ecef;
    border-top: 16px solid transparent;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}
.page_confirm .confirm_item_top .confirm_top_content .confirm_number {
    min-height: 23px;
    font-size: 16px;
    font-weight: 500;
    color: #333;
}

.page_confirm.okay .confirm_item_top .confirm_top_content .tit {
    padding-right: 35px;
}

.page_confirm .confirm_item_top .confirm_top_content .tit {
    min-height: 29.5px;
    padding-bottom: 7.5px;
    font-size: 19px;
    line-height: 28px;
    color: #333;
    font-weight: 600;
    letter-spacing: -0.2px;
}

.page_confirm .confirm_item_top .confirm_top_content .tit .anchor {
    display: block;
    color: #0068c3;
}

a {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.page_confirm .confirm_item_top .confirm_top_content .detail_info {
    padding-top: 10px;
    border-top: 1px solid;
    border-color: #e1e1e1;
}

.page_confirm .detail_info {
    padding-top: 8px;
    margin-bottom: 5px;
}

.page_confirm .confirm_item_top .confirm_top_content .detail_info .info_lst {
    margin: 0 -0.5px;
}
.page_confirm .detail_info .info_lst {
    display: table;
    width: 100%;
    border-spacing: 0;
}
.page_confirm .detail_info .info_lst .info_item .item_tit {
    color: #8f8f8f;
    padding-left: 1.5px;
    padding-right: 14px;
    white-space: nowrap;
    letter-spacing: -0.3px;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    /* padding-inline-start: 40px; */
}
ul, ol {
    list-style: none;
}



.page_confirm .confirm_item_top .confirm_top_content .detail_info .item_tit, .page_confirm .confirm_item_top .confirm_top_content .detail_info .item_desc {
    padding-bottom: 2px;
    height: 24px;
    line-height: 23px;
}



.page_confirm .detail_info .info_lst .info_item .item_tit, .page_confirm .detail_info .info_lst .info_item .item_desc {
    display: table-cell;
    min-width: 34px;
    font-size: 16px;
    text-align: left;
    line-height: 23px;
    vertical-align: top;
    /* padding: 1px 0; */
    font-weight: 400;
}
.page_confirm .detail_info .info_lst .info_item .item_desc {
    width: 100%;
    color: #424242;
}

.page_confirm .detail_info .info_lst .info_item .item_tit .booked_date, .page_confirm .detail_info .info_lst .info_item .item_desc .booked_date {
    margin-right: 4px;
}

.page_confirm .confirm_item_body {
    position: relative;
    margin: 5px 10px 10px;
    padding: 14px 18px 16px;
    border-radius: 6px;
    background-color: #fff;
    -webkit-box-shadow: 0 2px 6px 0 rgb(0 0 0 / 3%);
    box-shadow: 0 2px 6px 0 rgb(0 0 0 / 3%);
}

.page_confirm .confirm_item_body .tit_confirm_item {
    position: relative;
    padding: 0 0 13px;
    border-bottom: 1px solid;
    border-bottom-color: #ebebeb;
    font-weight: 500;
    font-size: 16px;
    color: #000;
}

.page_confirm .confirm_item_body .confirm_item_wrap {
    display: block;
    padding-right: 23px;
}

.page_confirm .confirm_item_body .confirm_item_wrap .text_confirm_item {
    display: block;
    font-size: 18px;
    font-weight: bold;
    color: #424242;
}

.page_confirm .confirm_item_body .confirm_item_wrap [class^='btn_open_'] {
    position: absolute;
    top: 0;
    right: 0;
}

.page_confirm .confirm_item_body .confirm_item_wrap [class^='btn_open_'] .fn {
    position: absolute;
    top: 2.5px;
    right: -1px;
    margin: 0;
    color: #424242;
    font-size: 21px;
}

.page_confirm .spr_book2, .page_confirm .spr_book, .page_confirm .fn {
    vertical-align: -2px;
    position: relative;
    margin-right: 3px;
}

.fn {
    display: inline-block;
    height: 1em;
    line-height: 1em;
}



.page_confirm .confirm_item_body .section_home {
    border: none;
}

.ct [class^="section_"] {
    border-bottom: 1px solid;
    border-color: #e2e5e8;
    border-top: 5px solid #e9ecef;
}

.section_home {
    margin-top: 10px;
    background-color: #fff;
}

.section_home:before, .section_home:after {
    content: ' ';
    display: table;
}

.section_home:after {
    clear: both;
}

.page_confirm .confirm_item_body .section_home .section_header {
    display: none;
}

.section_home .section_header {
    padding: 36px 20px 20px;
    font-size: 22px;
    color: #242424;
}

.page_confirm .confirm_item_body .section_home .section_map {
    padding: 0;
    border: 0;
}

.page_confirm .confirm_item_body .section_map {
    padding: 0;
    border: none;
}

.section_map .map_figure {
    position: relative;
    overflow: hidden;
    border-radius: 6px;
}

.section_map .map_figure::before {
    content: '';
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border: 1px solid;
    border-color: rgba(0,0,1,0.08);
    border-radius: 6px;
    pointer-events: none;
    z-index: 10;
}

.section_map .map_figure .link_map {
    display: block;
}

.section_map .map_figure .img_map {
    vertical-align: top;
}

.section_map .map_info {
    padding-top: 19px;
}

.section_map .map_info .map_info_tit.link {
    color: #005fc1;
    color: #0068c3;
}

.section_map .map_info .map_info_tit {
    display: block;
    padding-bottom: 8px;
    font-size: 18px;
    line-height: 22px;
    font-weight: 500;
}

.section_map .map_info .info_area {
    position: relative;
    font-size: 16px;
    line-height: 1.3;
    color: #242424;
}

.section_map .map_info .info_area .fn-pin2 {
    position: absolute;
    top: 2px;
    left: -1px;
    font-size: 19px;
    color: #333;
}

.page_confirm .spr_book2, .page_confirm .spr_book, .page_confirm .fn {
    vertical-align: -2px;
    position: relative;
    margin-right: 3px;
}
.fn-pin2:before {
    content: "\EA7E";
}


.section_map .map_info .info_area {
    position: relative;
    font-size: 16px;
    line-height: 1.3;
    color: #242424;
}

.section_map .map_info .info_area .info_row {
    overflow: hidden;
    padding-left: 5px;
}

.blind {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}

.section_map .map_info .info_area+.info_area {
    margin-top: 19px;
}

.section_map .map_info .info_area .fn-call2 {
    position: absolute;
    top: 3px;
    left: 2px;
    font-size: 18px;
    color: #333;
}
.section_map .map_info .info_area a {
    color: #000;
}

.section_map .map_info .info_area .fn-car2 {
    position: absolute;
    top: 0;
    left: -1px;
    font-size: 19px;
    color: #333;
}
.section_map .map_info .info_area .parking_title {
    color: #fc4c4e;
}
.section_map .map_info .info_area .info_row+.info_row {
    margin-top: 9px;
}
.section_map .map_info .info_area .info_row .row_title {
    float: left;
    margin-right: 10px;
    color: #666;
}
.section_map .map_info .info_area .info_row .row_text {
    overflow: hidden;
    display: block;
}
.page_confirm .list_detail_wrap {
    padding-top: 12px;
}
.page_confirm .list_detail {
    display: table;
    width: 100%;
    padding-top: 10px;
}

.page_confirm .list_detail .item .text {
    display: table-cell;
    padding-top: 2px;
    color: #424242;
}
.page_confirm .list_detail .item .price {
    display: table-cell;
    font-weight: 500;
    color: #333;
    text-align: right;
    white-space: nowrap;
}

.page_confirm .list_detail_wrap .total {
    display: table;
    width: 100%;
    margin-top: 8px;
    padding-top: 9px;
    border-top: 1px solid;
    border-top-color: #d9dadb;
    color: #242424;
    font-weight: bold;
}

.page_confirm .list_detail_wrap .total .text {
    display: table-cell;
}

.page_confirm .list_detail_wrap .total .price {
    display: table-cell;
    color: #ff5757;
    text-align: right;
    white-space: nowrap;
}

.page_confirm .confirm_item_body.close_content {
    padding-bottom: 8px;
}

.page_confirm .confirm_item_body {
    position: relative;
    margin: 5px 10px 10px;
    padding: 14px 18px 16px;
    border-radius: 6px;
    background-color: #fff;
    -webkit-box-shadow: 0 2px 6px 0 rgb(0 0 0 / 3%);
    box-shadow: 0 2px 6px 0 rgb(0 0 0 / 3%);
}

.page_confirm .confirm_item_body.close_content .tit_confirm_item {
    padding-bottom: 4px;
    border-bottom: none;
    margin-bottom: 0;
}

.page_confirm .confirm_item_body .tit_confirm_item {
    position: relative;
    padding: 0 0 13px;
    border-bottom: 1px solid;
    border-bottom-color: #ebebeb;
    font-weight: 500;
    font-size: 16px;
    color: #000;
    color: var(--booking-color-text1);
}

.page_confirm .confirm_item_body .confirm_userinfo_wrap .detail_info {
    padding-top: 10.5px;
    margin-bottom: -5.5px;
}

.page_confirm .detail_info {
    padding-top: 8px;
    margin-bottom: 5px;
}

.page_confirm .confirm_item_body .confirm_userinfo_wrap .detail_info .info_lst {
    margin: 0 -1px;
    width: auto;
}

.page_confirm .detail_info .info_lst {
    display: table;
    width: 100%;
    border-spacing: 0;
}

.page_confirm .confirm_item_body .confirm_userinfo_wrap .detail_info .info_lst .item_tit, .page_confirm .confirm_item_body .confirm_userinfo_wrap .detail_info .info_lst .item_desc {
    padding-top: 2px;
    padding-bottom: 9px;
    line-height: 17px;
    vertical-align: top;
}

.page_confirm .confirm_item_body .confirm_userinfo_wrap .detail_info .info_lst .item_tit {
    padding-right: 15px;
    width: auto;
    max-width: 120px;
    word-break: keep-all;
}
.page_confirm .detail_info .info_lst .info_item .item_tit {
    color: #8f8f8f;
    padding-left: 1.5px;
    padding-right: 14px;
    white-space: nowrap;
    letter-spacing: -0.3px;
}

.gototop {
    z-index: 1200;
    position: relative;
    padding: 14px 0;
    background-color: #e9ecef;
    text-align: center;
}

.gototop .lnk_top {
    display: inline-block;
    height: 33px;
    padding: 0 20px 0 21px;
    background-color: #fff;
    border-radius: 20px;
    -webkit-box-shadow: 0 2px 3px 0 rgb(0 0 0 / 4%);
    box-shadow: 0 2px 3px 0 rgb(0 0 0 / 4%);
    border: solid 1px;
    border-color: #e5e5e5;
    color: #666;
    font-size: 14px;
    font-weight: bold;
    line-height: 33px;
}
.gototop .lnk_top .ico_arrow {
    margin-left: 4px;
    position: relative;
    display: inline-block;
    width: 10px;
    height: 10px;
}

.gototop .lnk_top .ico_arrow:before {
    content: '';
    position: absolute;
    border-top: 2px solid #666;
    border-left: 2px solid #666;
    left: 50%;
    width: 5px;
    height: 5px;
    top: 5px;
    -webkit-transform: translate(-50%, -50%) rotate(45deg);
    transform: translate(-50%, -50%) rotate(45deg);
}
.gototop .lnk_top .ico_arrow:after {
    content: '';
    position: absolute;
    background-color: #666;
    top: 1px;
    left: 50%;
    width: 2px;
    height: 9px;
    -webkit-transform: translate(-50%, 0);
    transform: translate(-50%, 0);
}


.page_confirm.okay .confirm_item_top .confirm_title>.ico_clock {
    width: 17px;
    height: 17px;
    background-position: -264px -87px;
    vertical-align: -2px;
    margin-right: 5px;
}

.page_confirm .confirm_item_top .confirm_top_content::before {
    content: '';
    position: absolute;
    top: -8px;
    left: -8px;
    border-top: 16px solid;
    border-top-color: #e9ecef;
    border-left: 16px solid transparent;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}

.common_bottom_buttongroup .common_bottom_btn {
    display: table-cell;
    position: relative;
    padding: 8px 10px;
    width: 100%;
    text-decoration: none;
    color: #333;
    font-size: 15px;
    vertical-align: middle;
}

.common_bottom_buttongroup_wrap {
    position: relative;
    margin: 13px -12px 0.5px;
}

.common_bottom_buttongroup {
    position: relative;
    display: table;
    width: 100%;
    background-color: #fafbfc;
    border: solid 1px;
    border-color: #d9dadb;
    text-align: center;
}

.admission_fee .popup_content .coupon_list .coupon_item .coupon:before, .section_my .my_summary .summary_board .item .link_summary_board .ico_all, .section_my .my_summary .summary_board .item .link_summary_board .ico_scheduled, .section_my .my_summary .summary_board .item .link_summary_board .ico_completed, .section_my .my_summary .summary_board .item .link_summary_board .ico_cancel2, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_all, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_scheduled, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_completed, .section_my .my_summary .summary_board .item .link_summary_board.on .ico_cancel2, .section_my .admission_coupon_area .admission_link:before, .section_my .my_booking_home .err .ico_info_nolist, .section_my .my_booking_home .list_cards .card .card_header .middle .ico_clock, .section_my .my_booking_home .list_cards .card .card_header .middle .ico_check, .section_my .my_booking_home .list_cards .card .card_header .middle .ico_cancel, .place_my_wrapper .header_my .contents_area .info_content .ico_share, .place_my_wrapper .header_my .contents_area .info_link .ico_receipt, .place_my_wrapper .header_my .contents_area .info_link .ico_mission, .place_my_wrapper .header_my .contents_area .info_link .tooltip_new::before, .place_my_wrapper .section_upcoming .upcoming_item .icon_link_area .payment_area .ico_post_npay1, .place_my_wrapper .section_upcoming .upcoming_item .icon_link_area .payment_area .ico_post_npay2, .npay_payment_info .ico_npay, .sec_booking_guide .guide_header .guide_subtitle .ico_npay_m, .guide_contents .guide_step .ico_post_npay1, .guide_contents .guide_step .ico_post_npay2, .npay_amount_info .text1 .ico_npay, .page_confirm .detail_info .info_lst .info_item .item_tit .btn_write_calendar .icon_calendar, .page_confirm .detail_info .info_lst .info_item .item_desc .btn_write_calendar .icon_calendar, .page_confirm .detail_info .info_lst .info_item .ico_mystyle, .page_confirm .confirm_item_top .confirm_title .ico_clock, .page_confirm .confirm_item_top .confirm_top_content .detail_info .info_box .item_tit .ico_mystyle, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_left .ico_n_book, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_right .ico_n_book, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_center .ico_n_book, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_left .ico_n_calendar, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_right .ico_n_calendar, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_center .ico_n_calendar, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_left .ico_arrow_split, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_right .ico_arrow_split, .page_confirm .confirm_item_top .confirm_top_content .popup_calendar .calendar_box .calendar_center .ico_arrow_split, .page_confirm.okay .confirm_item_top .confirm_title>.ico_clock, .page_confirm.cancel .confirm_item_top .confirm_title .ico_clock, .page_confirm.used .confirm_item_top .confirm_title .ico_clock {
    display: inline-block;
    overflow: hidden;
    color: transparent;
    white-space: nowrap;
    background-image: url(https://m.booking.naver.com/public/images/sprites/sp_my-3b9782ad.png);
    background-size: 281px 270px;
}



</style>

<script>
    $(function() {
        $("#MOVE_TOP_BTN").click(function() {   //버튼 클릭 이벤트
            $('html, body').animate({  //animation을 걸어서 화면 맨위로 이동하도록 설정
                scrollTop : 0
            }, 400);
            return false;
        });
    });
    
</script>



<meta charset="UTF-8">
<title>비회원 예약 확인</title>


</head>

<body class="ko biz place_my custom_scrollbars">
	<div id="root" class="user_app">
		<div class="toast_area">
			<div class="toast_max_layout">
				<div class="inner_area"></div>
			</div>
		</div>
		<div id="ct" class="ct">
			<div class="top_title">
				<h2>
					<a href="#" class="title">
					<i class="fa-solid fa-house" style="margin-right: 10px"></i><span class="seller_name"></span></a>
				</h2>
			</div>
			<div class="page_confirm okay">
				<div class="page_confirm_inner">
					<div class="confirm_item_top">
						<h3 class="confirm_title">
							<i class="ico_clock"></i><span class="title_text"
								data-tst_booking_state="0">예약 확인</span>
						</h3>
						<div class="confirm_top_content">
							<p class="confirm_number">
								<span data-tst_rserv_no="0">예약번호. <span id="order_id"></span></span>
							</p>
							<h4 class="tit" data-tst_resoc_name="0">
								<a href="#" class="anchor seller_name"></a>
							</h4>
							<div class="detail_info">
								<ul class="info_lst">
									<li class="info_item"><div class="item_tit">일정</div>
										<div class="item_desc">
											<span class="booked_date" data-tst_booking_date="0" id="reserv_date"></span>
										</div>
									</li>
									<li class="info_item"><div class="item_tit">
											<span>인원</span>
										</div>
										<div class="item_desc">
											<span id="count_pp"></span>
										</div></li>
								</ul>
							</div>
							<div class="common_bottom_buttongroup_wrap">
								<div class="common_bottom_buttongroup">
									<a href="#" class="common_bottom_btn" data-tst_cancel_click="0"><span>예약취소</span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="confirm_item_body">
						<h3 class="tit_confirm_item">
							<a href="#" class="confirm_item_wrap" title="접기"><span
								class="text_confirm_item">오시는길</span>
							<!-- <div class="btn_open_card">
									펼치기 
									<i class="fa-solid fa-caret-up"></i>
									접기 
									<i class="fa-solid fa-caret-down" style="display:none;"></i>
							</div> -->
							</a>
						</h3>
						<div class="section_home">
							<h4 class="section_header">오시는길</h4>
							<div class="section_map">
							<div id="map" style="width:100%;height:350px;"></div>
			<!-- 					<div class="map_figure">
								
									 <a href="#" class="link_map"><img class="img_map"
										src="https://simg.pstatic.net/static.map/v2/map/staticmap.bin?crs=EPSG:4326&amp;baselayer=bl_vc_bg&amp;overlayers=ol_vc_an&amp;scale=2&amp;caller=mw_smart_booking&amp;overlayers=ol_vc_an&amp;center=127.5056473,36.6291877&amp;markers=type:c|size:mid|label:hair|pos:127.5056473 36.6291877&amp;level=16&amp;w=335&amp;h=170&amp;lang=ko"
										width="100%" height="100%" alt="map"></a>
								</div> -->
								
								<div class="map_info">
									<a href="#" class="map_info_tit link seller_name" ></a>
									<div class="info_area">
										<i class="fa-solid fa-location-dot "></i>
										<span class="info_row" id="seller_addr"></span>
								</div>
									<div class="info_area">
										<i class="fa-solid fa-phone"></i>
										<span class="info_row" id="seller_tel"></span>
									</div>
									<div class="info_area">
										<i class="fa-solid fa-tag" aria-hidden="true"></i>
										<span class="info_row" id="store_benefit"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="confirm_item_body">
						<h3 class="tit_confirm_item">
							<div class="text_confirm_item">
								<span>결제내역</span>
							</div>
						</h3>
						<div class="confirm_paywrap">
							<div class="list_detail_wrap">
								<ul class="list_detail">
									<li class="item">
										<span class="text price" id="reserv_pay"></span>
									</li>
								</ul>
								<div class="total">
									<span class="text">합계</span><span class="price" id="total_pay"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="confirm_item_body close_content"> <!-- close_content  class 추가하면 닫힘, 접기 아이콘 display:block 으로 바꾸기 -->
						<h3 class="tit_confirm_item">
							<div class="confirm_item_wrap">
							<span class="text_confirm_item">예약자정보</span>
							<div class="btn_open_card">
									<!--접기  -->
									<i class="fa-solid fa-caret-up open-close" id="fa-caret-up" style="display:none;"></i>
									<!--펼치기  -->
									<i class="fa-solid fa-caret-down open-close" id="fa-caret-down"></i>
							</div>
							</div>
						</h3>
						<div class="confirm_userinfo_wrap open_close_div" id="userinfo_open_close" style="display:none;">
							<div class="detail_info">
								<ul class="info_lst">
									<li class="info_item"><div class="item_tit">예약자</div>
										<div class="item_desc" id="user_name"></div></li>
									<li class="info_item"><div class="item_tit">연락처</div>
										<div class="item_desc">
											<a class="anchor" id="user_tel"></a>
										</div></li>
									<li class="info_item"><div class="item_tit">이메일</div>
										<div class="item_desc">
											<a class="anchor" id="user_email"></a>
										</div></li>
								</ul>
								<ul class="info_lst oneline"></ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="gototop">
			<a href="#" class="lnk_top" id="MOVE_TOP_BTN">TOP<i class="ico_arrow"></i></a>
		</div>

	</div>
  

</body>
<script>
	//login.jsp(부모창) 값 가져오기
	var book_num = $("#nouserbook_num", parent.document).val();
	var order_id = $("#nouserorder_id", parent.document).val();
	var seller_id = $("#nouserseller_id", parent.document).val();
	var seller_name = $("#nouserseller_name", parent.document).val();
	var user_name = $("#nouseruser_name", parent.document).val();
	var reserv_date = $("#nouserreserv_date", parent.document).val();
	var reserv_time = $("#nouserreserv_time", parent.document).val();
	var user_tel = $("#nouseruser_tel", parent.document).val();
	var count_pp = $("#nousercount_pp", parent.document).val();
	var user_email = $("#nouseruser_email", parent.document).val();
	var reserv_pay = $("#nouserreserv_pay", parent.document).val();
	var reg_date = $("#nouserreg_date", parent.document).val();
	var reserv_status = $("#nouserreserv_status", parent.document).val();
	var seller_tel = $("#nouserseller_tel", parent.document).val();
	var seller_addr = $("#nouserseller_addr", parent.document).val();
	var seller_detailaddr = $("#nouserseller_detailaddr", parent.document).val();
	var store_benefit = $("#nouserstore_benefit", parent.document).val();
	
	document.getElementById("order_id").innerHTML=order_id;
	var sections  = document.querySelectorAll(".seller_name");
	for(var i = 0; i < sections.length; i++){
		document.getElementsByClassName("seller_name")[i].innerHTML = seller_name;
	}
	document.getElementById("seller_addr").innerHTML=seller_addr + seller_detailaddr;
	document.getElementById("seller_tel").innerHTML=seller_tel;
	document.getElementById("store_benefit").innerHTML=store_benefit;
	
	document.getElementById("reserv_date").innerHTML= reserv_date.replaceAll('-', '.') +" / " + reserv_time.substring(0,5);
	document.getElementById("count_pp").innerHTML=count_pp;
	
	/* 정규식 사용하여 천단위 콤마 생성 */
	document.getElementById("reserv_pay").innerHTML="예약금 " + reserv_pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	document.getElementById("total_pay").innerHTML= reserv_pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	
	document.getElementById("user_name").innerHTML=user_name;
	document.getElementById("user_tel").innerHTML=user_tel;
	document.getElementById("user_email").innerHTML=user_email;
	
/* 	document.getElementById("book_num").innerHTML=book_num;
	document.getElementById("seller_id").innerHTML=seller_id;
	
	
	
	
	document.getElementById("count_pp").innerHTML=count_pp;
	
	document.getElementById("reserv_pay").innerHTML=reserv_pay;
	document.getElementById("reg_date").innerHTML=reg_date;
	document.getElementById("reserv_status").innerHTML=reserv_status;
	 */
	

</script>
<!-- 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=221248d77611ce72b4cec08d9bf0088c&libraries=services"></script>
<script>
var seller_addr = $("#nouserseller_addr", parent.document).val();
var seller_name = $("#nouserseller_name", parent.document).val();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(seller_addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ seller_name +'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<script>
	$(".open-close").click(function() {
		var class_id = $(this).attr('id');
		if (class_id == "fa-caret-down") {
			$("#" + class_id).css("display", "none");
			$("#fa-caret-up").css("display", "block");
			$("#userinfo_open_close").css("display", "block");
			$(".confirm_item_body").removeClass("close_content");
		} else if (class_id == "fa-caret-up") {
			$("#" + class_id).css("display", "none");
			$("#fa-caret-down").css("display", "block");
			$("#userinfo_open_close").css("display", "none");
			$(".confirm_item_body").addClass("close_content");
		}
	})
</script>

</html>