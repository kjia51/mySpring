package com.jia.aop;



import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import com.jia.service.LogService;
import com.jia.vo.LogVO;

import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j
public class LogAdvice {
	
	/**
	 * AOP(Aspect-Oriented Programming)
	 * 관점 지향 프로그래밍
	 * 핵심 비지니스 로직과 부가적인 관심사(기능)를 분리하여 개발하는 방법론
	 * 코드의 중복을 줄이고 유지보수성을 향상시킬 수 있습니다.
	 *
	 * 부가적인 관심사
	 * 로깅, 보안, 트랜젝션 관리 등 
	 * 어플리케이션에서 공통적으로 처리해야하는 기능
	 * 오류 발생 시 데이터 베이스에 저장
	 */
	
	/*
	 * 포인트 컷 : 언제 어디에 적용할 건지 기술
	 * before : 타켓 객체의 메소드가 실행되기 전 호출되는 어드바이스
	 * JoinPoint 를 통해 파라미터 정보 참조 가능
	 */
//	@Before("execution(* com.jia.service.Board*.*(..))")
//	public void logBefore() {
//		log.info("============");
//	}
	
	/**
	 * joinpoint : 타켓에 대한 정보와 상태를 담고 있는 객체로 매개변수로 받아서 사용
	 * 
	 * @param joinPoint
	 */
	@Before("execution(* com.jia.service.Reply*.*(..))")
	public void logBeforeParams(JoinPoint joinPoint) {
		log.info("============aop==============");
		// object 출력하는 방법
		log.info("param : " + Arrays.toString(joinPoint.getArgs()));
		log.info("target : " + joinPoint.getTarget());
		log.info("Method : " +joinPoint.getSignature().getName());
	}
	
	/**
	 * Around 
	 * 타켓의 메소드가 호출되기 이전 시점과 이후 시점에 모두 처리해야할 필요가 있는 부가 기능 정의
	 * 주업무로직을 실행하기 위해 JoinPoint의 하위 클래스인 proceedingJoinPoint 타입의 마라미터를 필수적으로 선언해야함 
	 * @return
	 */
	

	
	@Autowired
	LogService logService;
	/**
	 * afterthrowing 타켓메서드 실행 중 예외가 발생한 뒤에 실행하는 부가기능 
	 * 오류 발생내역을 테이블에 등록
	 * 
	 * @param joinPoint
	 * @param exception
	 */
	@AfterThrowing(pointcut="execution(* com.jia.service.*.*(..))", throwing="exception")
	public void logException(JoinPoint joinPoint, Exception exception) {
		// 예외가 발생 시 예외 내용을 테이블에 저장합니다
		try{
			LogVO vo = new LogVO();
			vo.setClassname(joinPoint.getTarget().getClass().getName());
			vo.setMethodname(joinPoint.getSignature().getName());
			vo.setParams(Arrays.toString(joinPoint.getArgs()));
			vo.setErrmsg(exception.getMessage());
			logService.insert(vo);
			log.info("============로그테이블 저장===============");
		} catch(Exception e) {
			log.info("로그테이블 저장 중 예외발생");
			log.info(e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	
}
