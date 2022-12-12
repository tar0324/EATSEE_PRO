package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ec.user.service.MailService;

@Controller("mailController")
public class MailControllerImpl implements MailController {

//	private MailService mailService;
	
	@Autowired
	private MailService mailService;

	@Override
	@RequestMapping(value = "/user/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email, HttpServletRequest request) throws Exception {
		String user_email = request.getParameter("email");
		System.out.println("user_email ::: " + user_email);
		
		return mailService.joinEmail(user_email);
		
	}
	
}

	// MimeMessage 媛앹껜瑜� 吏곸젒 �깮�꽦�븯�뿬 硫붿씪�쓣 諛쒖넚�븯�뒗 諛⑸쾿
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/sendMail.do", method = RequestMethod.GET) public void
	 * sendMailTest() throws Exception{
	 * 
	 * String subject = "test 硫붿씪"; String content = "硫붿씪 �뀒�뒪�듃 �궡�슜" +
	 * "<img src='C:/test/ec-master/src/main/webapp/resources/image/logo.png'>";
	 * String from = "ec_test@naver.com"; String to = "ec_test@naver.com";
	 * 
	 * try { MimeMessage mail = mailSender.createMimeMessage(); MimeMessageHelper
	 * mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); // true�뒗 硫��떚�뙆�듃 硫붿꽭吏�瑜�
	 * �궗�슜�븯寃좊떎�뒗 �쓽誘�
	 * 
	 * 
	 * �떒�닚�븳 �뀓�뒪�듃 硫붿꽭吏�留� �궗�슜�떆�뿏 �븘�옒�쓽 肄붾뱶�룄 �궗�슜 媛��뒫 MimeMessageHelper mailHelper = new
	 * MimeMessageHelper(mail,"UTF-8");
	 * 
	 * 
	 * mailHelper.setFrom(from); // 鍮덉뿉 �븘�씠�뵒 �꽕�젙�븳 寃껋� �떒�닚�엳 smtp �씤利앹쓣 諛쏄린 �쐞�빐 �궗�슜 �뵲�씪�꽌
	 * 蹂대궡�뒗�씠(setFrom())諛섎뱶�떆 �븘�슂 // 蹂대궡�뒗�씠�� 硫붿씪二쇱냼瑜� �닔�떊�븯�뒗�씠媛� 蹂쇰븣 紐⑤몢 �몴湲� �릺寃� �썝�븯�떊�떎硫� �븘�옒�쓽 肄붾뱶瑜� �궗�슜�븯�떆硫�
	 * �맗�땲�떎. //mailHelper.setFrom("蹂대궡�뒗�씠 �씠由� <蹂대궡�뒗�씠 �븘�씠�뵒@�룄硫붿씤二쇱냼>"); mailHelper.setTo(to);
	 * mailHelper.setSubject(subject); mailHelper.setText(content, true); // true�뒗
	 * html�쓣 �궗�슜�븯寃좊떎�뒗 �쓽誘몄엯�땲�떎. // html�쓣 �궗�슜�븯寃뚮릺硫� �씠誘몄�瑜� 泥⑤� �븷 �닔 �엳�뒗 <img>�깭洹몃�� �궗�슜 �븷 �닔 �엳�뒿�땲�떎.
	 * 
	 * �떒�닚�븳 �뀓�뒪�듃留� �궗�슜�븯�떊�떎硫� �떎�쓬�쓽 肄붾뱶瑜� �궗�슜�븯�뀛�룄 �맗�땲�떎. mailHelper.setText(content);
	 * 
	 * // �뾽濡쒕뱶 �맂 �뙆�씪�쓣 �쟾�넚�븯湲� �쐞�빐�꽑 �븘�옒�궡�슜�쓽 �겢�옒�뒪 import媛� �븘�슂濡쒗빀�땲�떎. FileSystemResource file = new
	 * FileSystemResource(new
	 * File("C:/test/ec-master/src/main/webapp/resources/image/logo.png"));
	 * mailHelper.addAttachment("logo.png", file);
	 * 
	 * mailSender.send(mail);
	 * 
	 * } catch(Exception e) { e.printStackTrace(); }
	 * 
	 * }
	 */



/*
 * @Override
 * 
 * @RequestMapping(value="/sendMail.do", method = RequestMethod.GET) public void
 * sendSimpleMail(HttpServletRequest request, HttpServletResponse
 * response)throws Exception{ request.setCharacterEncoding("utf-8");
 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
 * response.getWriter(); //mailService�쓽 sendMail()硫붿꽌�뱶濡� 硫붿씪愿��젴媛�(二쇱냼,�젣紐�,�궡�슜)�쓣 �쟾�떖�빀�땲�떎.
 * mailService.sendMail("ec_test@naver.com", "�뀒�뒪�듃 硫붿씪", "�븞�뀞�븯�꽭�슂.蹂대궦 硫붿씪 �궡�슜�엯�땲�떎.");
 * //servlet=context.xml�뿉�꽌 �옄二쇰낫�깂�꽕�젙�븳 硫붿씪二쇱냼濡� xml�뿉�꽌 吏��젙�븳�궡�슜�쓣 蹂대깄�땲�떎.
 * mailService.sendPreConfiguredMail("�뀒�뒪�듃 硫붿씪�엯�땲�떎."); out.print("硫붿씪�쓣 蹂대깉�뒿�땲�떎."); }
 * 
 * }
 */
