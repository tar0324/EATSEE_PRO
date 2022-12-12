package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;

public interface MypageService {
	public List<SellerVO> selectwish(String user_id) throws Exception;
	public int selectwishsum(String user_id) throws Exception;
	public List<ReviewVO> selectReview(String user_id) throws Exception;
	public List<BoardVO> selectBoard(String user_id) throws Exception;
	public List<ReservVO> selectBook(String user_id) throws Exception;
	public List<AskVO> selectAsk(String user_id) throws Exception;
	
	//�쉶�썝�젙蹂� �뾽�뜲�씠�듃(update user Information)
    public MemberVO userSelect(String user_id) throws Exception;
	public int passChk(Map<String, String> listMap) throws Exception;
    /* public void userUpdate(MemberVO vo) throws Exception; */
    /*
     * //鍮꾨�踰덊샇 蹂�寃�(pwd change)
     * public void userPwdChange(MemberVO vo) throws Exception;
     * //�쉶�썝�깉�눜(userDelete)
     * public void userDelete(String user_id) throws Exception;
     */
    /* public MemberVO userUpdate(Map<String, String> userMap) throws Exception; */
    /*
     * public int updatePwdUser(Map<String, String> listMap) throws Exception;
     * public List<MemberVO> userUpdate(String user_id) throws Exception;
     * public List updatePwdUser(String user_id) throws DataAccessException,
     * Exception;
     */
}
