package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//찜가게
	@Override
	public List<SellerVO> selectwish(String user_id) throws Exception {
		List<SellerVO> articlesList = sqlSession.selectList("mapper.mypage.selectwish", user_id);
		return articlesList;
	}
	
	//찜가게 수
	@Override
	public int selectwishsum(String user_id) throws Exception {
		int wishsum = sqlSession.selectOne("mapper.mypage.selectwishsum", user_id);
		return wishsum;
	}
	
	
	
	//由щ럭紐⑸줉
	@Override
	public List<ReviewVO> selectReview(String user_id) throws Exception {
		List<ReviewVO> articlesList = sqlSession.selectList("mapper.mypage.selectReview", user_id);
		return articlesList;
	}
	
	
	//癒뱁뵆由щ낵�뵆由щぉ濡�
	@Override
	public List<BoardVO> selectBoard(String user_id) throws Exception {
		List<BoardVO> BoardList = sqlSession.selectList("mapper.mypage.selectBoard", user_id);
		return BoardList;
	}

	// �삁�빟紐⑸줉
	@Override
	public List<ReservVO> selectBook(String user_id) throws Exception {
		List<ReservVO> ReservList = sqlSession.selectList("mapper.mypage.selectBook", user_id);
		return ReservList;
	}

	// 1:1臾몄쓽紐⑸줉
	@Override
	public List<AskVO> selectAsk(String user_id) throws Exception {
		List<AskVO> AskList = sqlSession.selectList("mapper.mypage.selectAsk", user_id);
		return AskList;
	}
	
    // 鍮꾨�踰덊샇 �솗�씤(user_pwd check)
	@Override
	public int passChk(Map<String, String> listMap) throws DataAccessException {
	    int result = sqlSession.selectOne("mapper.mypage.passChk", listMap);
	    return result;
	}
	
	// �젙蹂� 蹂댁뿬二쇨린(When MyPage is opened, user information is loaded)
	@Override
	public MemberVO userSelect(String user_id) throws Exception {
	    MemberVO infovo = sqlSession.selectOne("mapper.mypage.userSelect",user_id);
	    return infovo;
    }
	
	//�쉶�썝�젙蹂� �뾽�뜲�씠�듃(update user Information)
    @Override
    public void userUpdate(MemberVO vo) throws Exception {
        sqlSession.update("mapper.mypage.userUpdate", vo);
    }
    
    //鍮꾨�踰덊샇 蹂�寃�(pwd change)
    public void userPwdChange(MemberVO vo) throws Exception {
    	sqlSession.update("mapper.mypage.userPwdChange", vo);
    }
    
      //�쉶�썝 �깉�눜
      @Override
      public void userDelete(String user_id) throws Exception {
      int result = sqlSession.delete("mapper.member.userDelete", user_id);
      return;
      }
     
}
