package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.dao.MypageDAO;
import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDAO mypageDAO;
	
	//찜한가게
	@Override
	public List<SellerVO> selectwish(String user_id) throws Exception {
		List<SellerVO> WishList = mypageDAO.selectwish(user_id);
		return WishList;
	}
	
	@Override
	public int selectwishsum(String user_id) throws Exception {
		int wishsum = mypageDAO.selectwishsum(user_id);
		return wishsum;
	}
	
	
	
	//리뷰
	@Override
	public List<ReviewVO> selectReview(String user_id) throws Exception {
		List<ReviewVO> ReviewList = mypageDAO.selectReview(user_id);
		return ReviewList;
	}
	
	//게시글
	@Override
	public List<BoardVO> selectBoard(String user_id) throws Exception {
		List<BoardVO> BoardList = mypageDAO.selectBoard(user_id);
		return BoardList;
	}
	
	//예약
	@Override
	public List<ReservVO> selectBook(String user_id) throws Exception {
		List<ReservVO> ReservList = mypageDAO.selectBook(user_id);
		return ReservList;
	}
	
	//1:문의
	@Override
	public List<AskVO> selectAsk(String user_id) throws Exception {
		List<AskVO> AskList = mypageDAO.selectAsk(user_id);
		return AskList;
	}
	
	
	
	 //�뙣�뒪�썙�뱶 泥댄겕
    public int passChk(Map<String, String> listMap) throws Exception {
        int result = mypageDAO.passChk(listMap);
        return result;
    }
    
  //�젙蹂� �닔�젙(Changing Information)
    @Override
    public MemberVO userSelect(String user_id) throws Exception {
        MemberVO infovo = mypageDAO.userSelect(user_id);
        return infovo;
    }
    
  //�쉶�썝�젙蹂� �뾽�뜲�씠�듃(update user Information)
  /*
   * public void userUpdate(MemberVO vo) throws Exception {
   * mypageDAO.userUpdate(vo);
   * }
   */
  /*
   * //鍮꾨�踰덊샇 蹂�寃�(pwd change)
   * public void userPwdChange(MemberVO vo) throws Exception {
   * mypageDAO.userUpdate(vo);
   * }
   * 
   * //�쉶�썝�깉�눜
   * public void userDelete(String user_id) throws Exception {
   * return;
   * }
   */
    /*
     * //�젙蹂� �닔�젙(Changing Information)
     * 
     * @Override
     * public MemberVO userUpdate(Map<String, String> userMap) throws Exception {
     * MemberVO infovo = mypageDAO.userSelect(userMap);
     * return infovo;
     * }
     */
     /*
     
     */
    
   
/*
 * @Override
 * public List updatePwdUser(String user_id) throws Exception {
 * return mypageDAO.updatePwdUser(user_id);
 * }
 */
    
}