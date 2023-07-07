package com.multi.model;

import lombok.Data;

@Data
public class WishListVO {
	private String uuid; //social
	private String roomid; //room
	private int wlike; //좋아요
//	private int likecount; //좋아요 여부

	public WishListVO() {
		super();
	}
	
	public WishListVO(String uuid, String roomid) {
		this.uuid = uuid;
		this.roomid = roomid;
//		this.wlike = wlike;
//		this.likecount = likecount;
	}

	public WishListVO(String uuid, String roomid, int likecount) {
		this.uuid = uuid;
		this.roomid = roomid;
//		this.wlike = wlike;
//		this.likecount = likecount;
	}
}
