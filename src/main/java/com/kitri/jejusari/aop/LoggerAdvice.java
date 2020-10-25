package com.kitri.jejusari.aop;

import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.common.base.Joiner;

@Component
@Aspect
public class LoggerAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LoggerAdvice.class);
	
//	@Pointcut("within(com.kitri.jejusari..*.controller.*)")
//	public void loggerPointCut() {}
	
	@Pointcut("within(com.kitri.jejusari..*.controller.*)")
	public void onRequest() {}
	
//	@Before("loggerPointCut()")
//	public void startLog(JoinPoint jp) {
//		logger.info("-------------------------------");
//		logger.info(jp.getSignature().toString());
//		logger.info(Arrays.toString(jp.getArgs()));
//		
//	}


	@Around("onRequest()") 
	public Object doLogging(ProceedingJoinPoint pjp) throws Throwable {
		HttpServletRequest request =
				((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

		Map<String, String[]> paramMap = request.getParameterMap();
		String params = "";
		if (paramMap.isEmpty() == false) {
			params = " [" + paramMapToString(paramMap) + "]";
		}

		long start = System.currentTimeMillis();
		try {
			return pjp.proceed(pjp.getArgs()); // 6
		} finally {
			long end = System.currentTimeMillis();
			logger.info("-------------------------------");
			logger.info(pjp.getSignature().toString());
			logger.info(Arrays.toString(pjp.getArgs()));
			logger.info("Request: {} {}{} < {} ({}ms)", request.getMethod(), request.getRequestURI(),
					params, request.getRemoteHost(), end - start);
			logger.info("-------------------------------");
		}
	}

	private String paramMapToString(Map<String, String[]> paramMap) {
		return paramMap.entrySet().stream()
				.map(entry -> String.format("%s -> (%s)",
						entry.getKey(), Joiner.on(",").join(entry.getValue())))
				.collect(Collectors.joining(", "));
	}
}
