package com.jia.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Component;

import com.jia.vo.Member;



@Component
public class MemberDao {
	public Member login(Member parammember) {
			Member member = null;
		
		String sql = 
				String.format("select id, name, adminyn, status, grade from member "
				+ "where id='%s' and pw='%s'", parammember.getId(), parammember.getPw());

		
		try (Connection conn = ConnectionUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);){

			if(rs.next()) {
				String name = rs.getString(2);
				String adminYN = rs.getString(3);
				String status = rs.getString(4);
				String grade = rs.getString(5);
				
				member = new Member();
				member.setId(parammember.getId());
				member.setName(name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}
}
