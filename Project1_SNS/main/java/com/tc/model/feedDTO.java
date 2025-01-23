package com.tc.model;
import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class feedDTO {
	private int feed_idx ;
	private String feed_title;
	private String feed_content;
	private String feed_date;
	private String user_id;
	private String feed_img;
	private String user_profile;
	private String user_nick;
	

}
