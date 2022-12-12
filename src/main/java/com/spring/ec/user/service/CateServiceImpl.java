package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.dao.CateDAO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Service("categoryService")
public class CateServiceImpl implements CateService {
	@Autowired
	CateDAO cateDAO;

	//���� ����Ʈ(store list)
	@Override
	public List<SellerVO> selectAllStores() throws Exception {
		List<SellerVO> StoreList = cateDAO.selectAllStores();
		return StoreList;
	}

	//���� �˻� ����Ʈ(store search list)
	@Override
	public List<SellerVO> selectSearchStores(Map<String, String> listMap) throws Exception {
		List<SellerVO> StoreList = cateDAO.selectSearchStores(listMap);
		return StoreList;
	}

	@Override
	public List<SellerVO> selectsearcharea(String area) throws Exception {
		List<SellerVO> StoreList = cateDAO.selectsearcharea(area);
		return StoreList;
	}

	//���� �� ����(Shop Details)
	@Override
	public StoreVO selectstoreInfo(String seller_id) throws Exception {
		StoreVO StoreList = cateDAO.selectstoreInfo(seller_id);
		return StoreList;
	}

	//���� �޴� ����Ʈ(store menu list)
	@Override
	public List<ProductVO> selectMenu() throws Exception {
		List<ProductVO> MenuList = cateDAO.selectMenu();
		return MenuList;
	}

	//���� ���� ����Ʈ(store review list)
	@Override
	public List<ReviewVO> selectReview() throws Exception {
		List<ReviewVO> ReviewList = cateDAO.selectReview();
		return ReviewList;
	}

	//���� ���ƿ� ����(update review like)
	@Override
	public int updatereviewlike(int reviewnum) throws Exception {
		return cateDAO.updatereviewlike(reviewnum);
	}

	//���� ���ƿ� ��(The number of likes for reviews)
	@Override
	public String selectreviewlike(int reviewnum) throws Exception {
		return cateDAO.selectreviewlike(reviewnum);
	}

	//���� ��� ����, ���� ����(Review Average Score, Review Count)
	@Override
	public List<ReviewVO> selectReviewavgsum() throws Exception {
		List<ReviewVO> ReviewList = cateDAO.selectReviewavgsum();
		return ReviewList;
	}

	//���� ������2(Shop Details) - ����
	@Override
	public ReservVO selectStoreInfo(String seller_id) throws Exception {
		return cateDAO.selectStoreInfo2(seller_id);
	}

	@Override
	public int addwish(Map<String, String> listMap) throws DataAccessException {
		return cateDAO.addwish(listMap);
	}

	//�ش� ������ ���� (wish list)
	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> WishList = cateDAO.selectwish(user_id);
		return WishList;
	}

	//�� ���(delete wish)
	@Override
	public int delwish(Map<String, String> listMap) throws DataAccessException {
		return cateDAO.delwish(listMap);
	}

	//�� ����(Total number of wishes)
	@Override
	public List selectwishsum() throws DataAccessException {
		return cateDAO.selectwishsum();
	}

	//���� �ۼ� (add review)
	@Override
	public int addreview(ReviewVO review) throws Exception {
		return cateDAO.addreview(review);
	}

	//�޴� �� ����(Total number of menus)
	@Override
	public List selectprosum() throws Exception {
		return cateDAO.selectprosum();
	}

	// �� ���� (wish sum)
	@Override
	public String selectsellerwishsum(String seller_id) throws DataAccessException {
		return cateDAO.selectsellerwishsum(seller_id);
	}
	
	//ȸ�� ���� (member reservation)
	@Override
	public int addBooking(Map booking) throws Exception{
		return cateDAO.insertBooking(booking);
	}
	
	//��ȸ�� ���� (non-member reservation)
	@Override
	public int addNoUserBooking(Map booking) throws Exception{
		return cateDAO.insertNoUserBooking(booking);
	}
}