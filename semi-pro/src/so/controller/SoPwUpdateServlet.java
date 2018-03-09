package so.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.captcha.botdetect.web.servlet.Captcha;

import dto.SoDTO;
import service.SoService;

/**
 * soPasswd 변경
 */
@WebServlet("/SoPwUpdateServlet")
public class SoPwUpdateServlet extends HttpServlet {
	 @Override
	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		  	request.setCharacterEncoding("UTF-8");
		  	response.setCharacterEncoding("UTF-8");
		  	response.setContentType("text/html;charset=UTF-8");
		  	
		  	HttpSession session = request.getSession();
		  	HashMap<String, String> map = new HashMap<>(); //soPasswd를 저장하기 위한 map
		  	SoService service = new SoService();
		  	
		  	Map<String, String> messages = new HashMap<String, String>(); //messages를 저장하기 위한 맵
		  	request.setAttribute("messages", messages);
	    
		  	Captcha captcha = Captcha.load(request, "formCaptcha");
		  	boolean messageValid = true;
		  	String destinationPage = "/soPwUpdateForm.jsp"; //입력한 캡차 값이 일치하지 않는 경우

		  	session = request.getSession(true);

		  	if (session.getAttribute("isCaptchaSolved") == null) {
		  		// validate the Captcha to check we're not dealing with a bot
		  		boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
		  		if (isHuman) {
		  			// Captcha validation passed, perform protected action
		  			String soPasswd = request.getParameter("soPasswd");
		  			map.put("soPasswd", soPasswd);
		  			session.setAttribute("isCaptchaSolved", true);
		  		} else {
		  			// Captcha validation failed, show error message
		  			messages.put("captchaIncorrect", "*");
		  			messageValid = false;
		  		}
		  	}

	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
	    dispatcher.forward(request, response);
	  }
}
