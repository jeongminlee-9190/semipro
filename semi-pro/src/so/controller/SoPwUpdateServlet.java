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

import dto.SDTO;
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
		  	//dto: 로그인 값을 가져오기 위함   /  dto2: 비밀번호 변경 후 sinfo값을 업데이트 하기 위함
		  	SoDTO dto = (SoDTO) session.getAttribute("login");
		  	SoDTO dto2 = null;
		  	String soId = dto.getSoId(); //비밀번호를 변경하기 위한 soId를 가져오기
		  
		  	HashMap<String, String> map = new HashMap<>(); //soPasswd를 저장하기 위한 map
	
		  	SoService service = new SoService();
		  	
		  	Map<String, String> messages = new HashMap<String, String>(); //messages를 저장하기 위한 맵
		  	request.setAttribute("messages", messages);
	    
		  	Captcha captcha = Captcha.load(request, "formCaptcha");
		  	boolean messageValid = true;
		  	String nextPage = "/shopowner/soPwUpdateForm.jsp"; //입력한 캡차 값이 일치하지 않는 경우

		  	session = request.getSession(true);

		  	if (session.getAttribute("isCaptchaSolved") == null) {
		  		// validate the Captcha to check we're not dealing with a bot
		  		boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
		  		if (isHuman) {
		  			// Captcha validation passed, perform protected action
		  			String soPasswd = request.getParameter("soPasswd");
		  			System.out.println(soPasswd);
		  			map.put("soPasswd", soPasswd); //비밀번호를 바꾸기 위해 map에 값을 넣어준다.
		  			map.put("soId", soId);
		  			try {
						service.soPasswdUpdate(map);
						dto2=service.myPage(soId);
						session.setAttribute("login",dto2);
						nextPage="/shopowner/soMyPage.jsp";
					}catch(Exception e) {
						e.printStackTrace();
						nextPage="/error.jsp";
					}
		  			session.setAttribute("isCaptchaSolved", true);
		  			
		  		} else {
		  			// Captcha validation failed, show error message
		  			messages.put("captchaIncorrect", "*");
		  			messageValid = false;
		  		}
		  	}

	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
	    dispatcher.forward(request, response);
	  }
}
