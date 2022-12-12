package com.spring.ec.user.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.NoUserBookVO;

public interface MemberService {
	//회占쏙옙占쏙옙占쏙옙
	public int addMember(MemberVO memberVO) throws DataAccessException; 
	//占싸깍옙占쏙옙
	public MemberVO login(MemberVO member)throws DataAccessException;
	
	public int idCheck(String user_id) throws Exception;
	//占쏙옙橘占싫� 찾占쏙옙
	public int nickCheck(String user_nick) throws Exception;
	
	public int emailCheck(String user_email) throws Exception;
	
	public int mobileCheck(String mobile) throws Exception;
	
	public String find_pwd_Result(MemberVO member) throws DataAccessException;
	//占쏙옙占싱듸옙 찾占쏙옙
	public String find_id_Result(MemberVO member) throws DataAccessException;
	public NoUserBookVO selectnouser(Map<String, String> listMap) throws DataAccessException;

}