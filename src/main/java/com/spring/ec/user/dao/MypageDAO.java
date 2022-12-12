package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;

public interface MypageDAO {
	public List<SellerVO> selectwish(String user_id) throws Exception;
	public List<ReviewVO> selectReview(String user_id) throws Exception;
	public List<BoardVO> selectBoard(String user_id) throws Exception;
	public List<ReservVO> selectBook(String user_id) throws Exception;
	public List<AskVO> selectAsk(String user_id) throws Exception;
	public int selectwishsum(String user_id) throws Exception;
    //鍮꾨�踰덊샇 泥댄겕(Check Password)
	public int passChk(Map<String, String> listMap) throws DataAccessException;
	//�쉶�썝�젙蹂� �뱾�뼱媛�湲� �쟾 �젙蹂� 蹂댁뿬二쇨린
	public MemberVO userSelect(String user_id) throws Exception;
	//�쉶�썝�젙蹂� �뾽�뜲�씠�듃(update user Information)
    public void userUpdate(MemberVO vo) throws Exception;
    //鍮꾨�踰덊샇 蹂�寃�(pwd change)
    public void userPwdChange(MemberVO vo) throws Exception;
    //�쉶�썝�깉�눜
    public void userDelete(String user_id) throws Exception;
		
	
    
    /*
     * //鍮꾨�踰덊샇 蹂�寃�
     * int updatePwdUser(Map<String, String> ppp) throws DataAccessException;
     * 
     */
	
}
