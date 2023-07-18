package com.jia.vo;

import lombok.Data;

@Data
public class FileuploadVO {
	public String uuid; 
	public String uploadpath; 
	public String filename; 
	public String filetype; 
	public int bno; 
	
	private String savePath;
	private String s_savePath;
	
	//uploadpATH + uuid + "_"
}
