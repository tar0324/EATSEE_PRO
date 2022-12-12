package com.spring.ec.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.ec.user.dao.MemberDAO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.NoUserBookVO;

@Service("memService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	// 회占쏙옙占쏙옙占�
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		return memberDAO.loginById(memberVO);
	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public int idCheck(String user_id) throws Exception{
		return memberDAO.idCheck(user_id);
	}
	
	@Override
	public int nickCheck(String user_nick) throws Exception{
		return memberDAO.nickCheck(user_nick);
	}
	
	@Override
	public int emailCheck(String user_email) throws Exception{
		return memberDAO.emailCheck(user_email);
	}
	
	@Override
	public int mobileCheck(String mobile) throws Exception{
		return memberDAO.mobileCheck(mobile);
	}


	@Override
	public String find_pwd_Result(MemberVO member) throws DataAccessException {
		return memberDAO.find_pwd_Result(member);
	}

	@Override
	public String find_id_Result(MemberVO member) throws DataAccessException {
		return memberDAO.find_id_Result(member);
	}
	
	@Override
	public NoUserBookVO selectnouser(Map<String, String> listMap) throws DataAccessException {
		return memberDAO.selectnouser(listMap);
	}
	
	

}