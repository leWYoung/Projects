package com.tc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class chattingRoomDTO {
	private String room_idx ;
	private String room_title ;
	private String room_info ;
	private String user_id ;
	private String created_at ;
	private String room_limits ;
	private String room_status ;
	
	private String user_profile ;
}
