package com.jia.vo;

import lombok.Data;

@Data
public class PageDto {
	int startNo;			
	int endNo;				
	int realEnd;			
	boolean prev, next;		
	
	int total;			
	Criteria criteria;	
	
	public PageDto(int total, Criteria criteria) {
		super();
		this.total = total;
		this.criteria = criteria;

		endNo = (int)(Math.ceil(criteria.pageNo/5.0) * 5);
		startNo = endNo - (5-1);
		
		realEnd = (int)(Math.ceil( (total*1.0)/criteria.getAmount() )); 
		
		endNo = endNo>realEnd ? realEnd : endNo;
		
		prev = startNo > 1 ? true : false;
		next = endNo == realEnd ? false :true;
	}
}
