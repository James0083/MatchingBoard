package com.multi.model;

import lombok.Data;

@Data
public class ShopVO {

	private String sname;
	private String saddr;
	private String smenu_img;
	private String price_img;
	private int hour_price;
	private int unlim_price;
	private int stars;
	
}