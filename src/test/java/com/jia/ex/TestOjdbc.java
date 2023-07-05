package com.jia.ex;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Test;

public class TestOjdbc {
	
	@Test
	public void caclTest() {
		Calc calc = new Calc();
		int res = calc.add(1, 2);
		
		// 예상 결과값 , 실제 결과값 
		assertEquals(3, res);
	}
	
	@Test
	public void ojdbcTest() {
		try {
			// 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 커넥션 생성
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl"
					, "libraryex", "1234");
			ResultSet rs = conn.createStatement().executeQuery("select to_char(sysdate,'yyyy/mm/dd')||'입니다' from dual");
			rs.next();
			
			System.out.println(rs.getString(1));
			System.out.println(conn);
			
			assertNull(conn);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
}
}
