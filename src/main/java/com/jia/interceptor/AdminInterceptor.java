package com.jia.interceptor;


//import java.net.URLEncoder;
//import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.jia.vo.MemberVO;

//@Component
//public class AdminInterceptor implements HandlerInterceptor{
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		HttpSession session = request.getSession();
//		if(session.getAttribute("member") != null) {
//			MemberVO memberVO = (MemberVO)session.getAttribute("member");
//			List<String> role = memberVO.getRole();
//			//권한 체크
//			if(role.contains("ADMIN_ROLE")) {
//				return true;
//			}
//		}
//		//로그인 페이지로 이동
//		String msg = URLEncoder.encode("로그인 후 사용가능한 메뉴입니다.","utf-8");
//		response.sendRedirect("/login?msg="+msg);
//		return false;
//	}
//}
