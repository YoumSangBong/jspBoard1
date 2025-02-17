package org.iclass.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
@WebFilter(urlPatterns = {"*.jsp"})  // 확장자가 jsp 인 url 요청에 대해서 Filter 실행
public class EncodingFilter extends HttpFilter {
	private static final Logger logger = LoggerFactory.getLogger(EncodingFilter.class);

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse)resp;
		//로그 출력의 {} 기호는 printf 의 %s 와 같은 역할이므로 대입될 데이터 개수를 맞춰서 전달합니다.
		logger.info(":::::  요청 전 setEncoding filter : {} {}", request.getServletPath(),"테스트");

		request.setCharacterEncoding("UTF-8");     // 모든 요청의 인코딩을 미리 한번에 처리.
		chain.doFilter(req, resp);
	}

}
