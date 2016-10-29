package fgik.fadlarec.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PerformanceLoggerAspect {

	@Around("execution(* fgik.fadlarec.service.*.save(..))")
	public Object profile(ProceedingJoinPoint pjp) throws Throwable {
		long start = System.currentTimeMillis();
		System.out.println("Metot Öncesi: " + pjp.getSignature());
		Object output = pjp.proceed();
		System.out.println("Metot sonrasi");
		long elapsedTime = System.currentTimeMillis() - start;
		System.out.println("Metot kosturma zamani: " + elapsedTime
				+ " milliseconds.");
		return output;
	}
}
