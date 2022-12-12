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

<c:set var="order_id" value="${order_id}" />
<style>
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button {
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
}
body.place_my {
    background-color: #f9f9f9;
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

.page_confirm .confirm_item_top .confirm_top_content .detail_info .item_tit, .page_confirm .confirm_item_top .confirm_top_content .detail_info .item_desc {
    padding-bottom: 2px;
    height: 24px;
    line-height: 23px;
}

.page_confirm .detail_info .info_lst .info_item .item_tit {
    color: #8f8f8f;
    padding-left: 1.5px;
    padding-right: 14px;
    white-space: nowrap;
    letter-spacing: -0.3px;
}

.page_confirm .detail_info .info_lst .info_item .item_tit, .page_confirm .detail_info .info_lst .info_item .item_desc {
    display: table-cell;
    min-width: 34px;
    font-size: 16px;
    text-align: left;
    line-height: 23px;
    vertical-align: top;
    padding: 1px 0;
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

.fn-up2:before {
    content: "\EAC3";
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

.section_map .map_info .info_area {
    position: relative;
    font-size: 16px;
    line-height: 1.3;
    color: #242424;
}

.section_map .map_info .info_area .info_row {
    overflow: hidden;
    padding-left: 24px;
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
.page_confirm .detail_info .info_lst .info_item .item_tit, .page_confirm .detail_info .info_lst .info_item .item_desc {
    display: table-cell;
    min-width: 34px;
    font-size: 16px;
    text-align: left;
    line-height: 23px;
    vertical-align: top;
    padding: 1px 0;
    font-weight: 400;
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
</style>

<meta charset="UTF-8">
<title>비회원 예약 확인</title>


</head>

<body class="ko biz place_my custom_scrollbars">
<c:set var="abcc" value="${abc} " />
	<div id="root" class="user_app">
		<div class="toast_area">
			<div class="toast_max_layout">
				<div class="inner_area"></div>
			</div>
		</div>
		<div id="ct" class="ct">
			<div class="top_title">
				<h2>
					<a href="#" class="title"><i class="fn fn-home1"
						aria-hidden="true"></i><span>로이드밤 금천점</span></a>
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
								<a href="#" class="anchor">지현 디자이너</a>
							</h4>
							<div class="detail_info">
								<ul class="info_lst">
									<li class="info_item"><div class="item_tit">일정</div>
										<div class="item_desc">
											<span class="booked_date" data-tst_booking_date="0">2022.
												12. 2(금) 오후 4:00</span>
										</div>
									</li>
									<li class="info_item"><div class="item_tit">
											<span>메뉴</span>
										</div>
										<div class="item_desc">
											<span>당일예약취소&amp;노쇼방지 캠페인<br></span><span>여성 컷</span>
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
							<div class="btn_open_card">
									<i class="fn fn-up2" aria-hidden="true"></i>
								</div></a>
						</h3>
						<div class="section_home">
							<h4 class="section_header">오시는길</h4>
							<div class="section_map">
								<div class="map_figure">
									<a href="#" class="link_map"><img class="img_map"
										src="https://simg.pstatic.net/static.map/v2/map/staticmap.bin?crs=EPSG:4326&amp;baselayer=bl_vc_bg&amp;overlayers=ol_vc_an&amp;scale=2&amp;caller=mw_smart_booking&amp;overlayers=ol_vc_an&amp;center=127.5056473,36.6291877&amp;markers=type:c|size:mid|label:hair|pos:127.5056473 36.6291877&amp;level=16&amp;w=335&amp;h=170&amp;lang=ko"
										width="100%" height="100%" alt="map"></a>
								</div>
								<div class="map_info">
									<a href="#" class="map_info_tit link">로이드밤헤어금천점</a>
									<div class="info_area">
										<i class="fn fn-pin2" aria-hidden="true"></i><i
											class="ico_map" aria-hidden="true"></i>
										<div class="info_row">
											<span class="blind">주소</span>충청북도 청주시 상당구 금천동 227-4 2층
										</div>
								</div>
									<div class="info_area">
										<i class="fn fn-call2" aria-hidden="true"></i>
										<div class="info_row">
											<a href="tel:043-221-1380" class="">043-221-1380</a>
										</div>
									</div>
									<div class="info_area">
										<i class="fn fn-car2" aria-hidden="true"></i><i
											class="ico_parking" aria-hidden="true"></i>
										<div class="info_row">
											<strong class="parking_title">주차가능</strong>
										</div>
										<div class="info_row">
											<span class="row_title">주차료</span><span class="row_text">무료</span>
										</div>
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
									<li class="item"><span class="text">여성 컷</span><span
										class="price">13,000원</span></li>
								</ul>
								<div class="total">
									<span class="text">합계</span><span class="price">13,000원</span>
								</div>
							</div>
						</div>
					</div>
					<div class="confirm_item_body close_content">
						<h3 class="tit_confirm_item">
							<a href="#" class="confirm_item_wrap" title="펼쳐보기"
								data-tst_open_user_click="0"><span class="text_confirm_item">예약자 정보</span>
							<div class="btn_open_card">
									<i class="fn fn-down2" aria-hidden="true"></i>
								</div></a>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="gototop">
			<a href="#" class="lnk_top">TOP<i class="ico_arrow"></i></a>
		</div>

	</div>
  <script>
			window.__APOLLO_STATE__ = {
				"ROOT_QUERY" : {
					"__typename" : "Query",
					"announcementDetails({\"input\":{\"exposureTargetCode\":\"MY_BOOKING\"}})" : null,
					"transportationTicketCount" : 0,
					"bookingCount({\"input\":{\"businessMainCategory\":\"ALL\",\"queryType\":\"BOOKING\"}})" : {
						"__typename" : "BookingCount",
						"total" : 11,
						"available" : 1,
						"canceled" : 4,
						"completed" : 6,
						"noshowCount" : 0
					},
					"getPlaceHeader({\"input\":{\"query\":\"\\n  query getPlaceHeader($fromMapApp: Boolean) {\\n    profile {\\n      imageUrl\\n      nickname\\n      introduction\\n    }\\n    session {\\n      objectId\\n      defaultFolderShareId\\n      followRequesters\\n    }\\n    userStat {\\n      totalVisits\\n      totalReviews\\n      totalThemes\\n      totalReviewImages\\n      savedPlaces\\n      followers\\n      following\\n      averageRating\\n    }\\n    tabMenus(fromMapApp: $fromMapApp) {\\n      id\\n      url\\n      clickCode\\n      label\\n    }\\n  }\\n\",\"variables\":{\"fromMapApp\":false}}})" : {
						"profile" : {
							"imageUrl" : null,
							"nickname" : "smk****",
							"introduction" : null
						},
						"session" : {
							"objectId" : "5c20e56b0967d817bd3b126e",
							"defaultFolderShareId" : "bd17ab8220854a0dab036dc413a318bd",
							"followRequesters" : 0
						},
						"userStat" : {
							"totalVisits" : 6,
							"totalReviews" : 1,
							"totalThemes" : 0,
							"totalReviewImages" : 0,
							"savedPlaces" : [ "34514976" ],
							"followers" : 0,
							"following" : 0,
							"averageRating" : 0
						},
						"tabMenus" : [
								{
									"id" : "feed",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/feed",
									"clickCode" : "lnb.feed",
									"label" : "피드"
								},
								{
									"id" : "visit",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/visit",
									"clickCode" : "lnb.visit",
									"label" : "방문"
								},
								{
									"id" : "review",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/review",
									"clickCode" : "lnb.review",
									"label" : "리뷰"
								},
								{
									"id" : "booking",
									"url" : "https://m.booking.naver.com/my/bookings?from=myp",
									"clickCode" : "lnb.booking",
									"label" : "예약·주문"
								},
								{
									"id" : "place",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/place",
									"clickCode" : "lnb.place",
									"label" : "저장"
								},
								{
									"id" : "followers",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/followers",
									"clickCode" : "lnb.",
									"label" : "팔로워"
								},
								{
									"id" : "following",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/following",
									"clickCode" : "lnb.",
									"label" : "팔로잉"
								},
								{
									"id" : "blocking",
									"url" : "https://m.place.naver.com/my/5c20e56b0967d817bd3b126e/blocking",
									"clickCode" : "lnb.",
									"label" : "차단"
								} ]
					},
					"account" : {
						"__ref" : "Account:15773590"
					},
					"i18n({\"input\":{}})" : {
						"__typename" : "I18n",
						"language" : "ko",
						"currency" : "KRW",
						"location" : null,
						"environment" : {
							"isInApp" : false
						}
					},
					"exchangeRates" : {
						"__ref" : "ExchangeRates:null"
					},
					"userCouponCount" : {
						"__typename" : "UserCouponCount",
						"expired" : 0,
						"total" : 0,
						"usable" : 0,
						"usableDetail" : {
							"__typename" : "UserCouponCountUsableDetails",
							"all" : 0,
							"booking" : 0,
							"order" : 0
						},
						"used" : 0
					},
					"reminder({\"userId\":15773590})" : [],
					"coupons({\"input\":{\"isUsed\":false}})" : {
						"__typename" : "Coupons",
						"totalCount" : 0
					},
					"historySummaryDetails({\"input\":{\"isSmartOrder\":false,\"userId\":15773590}})" : {
						"__typename" : "HistorySummaryDetails",
						"resultByCompletedCount" : {
							"__typename" : "HistorySummaryData",
							"overallBundle" : {
								"__typename" : "OverallBundle",
								"businessMainCategory" : null,
								"lastBookingEndDate" : null,
								"nPaySales" : null,
								"completedCount" : 6,
								"topBusinesses" : [ {
									"__typename" : "TopBusiness",
									"businessId" : "589307",
									"completedCount" : 2,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL07",
									"serviceName" : "로이드밤 금천점",
									"businessIsImp" : true,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2022-06-05",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1076375733,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								}, {
									"__typename" : "TopBusiness",
									"businessId" : "376829",
									"completedCount" : 2,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL07",
									"serviceName" : "조으다헤어 아름점",
									"businessIsImp" : true,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2022-03-09",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1434671824,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								}, {
									"__typename" : "TopBusiness",
									"businessId" : "591102",
									"completedCount" : 1,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL08",
									"serviceName" : "더에스 브로우",
									"businessIsImp" : true,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2022-03-05",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1314937164,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								}, {
									"__typename" : "TopBusiness",
									"businessId" : "305163",
									"completedCount" : 1,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL00",
									"serviceName" : "눈부심",
									"businessIsImp" : false,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2020-10-17",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1146495401,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								} ]
							},
							"topBusinessMainCategoryBundles" : [ {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "BEAUTY",
								"nPaySales" : null,
								"lastBookingEndDate" : "2022-06-05",
								"completedCount" : 5,
								"topBusinesses" : [ {
									"__typename" : "TopBusiness",
									"businessId" : "589307",
									"completedCount" : 2,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL07",
									"serviceName" : "로이드밤 금천점",
									"businessIsImp" : true,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2022-06-05",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1076375733,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								}, {
									"__typename" : "TopBusiness",
									"businessId" : "376829",
									"completedCount" : 2,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL07",
									"serviceName" : "조으다헤어 아름점",
									"businessIsImp" : true,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2022-03-09",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1434671824,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								}, {
									"__typename" : "TopBusiness",
									"businessId" : "591102",
									"completedCount" : 1,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL08",
									"serviceName" : "더에스 브로우",
									"businessIsImp" : true,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2022-03-05",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1314937164,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								} ]
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "OTHER",
								"nPaySales" : null,
								"lastBookingEndDate" : "2020-10-17",
								"completedCount" : 1,
								"topBusinesses" : [ {
									"__typename" : "TopBusiness",
									"businessId" : "305163",
									"completedCount" : 1,
									"userId" : null,
									"businessTypeId" : "13",
									"businessCategoryCode" : "DL00",
									"serviceName" : "눈부심",
									"businessIsImp" : false,
									"businessIsDeleted" : false,
									"nPaySales" : null,
									"lastBookingEndDate" : "2020-10-17",
									"businessIsImpPlace" : true,
									"businessImpPlaceId" : 1146495401,
									"placeCategoryId" : null,
									"businessIsPlaceHidden" : false,
									"businessPlaceStatusCode" : "approved"
								} ]
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "RESTAURANT_AND_CAFE",
								"nPaySales" : null,
								"lastBookingEndDate" : null,
								"completedCount" : 0,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "ACCOMMODATION",
								"nPaySales" : null,
								"lastBookingEndDate" : null,
								"completedCount" : 0,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "LECTURES",
								"nPaySales" : null,
								"lastBookingEndDate" : null,
								"completedCount" : 0,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "SHOW_EXHIBITION",
								"nPaySales" : null,
								"lastBookingEndDate" : null,
								"completedCount" : 0,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "LEISURE_AND_SPORTS",
								"nPaySales" : null,
								"lastBookingEndDate" : null,
								"completedCount" : 0,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "HOSPITAL",
								"nPaySales" : null,
								"lastBookingEndDate" : null,
								"completedCount" : 0,
								"topBusinesses" : []
							} ]
						},
						"resultByNPaySales" : {
							"__typename" : "HistorySummaryData",
							"overallBundle" : {
								"__typename" : "OverallBundle",
								"businessMainCategory" : null,
								"lastBookingEndDate" : null,
								"nPaySales" : "0",
								"completedCount" : null,
								"topBusinesses" : []
							},
							"topBusinessMainCategoryBundles" : [ {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "BEAUTY",
								"nPaySales" : "0",
								"lastBookingEndDate" : "2022-06-05",
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "OTHER",
								"nPaySales" : "0",
								"lastBookingEndDate" : "2020-10-17",
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "RESTAURANT_AND_CAFE",
								"nPaySales" : "0",
								"lastBookingEndDate" : null,
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "ACCOMMODATION",
								"nPaySales" : "0",
								"lastBookingEndDate" : null,
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "LECTURES",
								"nPaySales" : "0",
								"lastBookingEndDate" : null,
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "SHOW_EXHIBITION",
								"nPaySales" : "0",
								"lastBookingEndDate" : null,
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "LEISURE_AND_SPORTS",
								"nPaySales" : "0",
								"lastBookingEndDate" : null,
								"completedCount" : null,
								"topBusinesses" : []
							}, {
								"__typename" : "TopBusinessCategory",
								"businessMainCategory" : "HOSPITAL",
								"nPaySales" : "0",
								"lastBookingEndDate" : null,
								"completedCount" : null,
								"topBusinesses" : []
							} ]
						}
					},
					"upcomingBooking" : {
						"__typename" : "UpcomingBooking",
						"bookings" : [ {
							"__ref" : "BookingDetails:356288671"
						} ]
					},
					"kopisCouponSet({\"input\":{\"userId\":15773590}})" : []
				},
				"Account:15773590" : {
					"__typename" : "Account",
					"nid" : "smk980324",
					"id" : 15773590,
					"userId" : 15773590,
					"nidNo" : "8Cxux",
					"name" : "송민경",
					"ownerId" : null,
					"nickname" : "송민경",
					"email" : "smk980324@naver.com",
					"phone" : "01041826867",
					"isAdult" : true,
					"isGroup" : false,
					"isRealName" : true,
					"isSmsAlarm" : true,
					"isNewUser" : false,
					"isTermsAgreed" : true,
					"bookingCount" : 11,
					"isFourteenAndOver" : true,
					"isNCertified" : false,
					"csrfToken" : "994a5f3a14c5816904311d18462d7859661ba80eab014a91798ad4d72e6b6ba25c8d40fa2654b1bdf78e9b37210de6c2236c746842d76bab34031ae813137613",
					"nbsm" : "S",
					"authenticationCode" : "naver",
					"isTalkAlarmAgreed" : null,
					"isMembershipUser" : false,
					"birthDate" : null,
					"isPrivateLocationProvidingAgreed" : true
				},
				"ExchangeRates:null" : {
					"__typename" : "ExchangeRates",
					"id" : null,
					"date" : "2022-11-11",
					"currencyMapJson" : {
						"KRW" : {
							"JPY" : {
								"rate" : "966.39",
								"unit" : 100
							},
							"THB" : {
								"rate" : "37.85",
								"unit" : 1
							},
							"TWD" : {
								"rate" : "43.63",
								"unit" : 1
							},
							"USD" : {
								"rate" : "1370.1",
								"unit" : 1
							},
							"KRW" : {
								"rate" : 1,
								"unit" : 1
							}
						}
					}
				},
				"Business:589307" : {
					"__typename" : "Business",
					"id" : "589307",
					"businessId" : "589307",
					"addressJson" : {
						"jibun" : "충청북도 청주시 상당구 금천동 227-4 2층",
						"roadAddr" : "충청북도 청주시 상당구 수영로 276 2층",
						"detail" : "금천동 다이소 옆건물 2층",
						"placeName" : null,
						"posLat" : 36.6291877,
						"posLong" : 127.5056473,
						"zoomLevel" : 12,
						"address" : "충청북도 청주시 상당구 수영로 276 2층 (충청북도 청주시 상당구 금천동 227-4 2층)",
						"globalAddress" : null,
						"miniMap" : null,
						"isImpLocationGuide" : true
					},
					"businessTypeId" : "13",
					"isPossibleUserCancel" : true,
					"completedPinValue" : null,
					"placeCategoryId" : "230633",
					"businessCategoryConf" : {
						"__typename" : "BusinessCategoryConf",
						"businessCategory" : "DL07",
						"name" : "HAIR",
						"bookingSettingJson" : {
							"isAllRefundRequired" : false,
							"allRefundPossibleHours" : 1
						},
						"editorId" : null,
						"editedDateTime" : null,
						"regDateTime" : null
					},
					"businessCategory" : "DL07",
					"name" : "로이드밤헤어금천점",
					"serviceName" : "로이드밤 금천점",
					"isImp" : true,
					"isDeleted" : false,
					"isImpPlace" : true,
					"isCompletedButtonImp" : false,
					"desc" : "청주미용실 금천동미용실 1위.\n로이드밤금천점.\n기장추가에 대한 불안감을 없앴습니다.\n로이드밤헤어의 프리미엄 마인드.\n 최신 트렌드를 제안하고 앞서가는 트렌드 세터들과의 만남.\n시술가격을 낮추고 제품의 질을 높였습니다.\n오직당신만의 헤어스타일을 위한 로이드밤헤어에서 최고의 서비스를 경험해보세요.",
					"email" : null,
					"phoneInformationJson" : {
						"phoneList" : [],
						"wiredPhone" : null,
						"reprPhone" : "043-221-1380"
					},
					"websiteUrl" : null,
					"isNaverTalkChannelActivated" : false,
					"isNaverTalkRelated" : false,
					"naverTalkAccount" : null,
					"agencies" : [ {
						"__typename" : "Agency",
						"agencyId" : "56",
						"name" : "주식회사 코드컴",
						"phone" : "1566-5641",
						"agencyCode" : "AT03"
					} ],
					"nPayErrorStatus" : null,
					"nPayRegStatusCode" : "PA01",
					"impPlaceId" : "1076375733",
					"isSeveranceAgency" : false
				},
				"BookingDetails:356288671" : {
					"__typename" : "BookingDetails",
					"id" : "356288671",
					"bizItemId" : "4327494",
					"bizItemName" : "지현 디자이너",
					"bookingCount" : 1,
					"bookingId" : "356288671",
					"bookingStatusCode" : "RC03",
					"businessCategory" : "DL07",
					"businessId" : "589307",
					"businessName" : "로이드밤헤어금천점",
					"completedDateTime" : null,
					"encryptedBookingId" : "fd239fe4b8c50d15b50a0f91484c2eba22cf965e6db1ba91efd40200e4ad0ec3fc1e3b90b32d748a67a4ceb4c87a17389915dffd6fa57beb6c9ae8051679a306c07595fbd44362a6a273508f686fdf9e8a74430e4c3b7762d62349222d78e8527f67228b277f011aad1047f1458ba685",
					"endDate" : "2022-12-02",
					"isCompleted" : false,
					"isPlaceHidden" : false,
					"isMask" : null,
					"isPostPayment" : false,
					"readableCodeType" : null,
					"isRefunded" : false,
					"nPayChargedStatusCode" : null,
					"price" : 13000,
					"refundPrice" : null,
					"couponPrice" : null,
					"regDateTime" : "2022-11-11T11:14:08Z",
					"serviceName" : "로이드밤 금천점",
					"shippingStatus" : "NONE",
					"startDate" : "2022-12-02",
					"useNaverPay" : false,
					"business" : {
						"__ref" : "Business:589307"
					},
					"currentRefundRule" : null,
					"isImpPlace" : true,
					"impPlaceId" : "1076375733",
					"cancelledExtraFeeJson" : {},
					"deliveryAddressJson" : {},
					"extraFeeJson" : {},
					"snapshotJson" : {
						"bookingId" : 356288671,
						"language" : "ko",
						"businessTypeId" : "13",
						"businessId" : 589307,
						"placeId" : "1076375733",
						"businessName" : "로이드밤헤어금천점",
						"serviceName" : "로이드밤 금천점",
						"bizItemId" : 4327494,
						"bizItemName" : "지현 디자이너",
						"agencyId" : 56,
						"bookingTimeUnitCode" : "RT01",
						"bookingConfirmCode" : "CF01",
						"uncompletedBookingProcessCode" : "UC01",
						"uncompletedBookingRefundRate" : 0,
						"bookingPrecaution" : "\u003c\u003c 예약 시간은 꼭 신중하게 선택 부탁드립니다> >\n\n* 디자이너 스케쥴에 따라 예약시간 변경 또는 취소요청이 있을 수 있음을\n양해 부탁드립니다.\n\n*당일 예약 취소나, 직전 예약 취소는 다음 예약이 어려울 수 있습니다.\n\n*앞머리 시술(매직,펌,커트)은 예약이 불가능 합니다.\n현장 방문 접수 부탁드립니다.\n\n* 매장 상황에 따라 예약을 하시고 방문 하셔도 대기시간이 발생할 수 있으시다는 점 참고 부탁드립니다.",
						"bookingPrecautionJson" : [ {
							"desc" : "\u003c\u003c 예약 시간은 꼭 신중하게 선택 부탁드립니다> >\n\n* 디자이너 스케쥴에 따라 예약시간 변경 또는 취소요청이 있을 수 있음을\n양해 부탁드립니다.\n\n*당일 예약 취소나, 직전 예약 취소는 다음 예약이 어려울 수 있습니다.\n\n*앞머리 시술(매직,펌,커트)은 예약이 불가능 합니다.\n현장 방문 접수 부탁드립니다.\n\n* 매장 상황에 따라 예약을 하시고 방문 하셔도 대기시간이 발생할 수 있으시다는 점 참고 부탁드립니다.",
							"title" : null
						} ],
						"bookingGuide" : "예약 주셔서 정말 감사합니다. 최선을 다하여 고객님의 예약시간을 준수하도록 노력하겠지만, 간혹 대기시간이 발생할 수 있는 점 너그러운 양해 부탁드립니다. 고객님의 귀한 방문을 다시 한 번 정말 감사드립니다^^/",
						"isTodayDeal" : false,
						"todayDealJson" : [],
						"isPeriodFixed" : false,
						"isSeatUsed" : false,
						"isAdminBooking" : false,
						"isNPayUsed" : true,
						"businessAddressJson" : {
							"jibun" : "충청북도 청주시 상당구 금천동 227-4 2층",
							"roadAddr" : "충청북도 청주시 상당구 수영로 276 2층",
							"detail" : "금천동 다이소 옆건물 2층",
							"placeName" : null,
							"posLat" : 36.6291877,
							"posLong" : 127.5056473,
							"zoomLevel" : 12,
							"address" : "충청북도 청주시 상당구 수영로 276 2층 (충청북도 청주시 상당구 금천동 227-4 2층)",
							"globalAddress" : null,
							"miniMap" : null,
							"isImpLocationGuide" : true
						},
						"bizItemAddressJson" : {},
						"deliveryAddressJson" : {},
						"businessThumbImage" : "https://ldb-phinf.pstatic.net/20210920_63/1632115488144Ysl6E_JPEG/tu8wuRDTHUclTD7CgtXGQexj.jpg",
						"bizItemThumbImage" : "https://naverbooking-phinf.pstatic.net/20220315_217/1647331900009ajihz_JPEG/KakaoTalk_20220315_171032118.jpg",
						"startDateTime" : "2022-12-02T07:00:00Z",
						"endDateTime" : "2022-12-02T07:30:00Z",
						"globalTimezone" : "Asia/Seoul",
						"bookingCount" : 1,
						"price" : 13000,
						"bizItemPrice" : 0,
						"onsitePrice" : 13000,
						"bizItemDailyPriceJson" : [],
						"priceTypeJson" : [],
						"name" : "송*경",
						"phone" : "010-41**-68**",
						"email" : "sm*******@naver.com",
						"customFormInputJson" : [],
						"termsVersion" : "2017-12-14",
						"optionCategoriesJson" : [ {
							"categoryId" : 2884544,
							"businessId" : 589307,
							"name" : "필수선택 카테고리",
							"depth" : 1,
							"order" : 2,
							"selectionTypeCode" : "CHECK",
							"categoryTypeCode" : "REQUIRED",
							"isDeleted" : false,
							"regDateTime" : "2021-09-24T13:51:21+09:00",
							"impOrder" : 0
						}, {
							"categoryId" : 2884545,
							"businessId" : 589307,
							"name" : "컷",
							"depth" : 1,
							"order" : 3,
							"selectionTypeCode" : "CHECK",
							"categoryTypeCode" : "FIXED",
							"isDeleted" : false,
							"regDateTime" : "2021-09-24T13:51:21+09:00",
							"impOrder" : 1
						} ],
						"bookingOptionJson" : [
								{
									"optionId" : 9233473,
									"stock" : 99999,
									"name" : "당일예약취소&노쇼방지 캠페인",
									"order" : 43,
									"desc" : "성숙한 예약문화와\n서로의 소중한 시간을 존중하는 캠페인을 진행합니다.\n\n당일예약취소, 노쇼 보다는\n미리 사전변경, 취소 해주고\n예약시간을 지켜주시면\n감사하겠습니다.",
									"isFree" : false,
									"inspectionStatusCode" : "IS00",
									"minBookingCount" : 1,
									"maxBookingCount" : 1,
									"isImp" : true,
									"isTodaySoldOut" : false,
									"tagJson" : {
										"tags" : []
									},
									"imagesJson" : {},
									"isDeleted" : false,
									"regDateTime" : "2022-01-06T11:41:01+09:00",
									"translationStatusJson" : {},
									"businessId" : 589307,
									"legalInfoJson" : {},
									"isSoldOut" : false,
									"categoryId" : 2884544,
									"optionResources" : [],
									"schedules" : {
										"2022-12-02" : {
											"stock" : 99999,
											"remainStock" : 99998,
											"bookingCount" : 1,
											"isTodaySoldOut" : false,
											"isSoldOut" : false
										}
									},
									"discountRate" : 0,
									"bookingCount" : 1,
									"sumPrice" : 0,
									"impOrder" : 0,
									"isValid" : true,
									"isOnsitePayment" : false,
									"categoryTypeCode" : "REQUIRED",
									"originalName" : "당일예약취소&노쇼방지 캠페인"
								},
								{
									"optionId" : 8468372,
									"stock" : 99999,
									"name" : "여성 컷",
									"order" : 1,
									"desc" : "컷트만 잘해도 이미지 변신 쉽게 하실수 있습니다.\n원하는 스타일 상담후 고객님의 두상과 모질에 정확한 판단으로 완벽한 스타일을 선사해 드립니다.\n샴푸시3,000원 추가됩니다\n\n디자이너 스케줄에 따라 예약시간 변경또는 취소 요청이 있을 수 있음을 양해 부탁드립니다.",
									"price" : 13000,
									"isFree" : false,
									"inspectionStatusCode" : "IS00",
									"minBookingCount" : 1,
									"maxBookingCount" : 1,
									"isImp" : true,
									"isTodaySoldOut" : false,
									"tagJson" : {
										"tags" : []
									},
									"imagesJson" : {},
									"isDeleted" : false,
									"editedDateTime" : "2022-06-27T16:04:54+09:00",
									"regDateTime" : "2021-09-24T13:59:04+09:00",
									"translationStatusJson" : {},
									"businessId" : 589307,
									"legalInfoJson" : {},
									"isSoldOut" : false,
									"categoryId" : 2884545,
									"optionResources" : [],
									"schedules" : {
										"2022-12-02" : {
											"stock" : 99999,
											"remainStock" : 99999,
											"bookingCount" : 0,
											"isTodaySoldOut" : false,
											"isSoldOut" : false
										}
									},
									"discountRate" : 0,
									"bookingCount" : 1,
									"sumPrice" : 0,
									"impOrder" : 1,
									"isValid" : true,
									"isOnsitePayment" : false,
									"categoryTypeCode" : "FIXED",
									"categoryName" : "컷",
									"originalName" : "여성 컷"
								} ],
						"seatGroupJson" : [],
						"seatJson" : [],
						"bookingPage" : "http://m.booking.naver.com/my/bookings/356288671",
						"userAgentJson" : {
							"raw" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36",
							"os_version" : "windows-10",
							"os" : "windows",
							"device" : "unknown",
							"nClientIp" : "59.26.219.7",
							"NNB" : "JSTXEOCHAW3F6"
						},
						"translateStatusJson" : {},
						"couponJson" : [],
						"refundTimeOffset" : 0,
						"isPossibleUserCancel" : true,
						"isOnsitePayment" : false,
						"isPartialCancelUsed" : false,
						"extraFeeSettingJson" : {},
						"allRefundSettingJson" : {
							"refundLimitHour" : null,
							"isAllRefundAgreed" : false,
							"isAllRefundRequired" : false,
							"allRefundPossibleHours" : 1
						},
						"paymentSettingJson" : {
							"paymentMoment" : "POST",
							"userSelectedPaymentMethod" : "NONE"
						},
						"agencySettingJson" : {
							"bizItemAgencyKey" : "CD_130077",
							"businessAgencyKey" : "CODECOM_CD00001773",
							"isAgencyConnected" : true
						},
						"isAgencyConnected" : true,
						"nPayRegStatusCode" : "PA01",
						"npayRegStatusCode" : "PA01",
						"selectiveOptions" : [
								{
									"optionId" : 9233473,
									"stock" : 99999,
									"name" : "당일예약취소&노쇼방지 캠페인",
									"order" : 43,
									"desc" : "성숙한 예약문화와\n서로의 소중한 시간을 존중하는 캠페인을 진행합니다.\n\n당일예약취소, 노쇼 보다는\n미리 사전변경, 취소 해주고\n예약시간을 지켜주시면\n감사하겠습니다.",
									"isFree" : false,
									"inspectionStatusCode" : "IS00",
									"minBookingCount" : 1,
									"maxBookingCount" : 1,
									"isImp" : true,
									"isTodaySoldOut" : false,
									"tagJson" : {
										"tags" : []
									},
									"imagesJson" : {},
									"isDeleted" : false,
									"regDateTime" : "2022-01-06T11:41:01+09:00",
									"translationStatusJson" : {},
									"businessId" : 589307,
									"legalInfoJson" : {},
									"isSoldOut" : false,
									"categoryId" : 2884544,
									"optionResources" : [],
									"schedules" : {
										"2022-12-02" : {
											"stock" : 99999,
											"remainStock" : 99998,
											"bookingCount" : 1,
											"isTodaySoldOut" : false,
											"isSoldOut" : false
										}
									},
									"discountRate" : 0,
									"bookingCount" : 1,
									"sumPrice" : 0,
									"impOrder" : 0,
									"isValid" : true,
									"isOnsitePayment" : false,
									"categoryTypeCode" : "REQUIRED",
									"originalName" : "당일예약취소&노쇼방지 캠페인"
								},
								{
									"optionId" : 8468372,
									"stock" : 99999,
									"name" : "여성 컷",
									"order" : 1,
									"desc" : "컷트만 잘해도 이미지 변신 쉽게 하실수 있습니다.\n원하는 스타일 상담후 고객님의 두상과 모질에 정확한 판단으로 완벽한 스타일을 선사해 드립니다.\n샴푸시3,000원 추가됩니다\n\n디자이너 스케줄에 따라 예약시간 변경또는 취소 요청이 있을 수 있음을 양해 부탁드립니다.",
									"price" : 13000,
									"isFree" : false,
									"inspectionStatusCode" : "IS00",
									"minBookingCount" : 1,
									"maxBookingCount" : 1,
									"isImp" : true,
									"isTodaySoldOut" : false,
									"tagJson" : {
										"tags" : []
									},
									"imagesJson" : {},
									"isDeleted" : false,
									"editedDateTime" : "2022-06-27T16:04:54+09:00",
									"regDateTime" : "2021-09-24T13:59:04+09:00",
									"translationStatusJson" : {},
									"businessId" : 589307,
									"legalInfoJson" : {},
									"isSoldOut" : false,
									"categoryId" : 2884545,
									"optionResources" : [],
									"schedules" : {
										"2022-12-02" : {
											"stock" : 99999,
											"remainStock" : 99999,
											"bookingCount" : 0,
											"isTodaySoldOut" : false,
											"isSoldOut" : false
										}
									},
									"discountRate" : 0,
									"bookingCount" : 1,
									"sumPrice" : 0,
									"impOrder" : 1,
									"isValid" : true,
									"isOnsitePayment" : false,
									"categoryTypeCode" : "FIXED",
									"categoryName" : "컷",
									"originalName" : "여성 컷"
								} ],
						"requiredOptions" : []
					},
					"payments" : [ {
						"paymentId" : 208900691,
						"bookingId" : 356288671,
						"moment" : "POST",
						"status" : "REGISTERED",
						"amount" : 13000,
						"provider" : "NAVER_PAY",
						"regDateTime" : "2022-11-11T20:14:08+09:00",
						"items" : [ {
							"name" : "당일예약취소&노쇼방지 캠페인",
							"price" : 0,
							"count" : 1,
							"targetType" : "OPTION",
							"targetId" : "9233473"
						}, {
							"name" : "여성 컷",
							"price" : 13000,
							"count" : 1,
							"targetType" : "OPTION",
							"targetId" : "8468372"
						} ],
						"statusHistories" : [ {
							"status" : "REGISTERED",
							"dateTime" : "2022-11-11T20:14:08+09:00"
						} ],
						"providerDiscountAmount" : 0
					} ],
					"policy" : {
						"refundPolicyId" : 1105386,
						"startDate" : "2015-01-01",
						"endDate" : "2099-12-31",
						"businessId" : 589307,
						"policies" : [ {
							"baseDay" : 0,
							"rate" : 100
						} ],
						"policyCode" : "RF01",
						"uncompletedBookingProcessCode" : "UC01",
						"uncompletedBookingRefundRate" : 0,
						"serverTime" : "2022-11-11T20:14:47+09:00"
					},
					"parcelDeliveryCourierCode" : null,
					"parcelDeliveryOriginPlaceId" : null,
					"parcelDeliveryInterlockParcelNum" : null
				}
			}
		</script>
  <script>window.__PLACE_DATA__={}</script>
  <script src="/public/js/mobile-media-viewer.min.js"></script>
  <script id="__LOADABLE_REQUIRED_CHUNKS__" type="application/json">[67,58,0,11,10,8,39]</script>
<script async="" data-chunk="main" src="/static/js/main.376cbb6f.js"></script>
<script async="" data-chunk="My" src="/static/js/My.ec15dbb9.chunk.js"></script>
<script async="" data-chunk="Home"
		src="/static/js/Home.214870ca.chunk.js"></script>
<script async="" data-chunk="Bookings"
		src="/static/js/vendors~Accommodation~Beauty~Booked-Check-Bridge~Bookings~Curation~Episode~Episode-BizItem~Episode-B~81f61aba.61cd0794.chunk.js"></script>
<script async="" data-chunk="Bookings"
		src="/static/js/vendors~Booked-Check-Bridge~Bookings~Orders~ParcelDelivery.996304cb.chunk.js"></script>
<script async="" data-chunk="Bookings"
		src="/static/js/vendors~Booked-Check-Bridge~Bookings~Ordered-Check~Orders.032ea89a.chunk.js"></script>
<script async="" data-chunk="Bookings"
		src="/static/js/Booked-Check-Share-Bridge~Bookings~Orders~ParcelDelivery.e595e93e.chunk.js"></script>
<script async="" data-chunk="Bookings"
		src="/static/js/Bookings.b1ac72e2.chunk.js"></script>
  <div id="mobile_media_viewer"></div>
  
  
  <div id="naver-splugin-wrap" style="display: none; user-select: text;"></div>
	<div id="naver-splugin-dimmed"
		class="naver-splugin-dimmed spi_card_dmm" style="display: none;">
		<div class="naver-splugin-dimmed"></div>
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
	
	document.getElementById("order_id").innerHTML=order_id;
/* 	document.getElementById("book_num").innerHTML=book_num;
	document.getElementById("order_id").innertext=order_id;
	document.getElementById("seller_id").innerHTML=seller_id;
	document.getElementById("seller_name").innerHTML=seller_name;
	document.getElementById("user_name").innerHTML=user_name;
	document.getElementById("reserv_date").innerHTML=reserv_date;
	document.getElementById("user_tel").innerHTML=user_tel;
	document.getElementById("count_pp").innerHTML=count_pp;
	document.getElementById("user_email").innerHTML=user_email;
	document.getElementById("reserv_pay").innerHTML=reserv_pay;
	document.getElementById("reg_date").innerHTML=reg_date;
	document.getElementById("reserv_status").innerHTML=reserv_status;
	document.getElementById("reserv_time").innerHTML=reserv_time; */
	

</script>


</html>