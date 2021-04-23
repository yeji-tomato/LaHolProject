package com.kh.lahol.coffeeclass.model.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ClassSearch {

	private String searchValue;
	private String searchCategory;
	private String searchLocation;
	
}
