package com.tc.model;

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

public class cppDTO {
	private int chal_idx;
	private String user_id;
	private String joined_at;
	private String user_nick;
	private String user_profile;
	private String chal_title;
}
