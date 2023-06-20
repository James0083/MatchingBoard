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
	private double stars;
	private int reviews;//review 갯수
	
	/*
	 * setStars 지정해놓은것 사라짐
	 * //별점을 설정 public void setStars(double rating) {
	 * this.stars=(this.stars*this.reviews + rating)/(++this.reviews); }
	 */
}
