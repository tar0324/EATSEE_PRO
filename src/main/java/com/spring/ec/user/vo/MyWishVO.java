package com.spring.ec.user.vo;



import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("mywishVO")
public class MyWishVO {

	private int seller_num;
	private String category_code;
	private String seller_id;
	private String seller_pw;
	private String seller_tel;
	private String seller_bizReg;
	private String seller_name;
	private String s_name;
	private String seller_email;
	private String seller_addr;
	private String seller_detailaddr;
	private String addr_num;
	private String bizReg_image_name;
	private String area;
	private String keyword;
	private int storeInfo_num;
	private String image_fileName;
	private String store_introduce;
	private String openTime;
	private String closeDay;
	private String store_nic;
	private String store_benefit;
	private int pro_num;
	private String pro_name;
	private String pro_price;
	private Date reg_date;
	private Date mod_date;
	
	public MyWishVO() {

	}

	public MyWishVO(int seller_num, String category_code, String seller_id, String seller_pw, String seller_tel, String seller_bizReg, String seller_name, String s_name,String seller_email,String seller_addr,String bizReg_image_name,String area,String keyword,int storeInfo_num, String image_fileName, String store_introduce, String openTime, String closeDay, String store_nic,String store_benefit,	int pro_num, String pro_name, String pro_price, Date reg_date, Date mod_date, String birth_yy, String birth_mm, String birth_dd) {
		this.seller_num = seller_num;
		this.category_code = category_code;
		this.seller_id= seller_id;
		this.seller_pw = seller_pw;
		this.seller_tel = seller_tel;
		this.seller_bizReg = seller_bizReg;
		this.seller_name = seller_name;
		this.s_name = s_name;
		this.seller_email = seller_email;
		this.seller_addr = seller_addr;
		this.bizReg_image_name = bizReg_image_name;
		this.keyword = keyword;
		this.storeInfo_num = storeInfo_num;
		this.image_fileName = image_fileName;
		this.store_introduce = store_introduce;
		this.openTime = openTime;
		this.closeDay = closeDay;
		this.store_nic = store_nic;
		this.store_benefit = store_benefit;
		this.pro_num = pro_num;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
	}

	
}
