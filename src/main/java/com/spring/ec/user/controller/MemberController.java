package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.user.vo.MemberVO;

public interface MemberController {
	// �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�벝�삕
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �쉶�뜝�룞�삕�뜝�룞�삕�뜝占�
	// �뜝�떥源띿삕�뜝�룞�삕 李� �뜝�룞�삕�뜝�룞�삕(�뜝�룞�삕�뜝�룞�삕/�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �뜝�룞�삕�뜝�룞�삕 �뜝�떥源띿삕�뜝�룞�삕李�
	public ModelAndView memberform_main(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕
	public ModelAndView memberform_udetail(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �뜝�룞�삕�뜝�룞�삕 �뜝�떥源띿삕�뜝�룞�삕
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占�
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �뜝�떥洹몄븘�슱�삕
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// �뜝�룞�삕�뜝�떛�벝�삕 李얍뜝�룞�삕
//	public String idCheck(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws Exception;
	public String idCheck(HttpServletRequest request) throws Exception;

	public String nickCheck(HttpServletRequest request) throws Exception;
	
	 public String emailCheck(HttpServletRequest request) throws Exception;
	
	 public String mobileCheck(HttpServletRequest request) throws Exception;

	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �뜝�룞�삕�뜝�떛�벝�삕 李얍뜝�룞�삕 �뜝�룞�삕�뜝�떆占�
	public ModelAndView find_id_Result(@ModelAttribute("member") MemberVO member,RedirectAttributes rAttr, HttpServletRequest request,HttpServletResponse response) throws Exception;

	// �뜝�룞�삕艅섇뜝�떕占� 李얍뜝�룞�삕
	public ModelAndView find_pwd(RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;

	// �뜝�룞�삕艅섇뜝�떕占� 李얍뜝�룞�삕 �뜝�룞�삕�뜝占� 李�
	public ModelAndView find_pwd_Result(@ModelAttribute("findpwdmem") MemberVO memberVO,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView loginbanner(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView nouserbook(@RequestParam(value = "user_name") String user_name,@RequestParam(value = "order_id") String order_id,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView nousercheckbook(HttpServletRequest request, HttpServletResponse response) throws Exception;
}