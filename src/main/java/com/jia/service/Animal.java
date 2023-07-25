package com.jia.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Animal {
    public static void main(String[] args) {
	
    	// 인증키 (개인이 받아와야함)
    	String key = "JWFQQ8%2Fl2mzSIciMFp6OsEWf0FY%2FjZtaVBpKpNb2ga1UmCMhSzskajf3HKN%2Beu3E959Qv6UYx6vq0jKX3tB0hA%3D%3D";

    	// 파싱한 데이터를 저장할 변수
    	String result = "";

    	try {

    		URL url = new URL("https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc?"
    				+ "serviceKey="+key
    				+ "&page=1&perPage=10&returnType=Json");

    		BufferedReader bf;

    		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

    		result = bf.readLine();

        	JSONParser jsonParser = new JSONParser();
        	JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
        	JSONArray dataArray = (JSONArray)jsonObject.get("data");

        	String anmailName = "";
            for (Object obj : dataArray) {
                JSONObject dataObject = (JSONObject) obj;
                String facilityName = (String) dataObject.get("시설명");
                System.out.println("Facility Name: " + facilityName);
            }
       	

    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
}