package com.jia.vo;

import lombok.Data;

@Data
public class Criteria {
	private String searchField="";
	private String searchWord="";
	
	int pageNo = 1;	// 요청한 페이지 번호
	int amount = 5; // 한페이지당 보여질 게시물 수
	
	int startNo = 1;
	int endNo = 5;
	
	
	
	public Criteria(int pageNo) {
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount - 1);
		}
	}
	
	public Criteria(String searchField, String searchWord, int pageNo) {
		this.searchField = searchField;
		this.searchWord = searchWord;
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount - 1);
		}
	}

	public Criteria() {
		super();
	}
}
