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
public class chatDTO {
	private int chat_idx ;
	private int room_idx ;
	private String chatter ;
	private String chatting ;
	private String emoticon ;
	private String chat_file ;
	private String chatted_at ;	
}
