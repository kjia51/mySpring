package com.jia.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	/**
	 * ExceptionHandler
	 * ControllerAdvice : 
	 * 컨트롤러에 대한 예외를 처리하는 객체임을 명시 
	 * 컨트롤러가 실행 중 발생되는 오류이므로 500번 오류가 발생하는 경우 실행
	 * ExceptionHandler : 
	 * Controller, RestController가 적용된 Bean 내에서 발생하는 예외를 하나의 메서드에서 처리해주는 기능
	 * 
	 * @param ex
	 * @param model
	 * @return
	 */
	 
	//상위 Exception 기재
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		System.out.println("Exception...." + ex.getMessage());
		log.info("Exception...");
		log.debug("로그테스트 + debug");
		log.error("로그테스트 + error");
		model.addAttribute("exception", ex);
		
		//페이지 연결
		return "/error/error500";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "/error/error404";
	}
}
