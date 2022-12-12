package com.spring.ec.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.user.service.MypageService;
import com.spring.ec.user.vo.MemberVO;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
    private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
    private static final String U_IMAGE_REPO = "C:\\board\\u_board_imagefile";
    public static final int pagePerList = 10;
    public static final int pagingCount = 10;
    @Autowired
    private MypageService mypageService;
    
    @Autowired
    MemberVO memberVO;

    @Override
    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = "/mypage";
        ModelAndView mav = new ModelAndView(viewName);

        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();
        System.out.println(user_id);
        // 찜한가게
        List wishList = mypageService.selectwish(user_id);
        int wishSum = mypageService.selectwishsum(user_id);
        // 리뷰
        List ReviewList = mypageService.selectReview(user_id);
        // 게시글
        List BoardList = mypageService.selectBoard(user_id);
        //예약
        List BookList = mypageService.selectBook(user_id);
        // 1:1문의 리스트
        List AskList = mypageService.selectAsk(user_id);
        
        mav.addObject("wishList", wishList);
        mav.addObject("wishSum", wishSum);
        mav.addObject("reviewList", ReviewList);
        mav.addObject("boardList", BoardList);
        mav.addObject("bookList", BookList);
        mav.addObject("askList", AskList);
        return mav;
    }

    @Override
    @RequestMapping(value = "/mypage/my_pList.do", method = RequestMethod.GET)
    public ModelAndView myplist(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();

        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();

        // 癒뱁뵆由щ낵�뵆由� 由ъ뒪�듃
        List BoardList = mypageService.selectBoard(user_id);
        mav.addObject("boardList", BoardList);
        mav.setViewName(viewName);
        return mav;
    }

    @Override
    @RequestMapping(value = "/mypage/uReview.do", method = RequestMethod.GET)
    public ModelAndView uReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();

        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();

        // 由щ럭 由ъ뒪�듃
        List ReviewList = mypageService.selectReview(user_id);
        mav.addObject("reviewList", ReviewList);
        mav.setViewName(viewName);
        return mav;
    }

    @Override
    @RequestMapping(value = "/mypage/uBook.do", method = RequestMethod.GET)
    public ModelAndView uBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();

        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();

        // �삁�빟 由ъ뒪�듃
        List BookList = mypageService.selectBook(user_id);
        mav.addObject("bookList", BookList);
        mav.setViewName(viewName);
        return mav;
    }

    @Override
    @RequestMapping(value = "/mypage/uLike.do", method = RequestMethod.GET)
    public ModelAndView uLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();

        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();

        // 李쒕ぉ濡�
        List wishList = mypageService.selectwish(user_id);
        mav.addObject("wishList", wishList);
        mav.setViewName(viewName);
        return mav;
    }

    @Override
    @RequestMapping(value = "/mypage/uAsk.do", method = RequestMethod.GET)
    public ModelAndView uAsk(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();

        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();

        // 1:1臾몄쓽 由ъ뒪�듃
        List AskList = mypageService.selectAsk(user_id);
        mav.addObject("askList", AskList);
        mav.setViewName(viewName);
        return mav;
    }

    @Override
    @RequestMapping(value = "/mypage/recent_view.do", method = RequestMethod.GET)
    public ModelAndView recentView(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();

        mav.setViewName(viewName);
        return mav;
    }

    // �궡 �젙蹂� �닔�젙 �늻瑜대㈃ 鍮꾨�踰덊샇 �솗�씤李쎌쑝濡� �씠�룞(edit user information go to password check)
    @Override
    @RequestMapping(value = "/mypage/pwdCheckPage.do", method = RequestMethod.GET)
    public ModelAndView pwdCheckPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);
        return mav;
    }
    
    //鍮꾨�踰덊샇 �솗�씤(password Check)
    @ResponseBody
    @RequestMapping(value = "/mypage/myinfo.do", method = RequestMethod.POST)
    public ModelAndView myinfo(@RequestParam("user_pwd") String user_pwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
       
        Map<String, String> listMap = new HashMap<String, String>();
        
        MemberVO vo = (MemberVO) session.getAttribute("member"); //�꽭�뀡�뿉 �엳�뒗 �젙蹂� 媛��졇�삤湲�
        String user_id = vo.getUser_id(); 
        listMap.put("user_id", user_id); //�꽭�뀡�뿉 �엳�뒗 id �젙蹂� 媛��졇�삤湲�
        listMap.put("user_pwd", user_pwd);
        
        int result = mypageService.passChk(listMap);
        
        MemberVO infovo;
        
        if(result == 1)  {
            infovo = mypageService.userSelect(user_id);
            mav.addObject("infovo", infovo);
            mav.setViewName(viewName);
        } else {
              //鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�쓣 �븣 (When pwd don't match)
              mav.setViewName("redirect:/mypage/pwdCheckPage.do");
              mav.addObject("msg", "鍮꾨�踰덊샇媛� �옒紐삳릺�뿀�뒿�땲�떎.");
        }
     
        return mav;
}
    
/*
 * //�쉶�썝�젙蹂� �뾽�뜲�씠�듃(update user Information)
 * 
 * @RequestMapping(value="/mypage/my_info.do", method = RequestMethod.GET)
 * public String my_infoview() throws Exception {
 * return "mypage/my_info";
 * }
 * 
 * @RequestMapping(value="/mypage/userUpdate.do", method = RequestMethod.POST)
 * public String userUpdate(MemberVO vo, HttpSession session) throws Exception {
 * mypageService.userUpdate(vo);
 * session.invalidate();
 * return "redirect:/";
 * }
 */
/*
 * //鍮꾨�踰덊샇 蹂�寃�(pwd change)
 * 
 * @RequestMapping(value="/mypage/changePwd", method = RequestMethod.GET)
 * public String changePwd() throws Exception {
 * return "mypage/userPwdChage";
 * }
 * 
 * @RequestMapping(value="/mypage/userPwdChange.do", method=RequestMethod.POST)
 * public String userPwdChange(MemberVO vo, HttpSession session) throws
 * Exception {
 * mypageService.userPwdChange(vo);
 * session.invalidate();
 * return "redirect:/${contextPath}/mypage/userPwdChange";
 * }
 * 
 * //�쉶�썝�깉�눜
 * 
 * @Override
 * 
 * @RequestMapping(value="/mypage/userDelete.do", method= RequestMethod.GET)
 * public ModelAndView userDelete(@RequestParam("user_id") String user_id,
 * HttpServletRequest request, HttpServletResponse response) throws Exception {
 * request.setCharacterEncoding("utf-8");
 * mypageService.userDelete(user_id);
 * ModelAndView mav= new ModelAndView("redirect:/mypage/main.do");
 * return mav;
 * }
 */
    
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/mypage/userUpdate.do", method = RequestMethod.GET)
	 * public List<MemberVO> userUpdate(@ModelAttribute MemberVO member,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8");
	 * response.setContentType("html/text;charset=utf-8"); String viewName =
	 * (String) request.getAttribute("viewName"); ModelAndView mav = new
	 * ModelAndView();
	 * 
	 * HttpSession session = request.getSession(); MemberVO mm = (MemberVO)
	 * session.getAttribute("member"); String user_id = mm.getUser_id();
	 * 
	 * // 1:1臾몄쓽 由ъ뒪�듃 List userUpdate = mypageService.userUpdate(user_id);
	 * 
	 * mav.addObject("userUpdate", userUpdate); return userUpdate; }
	 */
    
/*
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/mypage/userUpdate.do", method =RequestMethod.GET)
 * public ModelAndView userUpdate(@ModelAttribute("MemberVO") member,
 * HttpServletRequest request, HttpServletResponse response) throws Exception {
 * String viewName = (String) request.getAttribute("viewName");
 * ModelAndView mav = new ModelAndView();
 * request.setCharacterEncoding("UTF-8");
 * HttpSession session = request.getSession();
 * 
 * MemberVO vo = (MemberVO) session.getAttribute("member"); //�꽭�뀡�뿉 �엳�뒗 �젙蹂� 媛��졇�삤湲�
 * String user_id = vo.getUser_id();
 * 
 * 
 * 
 * 
 * }
 */
    
    /*
     * @Override
     * 
     * @RequestMapping(value = "/mypage/myinfo.do", method = RequestMethod.GET)
     * public ModelAndView myinfo(HttpServletRequest request, HttpServletResponse
     * response) throws Exception {
     * return ;
     * 
     * }
     */
   
    /*/ * @RequestMapping(value = "/mypage/userUpdate.do", method = RequestMethod.POST)
     * public String registerUpdate(MemberVO vo, HttpSession session) throws
     * Exception {
     * service.selectInfo(vo);
     * session.invalidate();
     * return "redirect:/";
     * }*/
    
    /*
     * //�쉶�썝�젙蹂� �뾽�뜲�씠�듃
     * 
     * @ResponseBody
     * 
     * @RequestMapping(value = "/mypage/userUpdate.do", method = RequestMethod.GET)
     * public ModelAndView userUpdate(HttpServletRequest request,
     * HttpServletResponse response) throws Exception {
     * String viewName = "/mypage";
     * ModelAndView mav = new ModelAndView(viewName);
     * request.setCharacterEncoding("UTF-8");
     * mav.setViewName(viewName);
     * return mav;
     * }
     * 
     * 
     * 
     * 
     * // 鍮꾨�踰덊샇 蹂�寃�
     * 
     *
     * 
     * // �쁽�옱 pw�� 蹂�寃쏀븷 pw 媛� 媛��졇�삤湲�
     * String pwd = request.getParameter("user_pwd");
     * String newPwd = request.getParameter("new_user_pwd");
     * // �꽭�뀡�뿉�꽌 �빐�떦 �쑀��瑜� 援щ텇�븷 �닔 �엳�뒗 �젙蹂대�� 異붿텧(userID 異붿텧)
     * String user_id = ((MemberVO)
     * request.getSession().getAttribute("member")).getUser_id();
     * 
     * HttpSession session = request.getSession();
     * Map<String, String> ppp = new HashMap<String, String>();
     * ppp.put("user_id", user_id);
     * ppp.put("pwd", pwd);
     * ppp.put("newPwd", newPwd);
     * MemberVO mm = (MemberVO) session.getAttribute("member");
     * user_id = mm.getUser_id();
     * 
     * int result = mypageService.updatePwdUser(ppp);
     * 
     * RequestDispatcher view =
     * request.getRequestDispatcher("/views/user/userPwdchResult.jsp");
     * if(session.getAttribute("member")!=null) { // �쉶�썝 �젙蹂대�� 爰쇰깉�쓣�븣 �엳�떎硫� -> 濡쒓렇�씤�븳 �궗�슜�옄�씪硫�
     * view = request.getRequestDispatcher("/views/member/myPagePasswordCheck.jsp");
     * }else { // �쉶�썝 �젙蹂대�� 爰쇰깉�쓣�븣 �뾾�떎硫�-> 鍮꾨줈洹몄씤�븳 �궗�슜�옄�씪硫�
     * view = request.getRequestDispatcher("/views/commons/error.jsp");
     * }
     * 
     * view.forward(request, response);
     * 
     * }
     */

}
