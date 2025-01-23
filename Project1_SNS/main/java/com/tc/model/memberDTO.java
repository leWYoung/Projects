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

public class memberDTO {
	private String user_id ;
    private String user_pw ;
    private String user_nick ;
    private String user_profile ;
    private String user_preference  ;
    private String joined_at ;
}