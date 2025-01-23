package com.tc.model;

import lombok.Data;

@Data

public class myPageDTO {
	private String follower ;
	private String following ;
	
	private int follow_idx ;
	private String user_id ;
	private String follow_id ;
	
	private String eruser_nick ;
	private String eruser_profile ;
	
	private String inguser_nick ;
	private String inguser_profile ;
}
