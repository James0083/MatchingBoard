package com.multi.matchingBoard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OutputMessage {
	
	String roomId;
	String from;
	String text;
	String time;

}
