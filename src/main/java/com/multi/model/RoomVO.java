package com.multi.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RoomVO {

	private int roomid;
	private String rname;
	private String rplace;
	private int rmaxpeople;
	private String rgenre;
	private String rgame;
	private String rstr;
	
//	private Date rdate;
//	private Time rtime;
	private Timestamp rdatetime;
	
	
	public RoomVO(int roomid, String rname, String rplace, int rmaxpeople, String rgenre, String rgame, String rstr,
			Timestamp rdatetime) {
		super();
		this.roomid = roomid;
		this.rname = rname;
		this.rplace = rplace;
		this.rmaxpeople = rmaxpeople;
		this.rgenre = rgenre;
		this.rgame = rgame;
		this.rstr = rstr;
		this.rdatetime= rdatetime;
	}



	public RoomVO() {
		this(0, null, null, 0, null, null, null, null);
	}
	
}
