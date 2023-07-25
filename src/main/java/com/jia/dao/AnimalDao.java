package com.jia.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class AnimalDao {
    public static void main(String[] args) {
    	

    	String key = "JWFQQ8%2Fl2mzSIciMFp6OsEWf0FY%2FjZtaVBpKpNb2ga1UmCMhSzskajf3HKN%2Beu3E959Qv6UYx6vq0jKX3tB0hA%3D%3D";


    	String result = "";

    	try {

    		URL url = new URL("https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc?"
    				+ "serviceKey="+key
    				+ "&page=1&perPage=1000&returnType=Json");

    		BufferedReader bf;

    		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

    		result = bf.readLine();

        	JSONParser jsonParser = new JSONParser();
        	JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
        	JSONArray dataArray = (JSONArray)jsonObject.get("data");

        	String sql = "insert into animal values(?,?,?,?,?,?,?)";
    		try (Connection conn = ConnectionUtil.getConnection();){
    			PreparedStatement pstmt = conn.prepareStatement(sql);
    			

            for (Object obj : dataArray) {
                JSONObject dataObject = (JSONObject) obj;
                String fName = (String) dataObject.get("시설명");
                String category = (String) dataObject.get("카테고리3");
                String roadAddress = (String) dataObject.get("도로명주소");
                String phoneNum = (String) dataObject.get("전화번호");
                String operationHour = (String) dataObject.get("운영시간");
                String latitude = (String) dataObject.get("경도");
                String longitude = (String) dataObject.get("위도");
            
            		pstmt.setString(1, fName);
            		pstmt.setString(2, category);
            		pstmt.setString(3, roadAddress);
            		pstmt.setString(4, phoneNum);
            		pstmt.setString(5, operationHour);
            		pstmt.setString(6, latitude);
            		pstmt.setString(7, longitude);
            		int res = pstmt.executeUpdate();
            		
            		System.out.println("SQL 실행:"+res+"개 의 row삽입");
            	}
            }
       	

    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }

}
