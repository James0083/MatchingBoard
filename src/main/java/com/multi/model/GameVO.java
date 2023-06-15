package com.multi.model;

import lombok.Data;

@Data
public class GameVO {

	private String name;
	
	private int minPeople;
	private int maxPeople;
	
	private int playtime;

	private int age;
	private int pubYear;
	private String genre;
	private String explane;
	
	private String expl_link;
	private String shop_link1;
	private String shop_link2;
	
	private String gimage;
	
}
